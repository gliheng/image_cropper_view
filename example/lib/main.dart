import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper_view/clipper.dart';
import 'package:image_cropper_view/image_cropper_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Image Cropper Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Uint8List? imageData;

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (imageData != null) {
      content = Image.memory(imageData!);
    } else {
      content = const Text('Tap action button to crop an image');
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Image Cropper Demo'), actions: [
        IconButton(
          onPressed: () async {
            var data = await Navigator.of(context)
                .push<ByteData>(MaterialPageRoute(builder: (contex) {
              return ImageCropper(
                image: Image.asset('assets/images/coffee.webp'),
                exportSize: const Size(400, 400),
                clipShape: ClipShape.circle,
                // clipRRectRadius: const Radius.circular(40),
                // clipImage: true,
                // exportBackgroundColor: Colors.red,
              );
            }));
            if (data != null) {
              setState(() {
                imageData = data.buffer.asUint8List();
              });
            }
          },
          icon: const Icon(Icons.camera),
        ),
      ]),
      body: Center(
        child: content,
      ),
    );
  }
}
