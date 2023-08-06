import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

const appName = "Edunation";

//firebase constants

var firebaseAuth = FirebaseAuth.instance;
var firestore = FirebaseFirestore.instance;

// some user vars

String userName = "";

String uid = "";

String userEmail = "";
