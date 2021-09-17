import 'package:flutter/cupertino.dart';

class StatelessProvider extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  set count(int count) {
    _count = count;
    notifyListeners();
  }
}
