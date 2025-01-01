import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_app/core/network/global/dio_helper.dart';
import 'package:instagram_clone_app/core/network/local/shared_preference.dart';
import 'package:instagram_clone_app/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await CacheHelper.cachIntialization();
  await DioHelper.initDioHelper();
  await Supabase.initialize(
    url: 'https://eehvwtrhrtombgcbauqc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVlaHZ3dHJocnRvbWJnY2JhdXFjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzU3Njk3MDgsImV4cCI6MjA1MTM0NTcwOH0.RrUVv-DzmxLeVOwCXVjzu4pJu6BGi7LjUon3XR0RAZ8',
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
