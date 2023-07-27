import 'package:flutter/material.dart';
import 'package:my_project_example/provider/second_provider.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    final provider = Provider.of<SecondProvider>(context, listen: false);
    return Scaffold(
      body: Consumer<SecondProvider>(
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Slider(
                min: 0,
                max: 1,
                value: provider.value,
                onChanged: (val) {
                  debugPrint(val.toString());
                  provider.setValue(val);
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(provider.value)),
                      child: const Center(
                        child: Text("Container 1"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(provider.value)),
                      child: const Center(
                        child: Text("Container 2"),
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
