import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_playground/other/counter_bloc/counter_bloc.dart';

class StandardBlocUsageDemonstration extends StatefulWidget {
  const StandardBlocUsageDemonstration({Key? key}) : super(key: key);

  @override
  State<StandardBlocUsageDemonstration> createState() =>
      _StandardBlocUsageDemonstrationState();
}

class _StandardBlocUsageDemonstrationState
    extends State<StandardBlocUsageDemonstration> {

  @override
  void initState() {
    log('_StandardBlocUsageDemonstrationState.initState');
    super.initState();
  }

  @override
  void dispose() {
    log('_StandardBlocUsageDemonstrationState.dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.count.toString()),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context
                        .read<CounterBloc>()
                        .add(const IncreaseCounter()),
                    child: const Text('increase'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
