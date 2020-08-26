import 'package:get/get.dart';
import 'package:web_scraper/web_scraper.dart';

import '../../../features/search_quote/domain/usecases/get_search_quote.dart';
import '../../../features/search_quote/external/datasource/quote_search_datasource_impl.dart';
import '../../../features/search_quote/infra/repositories/quote_impl_repository.dart';
import '../../../features/search_quote/presentation/controller/home_controller.dart';
import '../../constants/url_base_const.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        usecase: GetSearchQuote(
          repository: QuoteImplRepository(
            quoteSearchDatasource: QuoteSearchDatasource(
              webScraper: WebScraper(UrlbaseConsts.urlBase),
            ),
          ),
        ),
      ),
    );
  }
}
