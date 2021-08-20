import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_docs/Bloc/bloc_model/counter_cubit.dart';
import 'counter_view.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> CounterCubit(),
      child: CounterView(),
    );
  }
}

