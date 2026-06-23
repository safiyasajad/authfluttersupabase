/*
listening for continous Auth changes
unautheticated = login page 
autheticated = profile page
*/
import 'package:authfluttersupabase/pages/login_page.dart';
import 'package:authfluttersupabase/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget{
  const AuthGate({super.key});
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot){
        //loading 
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        //checkk if there is a valid session currently
        final session = snapshot.hasData? snapshot.data!.session : null;
        if (session != null){
          return const ProfilePage();
          } else {
            return const LoginPage();
        }
      },
    );
  }
}