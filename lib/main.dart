import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_managment_system/Pages/Splash_Page/splash_page.dart';
import 'dart:html' as html;

void main() async {
  html.document.title = 'Course-Management-System';
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAzrsfPgnnrMf8wdaAQWOHa8whtdvAfSVU",
          authDomain: "demoproject-42df8.firebaseapp.com",
          // databaseURL: "https://nanny-fairy-default-rtdb.firebaseio.com",
          projectId: "demoproject-42df8",
          storageBucket: "demoproject-42df8.firebasestorage.app",
          messagingSenderId: "107398765856",
          appId: "1:107398765856:web:e640bcc0cac14207b34b45",
          measurementId: "G-SE1FEXNSQR"),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Student Management System',
      showSemanticsDebugger: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}
