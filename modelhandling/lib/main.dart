import 'package:flutter/material.dart';
import 'package:modelhandling/controller/chat_controller.dart';
import 'package:modelhandling/screen/chat_screen.dart';
import 'package:modelhandling/screen/login_screen.dart';
import 'package:modelhandling/screen/student_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://lgdpdagnzvnnitugxfsi.supabase.co",
    anonKey:"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxnZHBkYWduenZubml0dWd4ZnNpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzQ4MTM2NTQsImV4cCI6MjA5MDM4OTY1NH0.WABh1kAh1aPiJ_5qc21vm6DiDi2Sg9dd5rxjPMtWchQ",
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Info Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: ChatPage(username: "",),
    );
  }
}