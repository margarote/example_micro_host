import 'package:flutter/material.dart';

class AppTwoPage1 extends StatefulWidget {
  const AppTwoPage1({Key? key}) : super(key: key);

  @override
  _AppTwoPage1State createState() => _AppTwoPage1State();
}

class _AppTwoPage1State extends State<AppTwoPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Open Application 2 (Page 1)"),
      ),
      body: SizedBox(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text("Application 2"),
              Text("Page 1"),
            ],
          ),
        ),
      ),
    );
  }
}
