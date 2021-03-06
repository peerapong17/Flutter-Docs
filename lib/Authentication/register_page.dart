import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_docs/Authentication/Component/snack_bar.dart';
import 'package:flutter_docs/Authentication/todo_page.dart';
import 'package:flutter_docs/Form/reusable_input_decoration.dart';
import 'package:flutter_docs/Mixins/validation_mixin.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'Services/auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with ValidationMixin {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  Auth auth = new Auth();

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
                    email = value!;
                  },
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Email is required"),
                    EmailValidator(errorText: "Email is not valid")
                  ]),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(fontSize: 20),
                  decoration:
                      reusableInputDecoration("Email", Icons.account_circle),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onSaved: (value) {
                    password = value!;
                  },
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Password is required"),
                    MinLengthValidator(6,
                        errorText:
                            "Password should be at least 6 characters long")
                  ]),
                  obscureText: true,
                  style: TextStyle(fontSize: 20),
                  decoration: reusableInputDecoration(
                      "Password", Icons.enhanced_encryption),
                  textInputAction: TextInputAction.done,
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
                          await auth.register(email, password);
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
