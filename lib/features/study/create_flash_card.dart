import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:read_pdf_text/read_pdf_text.dart';

class CreateFlashCard extends StatefulWidget {
  const CreateFlashCard({super.key});

  @override
  State<CreateFlashCard> createState() => _CreateFlashCardState();
}

class _CreateFlashCardState extends State<CreateFlashCard> {
  InputImage? image;
  ImagePicker? imagePicker;
  String result = "";
  final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  pickImageFromGalleryAndRecognize() async {
    List<XFile>? pickedFiles = await imagePicker!.pickMultiImage();
    for (var pickedFile in pickedFiles) {
      image = InputImage.fromFilePath(pickedFile!.path);
      final RecognizedText recognizedText =
          await textRecognizer.processImage(image!);
      String text = recognizedText.text;
      result += text;
    }
  }

  pickImageFromCameraAndRecognize() async {
    XFile? pickedFile =
        await imagePicker!.pickImage(source: ImageSource.camera);
    image = InputImage.fromFilePath(pickedFile!.path);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(image!);
    String text = recognizedText.text;
    result = text;
    // Navigator.push(context, route)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: Text("Upload pdf of your chanpter"),
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
      )),
    );
  }
}
