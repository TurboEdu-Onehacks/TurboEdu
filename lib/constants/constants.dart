import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

const appName = "Edunation";

//firebase constants

var firebaseAuth = FirebaseAuth.instance;
var firestore = FirebaseFirestore.instance;

// some user vars

String userName = "";

String userUid = "";

String userEmail = "";

String userState = "";
