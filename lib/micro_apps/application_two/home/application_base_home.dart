import 'package:flutter/material.dart';
import 'package:flutter_micro_app/flutter_micro_app.dart';

import '../routes/application_two_route.dart';

class ApplicationTwoHome extends StatelessWidget {
  const ApplicationTwoHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Application 2 Home"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            NavigatorInstance.pop();
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Text('Open Application 2 (Page 1)'),
            onPressed: () {
              NavigatorInstance.pushNamed(ApplicationTwoRoute().page1);
            },
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            child: const Text('Open Application 2 (Page 2)'),
            onPressed: () {
              Navigator.pushNamed(context, ApplicationTwoRoute().page2);
            },
          ),
        ],
      ),
    );
  }
}
