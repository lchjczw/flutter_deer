import 'package:fluro/fluro.dart';
import 'package:flutter_deer/routers/router_init.dart';

import 'file:///F:/project/kcptun/flutter_deer/lib/demo/page/home_page.dart';

class DemoRouter implements IRouterProvider {
  static String demoPage = '/demo';

  @override
  void initRouter(Router router) {
    router.define(demoPage,
        handler: Handler(handlerFunc: (_, params) => HomePage()));
  }
}
