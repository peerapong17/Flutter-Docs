import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_docs/Authentication/login_page.dart';
import 'package:flutter_docs/Form/reusable_input_decoration.dart';
import 'package:flutter_docs/Mixins/validation_mixin.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Model/toast.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage>
    with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  String email = '';
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
                  onFieldSubmitted: (String value) {
                    setState(() {
                      email = value;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      email = value ?? '';
                    });
                  },
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: true,
                  style: TextStyle(fontSize: 20),
                  decoration:
                      reusableInputDecoration("Email", Icons.account_circle),
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
                              .sendPasswordResetEmail(email: email)
                              .then(
                            (value) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return LoginPage();
                                  },
                                ),
                                (route) => false,
                              );
                              final snackBar = SnackBar(
                                content: Text('Please check your Email'),
                                action: SnackBarAction(
                                  label: 'OK',
                                  onPressed: () {
                                    // Some code to undo the change.
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                  },
                                ),
                              );
                              // Find the ScaffoldMessenger in the widget tree
                              // and use it to show a SnackBar.
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                          );
                        } on FirebaseException catch (e) {
                          fToast!.showToast(
                            child: toast(
                                e.message!,
                                Colors.red.shade200.withOpacity(0.8),
                                Icons.close),
                            gravity: ToastGravity.BOTTOM,
                            toastDuration: Duration(seconds: 2),
                          );
                        }
                      }
                    },
                    child: Text(
                      "Send To This Email",
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
