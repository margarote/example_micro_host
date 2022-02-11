import 'package:example_micro_host/micro_apps/application_one/pages/page_1.dart';
import 'package:example_micro_host/micro_apps/application_one/pages/page_2.dart';
import 'package:example_micro_host/micro_apps/application_one/routes/application_one_route.dart';
import 'package:flutter_micro_app/flutter_micro_app.dart';

import 'home/application_base_home.dart';

class MicroApplicationOne extends ApplicationOneRoute with MicroApp {
  @override
  List<MicroAppPage> get pages => [
        MicroAppPage(
          name: baseRoute.name,
          builder: (context, arguments) => const ApplicationOneHome(),
        ),
        MicroAppPage(
          name: page1,
          builder: (context, arguments) => const Page1(),
        ),
        MicroAppPage(
          name: page2,
          builder: (context, arguments) => const Page2(),
        ),
      ];
  @override
  // Manipulador de eventos (ouvir todos os eventos de micro aplicativos)
  MicroAppEventHandler? get microAppEventHandler => MicroAppEventHandler(
        (data) {
          print(['(MicroApplicationOne) event received:', data.name, data.payload]);
        },
        channels: const ['abc', 'chatbot'],
      );
}
