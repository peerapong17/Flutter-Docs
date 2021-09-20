import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_docs/Authentication/todo_page.dart';
import 'package:flutter_docs/Form/reusable_input_decoration.dart';
import 'package:flutter_docs/Mixins/validation_mixin.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'Component/google_btn.dart';
import 'Component/snack_bar.dart';
import 'Services/auth.dart';
import 'forget_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  Auth auth = new Auth();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                      onSaved: (String? value) {
                        email = value!;
                      },
                      validator: MultiValidator(
                          [EmailValidator(errorText: 'Email is not valid')]),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 20),
                      decoration: reusableInputDecoration(
                          "Email", Icons.account_circle),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onSaved: (value) {
                        password = value!;
                      },
                      validator: MultiValidator([
                        MinLengthValidator(6,
                            errorText: 'Password should be 6 or more')
                      ]),
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
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 27),
                        ),
                        onPressed: () async {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            try {
                              await auth.login(email, password);
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return TodoPage();
                                  },
                                ),
                                (route) => false,
                              );
                            } on FirebaseException catch (e) {
                              showAlertSnackbar(context: context, message: e);
                            }
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    googleBtn()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
