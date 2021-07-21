import 'package:flutter_bloc/flutter_bloc.dart';

class CounterTwoCubit extends Cubit<int> {
  CounterTwoCubit() : super(0);

  void increment() => emit(state + 2);
  void decrement() => emit(state - 2);
}