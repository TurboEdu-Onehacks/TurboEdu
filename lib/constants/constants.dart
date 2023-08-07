import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

const appName = "TurboEdu";

//firebase constants

var firebaseAuth = FirebaseAuth.instance;
var firestore = FirebaseFirestore.instance;

// some user vars

String userName = "";

String userUid = "";

String userEmail = "";

String userState = "";
String openaiAPIKEY = "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";
