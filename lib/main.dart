import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pos/firebase_options.dart';
import 'package:pos/res/root/root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}