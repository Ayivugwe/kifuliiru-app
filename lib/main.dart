import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'intro_screen.dart';
Future<void> main() async {
  await Supabase.initialize(url: 'https://jzylueotpenjojusudox.supabase.co', anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp6eWx1ZW90cGVuam9qdXN1ZG94Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTgwOTk3MTEsImV4cCI6MjAxMzY3NTcxMX0.KfapliWx6pFxGYmil2B2Gy0-aJtzV7kOMrhgU2lyvSA');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(), //load intro screen
    );
  }
}
