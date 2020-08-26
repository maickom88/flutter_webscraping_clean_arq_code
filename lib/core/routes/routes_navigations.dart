import 'package:get/route_manager.dart';
import '../../features/search_quote/presentation/pages/search_quotes_page.dart';
import '../bindings/controllers/home_controller_bindings.dart';
import '../constants/routes_pages_consts.dart';

class Nav {
  static List<GetPage> routesPages = [
    GetPage(
      name: RoutesPages.homePage,
      page: () => SearchQuotesPage(),
      binding: HomeControllerBinding(),
    ),
  ];
}
