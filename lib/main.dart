import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_app/screens/main_audio_book_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey:
        'AIzaSyBEdvf6KNU1sJ6dtzvYRrDoDfnu0PWHDcA', // in google_service.json file
    appId: '1:443537329159:android:3275659dd6dab7c2e4aea2',
    messagingSenderId: '443537329159',
    projectId: 'study-app-703cd',
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainAudioBookScreen(),
    );
  }
}
