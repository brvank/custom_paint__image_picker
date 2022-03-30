import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_memory/image_picker_widget.dart';

void main() {
  runApp(GetMaterialApp(title: 'Flutter', home: Flutter()));
}

class Flutter extends StatefulWidget {
  const Flutter({Key? key}) : super(key: key);

  @override
  State<Flutter> createState() => _FlutterState();
}

class _FlutterState extends State<Flutter> {

  late List<CustomImage> images;
  
  @override
  void initState() {
    super.initState();
    images = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(child: Text("Submit"), onPressed: (){
              setState(() {
                images.clear();
              });
            },),
            //This is the widget I am talking about
            ImagePickerWidget(images: images,)
          ],
        ),
      ),
    );
  }
}