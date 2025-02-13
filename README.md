# 📸 MJPEG Stream Flutter Package


![mjpegLogo1](https://github.com/user-attachments/assets/56b12d4c-f7d4-4379-ba0c-ba673acb6ba1)



Welcome to **MJPEG Stream Flutter Package**! 🚀 This package allows you to stream MJPEG video in your Flutter application easily. Perfect for real-time camera feeds and IP camera streaming. 📷🎥


![screen2](https://github.com/user-attachments/assets/570e1da7-6df2-4ede-81d9-dbb7f1b4259b){:height="300px" width="400px"}
![screen1](https://github.com/user-attachments/assets/81de7451-4d66-410e-a58b-b37ccd530ef1){:height="300px" width="400px"}



https://github.com/user-attachments/assets/29f279d0-f022-4984-b6a2-f319e316af61



## 🌟 Features
- 📡 Live MJPEG streaming
- 🎨 Customizable width, height, and fit
- ⚡ Optimized for performance
- 🚀 Easy to integrate
- 🛠 Error handling and reconnection support
- 📜 Built-in logging for debugging

---

## 📦 Installation

Run this command:

With Flutter:

```yaml
flutter pub add mjpeg_stream
```



Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  mjpeg_stream: latest_version
```


OR 

```sh
flutter pub add mjpeg_stream
```

Then, run:
```sh
flutter pub get
```

---

## 🛠 Usage

Import the package:

```dart
import 'package:mjpeg_stream/mjpeg_stream.dart';
```

### Example Usage 🎬

```dart
import 'package:flutter/material.dart';
import 'package:mjpeg_stream/mjpeg_stream.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MJPEG Stream Example',
      home: Scaffold(
        appBar: AppBar(title: Text("MJPEG Stream")),
        body: Center(
          child: MJPEGStreamScreen(
            streamUrl: "http://your-ip-camera-url/video.mjpg",
            width: 300.0,
            height: 200.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
```

---

## 📚 Use this Package as a Library

### 📥 Depend on it
Run this command:

With Flutter:

```sh
flutter pub add mjpeg_stream
```

This will add a line like this to your package's `pubspec.yaml` (and run an implicit `flutter pub get`):

```yaml
dependedfdfdfncies:
  mjpeg_stream: ^latest_version
```
 
```yaml
dependencies:
  mjpeg_stream: ^latest_version
```

Alternatively, your editor might support `flutter pub get`. Check the docs for your editor to learn more.

### 📌 Import it
Now in your Dart code, you can use:

```dart
import 'package:mjpeg_stream/mjpeg_stream.dart';
```

---

## ⚙️ API Reference

| Property    | Type        | Description |
|------------|------------|-------------|
| `streamUrl` | `String` | The URL of the MJPEG stream. |
| `fit` | `BoxFit` | Defines how the image should be inscribed into the widget. Default: `BoxFit.cover`. |
| `width` | `double` | Width of the stream display. Default: `double.infinity`. |
| `height` | `double` | Height of the stream display. Default: `300.0`. |
| `timeout` | `Duration` | Timeout for the network request. Default: `5 seconds`. |
| `enableLogging` | `bool` | Enables logging for debugging. Default: `false`. |

---

## 🚀 How It Works

1. The package establishes an HTTP connection to the MJPEG stream.
2. It processes the received image frames in real-time.
3. It updates the UI efficiently without performance issues.
4. It handles errors and reconnection automatically. ⚡
5. It provides logging for debugging purposes. 📜

---

## 🛠 Troubleshooting

- ❗ **Stream Not Loading?** Check if your URL is correct and accessible.
- 🔴 **Slow Performance?** Optimize the network or use a lower resolution stream.
- 💥 **Crashes?** Ensure the stream URL is reachable and error handling is implemented.
- 📝 **Need Debugging?** Enable logging by setting `enableLogging: true`.

---

## 🎯 Future Enhancements

- ✅ Add support for pause/play functionality
- ✅ Improve error handling
- ✅ Optimize performance for low-latency streaming
- ✅ Enhance logging and debugging features

---

## 📝 License
This package is open-source under the MIT License. Feel free to contribute! 😊

👨‍💻 Happy Coding! 🚀

---

## 🔗 Connect with Me
- 🌐 Website: [My Portfolio](https://mohammedshamseerpv.github.io/)
- 💼 LinkedIn: [Mohammed Shamseer](https://www.linkedin.com/in/mohammed-shamseer-pv/)

---

## 💰 Support My Work
If you found this package useful, consider supporting my work:

![qr-code-phonePay](https://github.com/user-attachments/assets/c973da24-bddf-4c8b-9c25-9126e196e9eb)

![Uploading qr-code-phonePay.png…]()





