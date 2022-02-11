import 'package:flutter/material.dart';
import 'package:flutter_micro_app/flutter_micro_app.dart';

import 'micro_apps/application_one/application_one.dart';
import 'micro_apps/application_one/routes/application_one_route.dart';
import 'micro_apps/application_two/application_two.dart';
import 'micro_apps/application_two/routes/application_two_route.dart';
// Fazer a navegacao para o chatbot ChatbotMicroApp
// Criar dentro do nativo a funcao que vai chamar a rota pra navegacao

void main() {
  MicroAppPreferences.update(MicroAppConfig(nativeEventsEnabled: true, pathSeparator: MicroAppPathSeparator.dot));
  runApp(MyApp());
}

class MyApp extends MicroHostStatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Route? onGenerateRoute(RouteSettings settings, {bool? routeNativeOnError}) {
    //! If you wish native app receive requests to open routes, IN CASE there
    //! is no route registered in Flutter, please set [routeNativeOnError: true]
    final pageRoute = super.onGenerateRoute(settings, routeNativeOnError: true);
    return pageRoute;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Native Host',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: NavigatorInstance.navigatorKey,
      initialRoute: baseRoute.name,
      onGenerateRoute: onGenerateRoute,
      navigatorObservers: [
        HeroController(),
      ],
    );
  }

  @override
  MicroAppBaseRoute get baseRoute => MicroAppBaseRoute('/');

  @override
  MicroAppEventHandler? get microAppEventHandler => null;

  @override
  List<MicroApp> get microApps => [
        /*ChatbotMicroApp()*/
        MicroApplicationOne(),
        MicroApplicationTwo(),
      ];

  @override
  List<MicroAppPage> get pages => [
        MicroAppPage(
          name: baseRoute.name,
          builder: (_, __) => const BaseHomePage(),
        ),
      ];
}

class BaseHomePage extends StatelessWidget {
  const BaseHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amber,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Open Application 1'),
              onPressed: () {
                NavigatorInstance.pushNamed(ApplicationOneRoute().baseRoute.name);
              },
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              child: const Text('Open Application 2'),
              onPressed: () {
                NavigatorInstance.pushNamed(ApplicationTwoRoute().baseRoute.name);
              },
            ),
          ],
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() async {
    // MicroAppEventController().emit(const MicroAppEvent<Map<String, dynamic>>(
    //     name: 'VAI_CARAIOOOOOOOOOO', payload: {'data': 'lorem ipsum'}, channels: ['abc']));
    final isValidEmail =
        await NavigatorInstance.pushNamedNative<bool>('emailValidator', arguments: 'validateEmail:lorem@ipsum.com');
    print('Native says email lorem@ipsum.com is a ${isValidEmail ?? false ? 'valid' : 'invalid'} email');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'AGR VAI',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
