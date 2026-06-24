import 'package:authfluttersupabase/auth/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  //supabase setup
  await Supabase.initialize(
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFudW55ZXRyaGhqZGJtcW1uZnFpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODIyODEzMTYsImV4cCI6MjA5Nzg1NzMxNn0.ZYdpFt2YZmtEjHmEc9jicsIghHdp1PCs3wNEkH06yJ4" ,
    url: "https://anunyetrhhjdbmqmnfqi.supabase.co");
    

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, //removes the debug label
      home: AuthGate(),
    );
  }
}
