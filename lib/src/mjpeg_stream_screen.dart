import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'mjpeg_stream_processor.dart';

class MJPEGStreamScreen extends StatefulWidget {
  final String streamUrl;
  final BoxFit fit;
  final double width;
  final double height;
  final Duration timeout;

  MJPEGStreamScreen({
    required this.streamUrl,
    this.fit = BoxFit.cover,
    this.width = double.infinity,
    this.height = 300.0,
    this.timeout = const Duration(seconds: 5),
  });

  @override
  _MJPEGStreamScreenState createState() => _MJPEGStreamScreenState();
}

class _MJPEGStreamScreenState extends State<MJPEGStreamScreen> {
  late final String stream;
  late final MjpegPreprocessor preprocessor;

  ValueNotifier<MemoryImage?> image = ValueNotifier<MemoryImage?>(null);
  ValueNotifier<List<dynamic>?> errorState = ValueNotifier<List<dynamic>?>(null);

  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    stream = widget.streamUrl;
    preprocessor = MjpegPreprocessor();
    _startStream();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    image.dispose();
    errorState.dispose();
    super.dispose();
  }

  Future<void> _startStream() async {
    try {
      final request = Request("GET", Uri.parse(stream));
      final response = await Client().send(request).timeout(widget.timeout);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<int> _carry = [];

        _subscription = response.stream.listen((chunk) {
          if (_carry.isNotEmpty && _carry.last == 0xFF) {
            if (chunk.first == 0xD9) {
              _carry.add(chunk.first);
              _sendImage(_carry);
              _carry = [];
            }
          }

          for (var i = 0; i < chunk.length - 1; i++) {
            final d = chunk[i];
            final d1 = chunk[i + 1];

            if (d == 0xFF && d1 == 0xD8) {
              _carry = [];
              _carry.add(d);
            } else if (d == 0xFF && d1 == 0xD9 && _carry.isNotEmpty) {
              _carry.add(d);
              _carry.add(d1);
              _sendImage(_carry);
              _carry = [];
            } else if (_carry.isNotEmpty) {
              _carry.add(d);
              if (i == chunk.length - 2) {
                _carry.add(d1);
              }
            }
          }
        }, onError: (error, stack) {
          errorState.value = [error, stack];
          image.value = null;
        }, cancelOnError: true);
      } else {
        errorState.value = [
          HttpException('Stream returned ${response.statusCode} status'),
          StackTrace.current
        ];
        image.value = null;
      }
    } catch (error, stack) {
      errorState.value = [error, stack];
      image.value = null;
    }
  }

  void _sendImage(List<int> chunks) {
    final List<int>? imageData = preprocessor.process(chunks);
    if (imageData != null) {
      final imageMemory = MemoryImage(Uint8List.fromList(imageData));
      image.value = imageMemory;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MJPEG Stream"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          if (errorState.value != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${errorState.value}',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red),
              ),
            ),
          ValueListenableBuilder<MemoryImage?>(
            valueListenable: image,
            builder: (context, currentImage, child) {
              if (currentImage == null) {
                return Center(child: CircularProgressIndicator());
              }
              return Image(
                image: currentImage,
                width: widget.width,
                height: widget.height,
                gaplessPlayback: true,
                fit: widget.fit,
              );
            },
          ),
        ],
      ),
    );
  }
}
