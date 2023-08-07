import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

import 'flash_card.dart';

class CreateFlashCard extends StatefulWidget {
  const CreateFlashCard({super.key});

  @override
  State<CreateFlashCard> createState() => _CreateFlashCardState();
}

class _CreateFlashCardState extends State<CreateFlashCard> {
  InputImage? image;
  ImagePicker imagePicker = ImagePicker();
  String result = "";
  bool loading = false;
  final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  pickImageFromGalleryAndRecognize() async {
    List<XFile>? pickedFiles = await imagePicker!.pickMultiImage();
    Navigator.pop(context);
    setState(() {
      loading = true;
    });
    for (var pickedFile in pickedFiles) {
      image = InputImage.fromFilePath(pickedFile!.path);
      final RecognizedText recognizedText =
          await textRecognizer.processImage(image!);
      String text = recognizedText.text;
      result += text;
    }
    Navigator.push(context,
        MaterialPageRoute(builder: (c) => FlashCard(textInput: result)));
  }

  pickImageFromCameraAndRecognize() async {
    XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    Navigator.pop(context);
    setState(() {
      loading = true;
    });
    image = InputImage.fromFilePath(pickedFile!.path);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(image!);
    String text = recognizedText.text;
    result = text;
    Navigator.push(context,
        MaterialPageRoute(builder: (c) => FlashCard(textInput: result)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !loading
          ? Center(
              child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text(
                "Upload image of your chanpter",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text("Choose by which mode"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  pickImageFromCameraAndRecognize();
                                },
                                child: Text("Camera")),
                            TextButton(
                                onPressed: () {
                                  pickImageFromGalleryAndRecognize();
                                },
                                child: Text("Gallery")),
                          ],
                        ));
              },
            ))
          : Center(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Text(
                    "Loadin... This may take time But Result of wait is much HIGHER......",
                    softWrap: true,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
            ),
    );
  }
}
