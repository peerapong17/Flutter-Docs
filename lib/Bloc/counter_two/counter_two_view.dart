import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_docs/Bloc/bloc_model/counter_cubit.dart';
import 'package:flutter_docs/Bloc/bloc_model/counter_two_cubit.dart';

class CounterTwoView extends StatelessWidget {
  const CounterTwoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterTwoCubit, int>(
        builder: (context, state) => Center(
          child: Text(
            '$state',
            style: TextStyle(fontSize: 60),
          ),
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => context.read<CounterTwoCubit>().increment(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: () => context.read<CounterTwoCubit>().decrement(),
            ),
          ),
        ],
      ),
    );
  }
}
