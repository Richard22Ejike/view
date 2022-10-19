import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:view/view/screens/addvideo.dart';
import 'package:view/view/screens/messagescreen.dart';
import 'package:view/view/screens/profile.dart';
import 'package:view/view/screens/search.dart';
import 'package:view/view/screens/video.dart';

import '../controllers/auth.dart';

List pages = [
  VideoScreen(),
  SearchScreen(),
  const AddVideoScreen(),
  ChatScreen(),
  ProfileScreen(uid: authController.user.uid),
];

const backgroundColor = Colors.blueGrey;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

var authController = AuthController.instance;