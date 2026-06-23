import 'package:authfluttersupabase/auth/auth_service.dart';
import 'package:authfluttersupabase/pages/register_page.dart';
import 'package:flutter/material.dart';

// LoginPage is a StatefulWidget because it owns TextEditingControllers.
// Controllers keep track of the current text typed into the email/password
// fields, and they belong in State so the same controller instances can live
// across rebuilds of the widget.
class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  // Creates the mutable state object where the login logic, controllers,
  // and UI-building code for this page are stored.
  State<LoginPage> createState() => _LoginPageState(); 
  }
  
class _LoginPageState extends State<LoginPage> {
  //gets auth service
  final authService = AuthService();

  // Controller for the email input field.
  // When the user types an email address into the TextField, Flutter stores
  // the current value here so it can be read when the login button is pressed.
  final _emailController = TextEditingController();

  // Controller for the password input field.
  // The current password text is read from this controller inside login().
  final _passwordController = TextEditingController();

  // Runs when the user presses the login button.
  // The method is async because signing in with Supabase requires a network
  // request, and the app needs to wait for that request to finish.
  void login() async{
    // Read the latest values typed into the text fields.
    // These values are passed to Supabase through AuthService.
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    // Attempt to sign in using the email and password.
    // If the credentials are valid, Supabase updates the current auth session.
    // AuthGate listens for that auth session change and can then move the user
    // away from LoginPage to the authenticated area of the app.
    try{
    await authService.signInWithEmailPassword(email, password);
    }

    catch (e) {
      // mounted checks that this page is still on screen before using context.
      // This avoids calling ScaffoldMessenger after the widget has been removed
      // from the widget tree while the async login request was running.
      if (mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
      }
    }
  }


  // Builds the visual structure for this page.
  // Right now it returns an empty Scaffold, which means the page has a valid
  // Material screen structure but no visible login form yet.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Login")),
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

          ),

          const SizedBox(height: 12), //spacing between the password field and the login button
          //button 
          ElevatedButton(onPressed: login, child: const Text("Login")
          ),
          
          //go to register page to sign up
          GestureDetector(
            onTap:() => Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const RegisterPage(),
              )
            ),
            child:Center(child: Text("Don't have an account? sign up")),
          )
        ]
      )
    );
  }
}
