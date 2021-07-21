import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_docs/Bloc/bloc_model/counter_two_cubit.dart';

import 'counter_two_view.dart';

class CounterTwoPage extends StatelessWidget {
  const CounterTwoPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterTwoCubit(),
      child: CounterTwoView(),
    );
  }
}

