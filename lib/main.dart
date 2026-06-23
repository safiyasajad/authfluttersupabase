import 'package:authfluttersupabase/auth/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  //supabase setup
  await Supabase.initialize(
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBtdXl4Z2dkZWhqeHZzeGt0b3pyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODE3NjE5MTYsImV4cCI6MjA5NzMzNzkxNn0.goLB5_R0gLW-4V3AZ2l-y-9KZxzbaOrDCVyCR_hb-Ms" ,
    url: "https://pmuyxggdehjxvsxktozr.supabase.co");
    

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthGate(),
    );
  }
}
