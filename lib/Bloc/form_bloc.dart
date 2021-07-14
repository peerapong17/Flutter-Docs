// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_docs/mixins/validation_mixin.dart';


// class Bloc extends Object with ValidationMixin{
//   final _email = StreamController<String>();
//   final _password = StreamTransformer<String, String>();

  

//   Stream<String> get email => _email.stream.transform(checkEmail);
//   Stream<String> get password => _password.stream.transform(checkPassword);

//   Function(String) get changeEmail => _email.sink.add;
//   Function(String) get changePassword => _password.sink.add;
// }

// class Bloc extends Object with ValidationMixin {
//   final _email = StreamController<String>();
//   final _password = StreamController<String>();

//   // Add data to stream
//   Stream<String> get email => _email.stream.transform(checkEmail);
//   Stream<String> get password => _password.stream.transform(checkPassword);

//   // Change data
//   Function(String) get changeEmail => _email.sink.add;
//   Function(String) get changePassword => _password.sink.add;

//   submit() {
//     final validEmail = _email.value;
//     final validPassword = _password.value;

//     print('Email is $validEmail');
//     print('Password is $validPassword');
//   }

//   dispose() {
//     _email.close();
//     _password.close();
//   }
// }