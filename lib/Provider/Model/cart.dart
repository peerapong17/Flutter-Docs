import 'package:flutter/foundation.dart';

import 'fruit/fruit_model.dart';

class Cart with ChangeNotifier {
  List<Fruit> cart = [];
  int totalPrice = 0;
}
