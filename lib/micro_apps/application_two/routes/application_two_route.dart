import 'package:flutter_micro_app/flutter_micro_app.dart';

class ApplicationTwoRoute extends MicroAppRoutes {
  @override
  MicroAppBaseRoute get baseRoute => MicroAppBaseRoute('/application2/home');
  String get page1 => baseRoute.path('/application2/page1');
  String get page2 => baseRoute.path('/application2/page2');
}
