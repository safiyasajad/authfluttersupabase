import 'package:authfluttersupabase/auth/auth_service.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
  //get auth service

final authService = AuthService();

  //logout button pressed
  void logout() async{ 
    await authService.signOut();  //set from auth_service page
  }

  @override
  Widget build(BuildContext context) {
    final currentEmail = authService.getCurrentUserEmail();
   return Scaffold(
      //the app bar gives the page a title as well as the back arrow on the left 
      appBar: AppBar(
        title: const Text("Profile Page"),
        actions: [
          //logout button
          IconButton(onPressed: logout, 
          icon: const Icon(Icons.logout))
        ]
      ),
      //this will give me the loggedin user's email as the contnt of the page
      body: Center(child: Text(currentEmail.toString()),)
    );
  }
}
