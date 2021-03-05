import 'package:flutter/material.dart';
import 'package:fluterandotodoslidy/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ModularApp(module: AppModule()),
  );
}
