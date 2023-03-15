part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object?> get props => [];
}

class IncreaseCounter extends CounterEvent {
  const IncreaseCounter();
}

class DecreaseCounter extends CounterEvent {
  const DecreaseCounter();
}
