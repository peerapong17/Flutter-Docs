import 'package:flutter/material.dart';
import 'package:flutter_docs/Form/reusable_input_decoration.dart';
import 'package:flutter_docs/mixins/validation_mixin.dart';

class SteamBuilderPage extends StatefulWidget {
  const SteamBuilderPage({Key? key}) : super(key: key);

  @override
  _SteamBuilderPageState createState() => _SteamBuilderPageState();
}

class _SteamBuilderPageState extends State<SteamBuilderPage> with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Form Section'),
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
                      email = value;
                    });
                  },
                  validator: checkEmail,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: true,
                  style: TextStyle(fontSize: 20),
                  decoration:
                      reusableInputDecoration("Email", Icons.person_add),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onSaved: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  validator: checkPassword,
                  obscureText: true,
                  style: TextStyle(fontSize: 20),
                  decoration:
                      reusableInputDecoration("Password", Icons.vpn_key),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _formKey.currentState!.reset();
                      print('this is your email:$email and password:$password');
                    }
                  },
                  child: Text("Submit"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
