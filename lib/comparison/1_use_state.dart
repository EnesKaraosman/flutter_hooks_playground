import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseStateDemonstration extends HookWidget {
  const UseStateDemonstration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(counter.value.toString()),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => counter.value += 1,
              child: const Text('increase'),
            ),
          ],
        ),
      ),
    );
  }
}
