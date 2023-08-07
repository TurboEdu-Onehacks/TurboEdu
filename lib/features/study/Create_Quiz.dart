import 'package:edunation/features/study/quiz.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({super.key});

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
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
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (c) => Quiz(
                  text: result,
                )));
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
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (c) => Quiz(
                  text: result,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !loading
          ? Center(
              child: ElevatedButton(
                child: Text("Please share the iamge of the chapter"),
                onPressed: () {
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
              ),
            )
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
