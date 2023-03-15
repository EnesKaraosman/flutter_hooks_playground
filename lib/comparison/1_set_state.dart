import 'package:flutter/material.dart';

class SetStateDemonstration extends StatefulWidget {
  const SetStateDemonstration({Key? key}) : super(key: key);

  @override
  State<SetStateDemonstration> createState() => _SetStateDemonstrationState();
}

class _SetStateDemonstrationState extends State<SetStateDemonstration> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(counter.toString()),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter += 1;
                });
              },
              child: const Text('increase'),
            ),
          ],
        ),
      ),
    );
  }
}
