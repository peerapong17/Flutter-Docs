import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

Container googleBtn() {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId:
        "684323225080-1lqpj6r9vtinchh70b0lebvlv5sasu7r.apps.googleusercontent.com",
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }
  return Container(
    width: double.infinity,
    height: 50,
    child: Expanded(
      child: SignInButton(
        Buttons.Google,
        onPressed: _handleSignIn,
      ),
    ),
  );
}
