import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_playground/other/counter_bloc/counter_bloc.dart';

class BlocPlusHookUsageDemonstration extends HookWidget {
  const BlocPlusHookUsageDemonstration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = useMemoized(() => CounterBloc());

    // We can still use BlocBuilder / BlocProvider & pass bloc instance above
    // instead below useStream
    final stream = useStream(bloc.stream);

    useEffect(
      () {

        // Here we can add BLoC event as well

        log('BlocPlusHookUsageDemonstration.initState alternative');
        return () {
          log('BlocPlusHookUsageDemonstration.dispose alternative');
          bloc.close();
        };
      },
      // Use block is re-triggered if the below key changes
      const [],
    );

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(bloc.state.count.toString()),
            Text(stream.data?.count.toString() ?? '0'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => bloc.add(const IncreaseCounter()),
              child: const Text('increase'),
            ),
          ],
        ),
      ),
    );
  }
}
