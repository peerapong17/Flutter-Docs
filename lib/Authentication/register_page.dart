import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_docs/Authentication/welcome_page.dart';
import 'package:flutter_docs/Form/reusable_input_decoration.dart';
import 'package:flutter_docs/Mixins/validation_mixin.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Model/toast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with ValidationMixin {
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
          title: Text('Register Page'),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  onSaved: (String? value) {
                    setState(() {
                      email = value ?? '';
                    });
                  },
                  validator: emailValidator,
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
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 47,
                  child: ElevatedButton(
                    onPressed: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        try {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
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
                                    "Registerd Succesfully",
                                    Colors.greenAccent.shade200
                                        .withOpacity(0.8), Icons.check),
                                gravity: ToastGravity.BOTTOM,
                                toastDuration: Duration(seconds: 2),
                              );
                            },
                          );
                        } on FirebaseException catch (e) {
                          fToast!.showToast(
                            child: toast(e.message!,
                                Colors.red.shade200.withOpacity(0.8), Icons.close),
                            gravity: ToastGravity.BOTTOM,
                            toastDuration: Duration(seconds: 2),
                          );
                        }
                      }
                    },
                    child: Text(
                      "Register",
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
