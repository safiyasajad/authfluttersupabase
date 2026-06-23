import 'package:authfluttersupabase/auth/auth_service.dart';
import 'package:authfluttersupabase/pages/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //gets auth service
  final authService = AuthService();

  //text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

//sign up button pressed
void signUp() async{
  //prepare data
  final email = _emailController.text.trim();
  final password = _passwordController.text;
  final confirmPassword = _confirmPasswordController.text;


  //check passwords match
  if (password != confirmPassword) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Passwords don't match")));
    return;
  }

  //attempt sign up
  try {
    await authService.signUpWithEmailPassword(email, password);

    //close the register page after sign up
    //AuthGate will decide whether to show ProfilePage or LoginPage
    if (mounted) {
      Navigator.pop(context);
    }

  } catch (e) {
    if(mounted) {
       ScaffoldMessenger.of(context)
       .showSnackBar( SnackBar(content: Text("Error $e")));
    }
  }

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //the app bar gives the page a title as well as the back arrow on the left 
      appBar: AppBar(
        title: const Text("Sign Up")
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 50),
        children: [
          //email 
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: "Email"),
          ),

          //password
          TextField(
            controller: _passwordController,            
            decoration: const InputDecoration(labelText: "Password"),
            obscureText: true, //hides password when typed
          ),

          //confirm password
          TextField(
            controller: _confirmPasswordController,            
            decoration: const InputDecoration(labelText: "Confirm Password"),
            obscureText: true, //hides the password when typed
          ),


          const SizedBox(height: 12), //spacing between the password field and the login button
          //button 
          ElevatedButton(onPressed: signUp, child: const Text("Sign Up"),

          ),
          
          //go to login page to sign in if account already existis 
          GestureDetector(
            onTap:() => Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const LoginPage(),
              )
            ),
            child:Center(child: Text("Already have an account? sign in")),
          )
        ]
      )
    );
  }
}
