import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/bloc/counter_bloc.dart';
import 'package:flutter_bloc_practice/bloc/counter_event.dart';
import 'package:flutter_bloc_practice/bloc/counter_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text('${state.counter}', style: TextStyle(fontSize: 24));
              },
            ),
            Row(
              spacing: 5,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementCounterEvent());
                  },
                ),

                ElevatedButton(
                  child: const Icon(Icons.remove),
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementCounterEvent());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
