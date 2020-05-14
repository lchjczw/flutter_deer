import 'package:fluro/fluro.dart';
import 'package:flutter_deer/demo/page/home_page.dart';
import 'package:flutter_deer/routers/router_init.dart';

class DemoRouter implements IRouterProvider {
  static String demoPage = '/demo';

  @override
  void initRouter(Router router) {
    router.define(demoPage,
        handler: Handler(handlerFunc: (_, params) => HomePage()));
  }
}
