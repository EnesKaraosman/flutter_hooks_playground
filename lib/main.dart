import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_playground/comparison/1_set_state.dart';
import 'package:hooks_playground/comparison/1_use_state.dart';
import 'package:hooks_playground/comparison/2_bloc_with_hooks.dart';
import 'package:hooks_playground/comparison/2_standart_bloc_usage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends HookWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Use State'),
            onTap: () => pushWidget(context, const UseStateDemonstration()),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            title: const Text('Set State'),
            onTap: () => pushWidget(context, const SetStateDemonstration()),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            title: const Text('Standard BLoC Usage'),
            onTap: () => pushWidget(context, const StandardBlocUsageDemonstration()),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            title: const Text('BLoc + Hooks Usage'),
            onTap: () => pushWidget(context, const BlocPlusHookUsageDemonstration()),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counter.value += 1,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void pushWidget(BuildContext context, Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => widget));
  }
}
