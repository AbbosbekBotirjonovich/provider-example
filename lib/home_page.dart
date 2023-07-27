import 'package:flutter/material.dart';
import 'package:my_project_example/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CounterProvider>(context,listen: false);
    debugPrint("build");
    return Scaffold(
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return Text(
              value.count.toString(),
              style: const TextStyle(fontSize: 50),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
