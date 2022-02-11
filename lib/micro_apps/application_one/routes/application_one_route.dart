import 'package:flutter_micro_app/flutter_micro_app.dart';

class ApplicationOneRoute extends MicroAppRoutes {
  @override
  MicroAppBaseRoute get baseRoute => MicroAppBaseRoute('/application1/home');
  String get page1 => baseRoute.path('/application1/page1');
  String get page2 => baseRoute.path('/application1/page2');
}
