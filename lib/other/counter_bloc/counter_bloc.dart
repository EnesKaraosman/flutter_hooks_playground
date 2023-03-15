import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    log('CounterBloc.init');
    on<IncreaseCounter>((event, emit) {
      emit(CounterState(count: state.count + 1));
    });
    on<DecreaseCounter>((event, emit) {
      emit(CounterState(count: state.count - 1));
    });
  }

  @override
  void onEvent(CounterEvent event) {
    super.onEvent(event);
    log(event.runtimeType.toString());
  }

  @override
  Future<void> close() {
    log('CounterBloc.close');
    return super.close();
  }
}
