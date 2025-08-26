import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_practice/bloc/counter_event.dart';
import 'package:flutter_bloc_practice/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<IncrementCounterEvent>(_onIncrement);
    on<DecrementCounterEvent>(_onDecrement);
  }
  void _onIncrement(IncrementCounterEvent event, Emitter<CounterState> emit) {
    int counter = state.counter;
    emit(state.copyWith(counter: counter + 1));
  }

  void _onDecrement(DecrementCounterEvent event, Emitter<CounterState> emit) {
    int counter = state.counter;
    emit(state.copyWith(counter: counter - 1));
  }
}
