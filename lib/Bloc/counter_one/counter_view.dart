import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_docs/Bloc/bloc_model/counter_cubit.dart';

class CounterView extends StatelessWidget {
  const CounterView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterCubit, int>(
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
              onPressed: () => context.read<CounterCubit>().increment(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: () => context.read<CounterCubit>().decrement(),
            ),
          ),
        ],
      ),
    );
  }
}
