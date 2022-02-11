import 'package:flutter/material.dart';

class AppTwoPage2 extends StatefulWidget {
  const AppTwoPage2({Key? key}) : super(key: key);

  @override
  _AppTwoPage2State createState() => _AppTwoPage2State();
}

class _AppTwoPage2State extends State<AppTwoPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Open Application 2 (Page 2)"),
      ),
      body: SizedBox(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text("Application 2"),
              Text("Page 2"),
            ],
          ),
        ),
      ),
    );
  }
}
