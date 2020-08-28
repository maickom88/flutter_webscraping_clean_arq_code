import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/constants/routes_pages_consts.dart';
import 'core/routes/routes_navigations.dart';

void main() async {
  var initialRoute = await RoutesPages.initialRoutes;
  runApp(App(initialRoute: initialRoute));
}

class App extends StatelessWidget {
  final String initialRoute;

  const App({Key key, this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frases e Pensamentos',
      initialRoute: initialRoute,
      getPages: Nav.routesPages,
    );
  }
}
