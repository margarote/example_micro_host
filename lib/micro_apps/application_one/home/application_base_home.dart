import 'package:flutter/material.dart';
import 'package:flutter_micro_app/flutter_micro_app.dart';

import '../routes/application_one_route.dart';

class ApplicationOneHome extends StatelessWidget {
  const ApplicationOneHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Application 1 Home"),
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
            child: const Text('Open Application 1 (Page 1)'),
            onPressed: () {
              NavigatorInstance.pushNamed(ApplicationOneRoute().page1);
            },
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            child: const Text('Open Application 1 (Page 2)'),
            onPressed: () {
              Navigator.pushNamed(context, ApplicationOneRoute().page2);
            },
          ),
        ],
      ),
    );
  }
}
