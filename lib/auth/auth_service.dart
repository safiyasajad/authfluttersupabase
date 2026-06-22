import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client; 
  //Gets the singleton Supabase instance that was initialized when your app started. this is from the main.dart file
  //the .client allows for the functionality of user signin/out, insert update delete 

  //sign in with email and password
  Future<AuthResponse> signInWithEmailPassword (
    String email, String password) async {
      return await _supabase.auth.signInWithPassword(
        email: email,
        password: password);
    }
  
  //sign up with email and password
  Future<AuthResponse> signUpWithEmailPassword (
    String email, String password) async {
      return await _supabase.auth.signUp(
        email: email,
        password: password);
    }

  //sign out
  Future<void> signOut() async {
    await _supabase.auth.signOut();
    }

  //getting user's email
  //"If there is a logged-in user, give me their email address. Otherwise return null."
  String? getCurrentUserEmail() { //the '?' indicates that it can return a string or null
    final session = _supabase.auth.currentSession; //to identify if any user is logged in 
    final user = session?.user;
    return user?.email; //will return if user is logged in
  }



}