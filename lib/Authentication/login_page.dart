import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_docs/Authentication/welcome_page.dart';
import 'package:flutter_docs/Form/reusable_input_decoration.dart';
import 'package:flutter_docs/Mixins/validation_mixin.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Model/toast.dart';
import 'forget_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  FToast? fToast;

  void initState() {
    super.initState();
    fToast = FToast();
    fToast!.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  onSaved: (String? value) {
                    setState(() {
                      email = value ?? '';
                    });
                  },
                  validator: emailValidator,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 20),
                  decoration:
                      reusableInputDecoration("Email", Icons.account_circle),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onSaved: (value) {
                    setState(() {
                      password = value ?? '';
                    });
                  },
                  validator: passwordValidator,
                  obscureText: true,
                  style: TextStyle(fontSize: 20),
                  decoration: reusableInputDecoration(
                      "Password", Icons.enhanced_encryption),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ForgetPasswordPage();
                        },
                      ),
                    );
                  },
                  child: Text('Forget Password?'),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 47,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email, password: password)
                              .then(
                            (value) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return WelcomePage();
                                  },
                                ),
                                (route) => false,
                              );
                              fToast!.showToast(
                                child: toast(
                                    "Logged in Succesfully",
                                    Colors.greenAccent.shade200
                                        .withOpacity(0.8),
                                    Icons.check),
                                gravity: ToastGravity.BOTTOM,
                                toastDuration: Duration(seconds: 5),
                              );
                            },
                          );
                        } on FirebaseException catch (e) {
                          fToast!.showToast(
                            child: toast(
                                e.message!,
                                Colors.red.shade200.withOpacity(0.8),
                                Icons.close),
                            gravity: ToastGravity.BOTTOM,
                            toastDuration: Duration(seconds: 5),
                          );
                        }
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 27),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
