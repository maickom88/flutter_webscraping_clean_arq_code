import 'package:meta/meta.dart';
import 'package:web_scraper/web_scraper.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/extensions/search_string_space.dart';
import '../../infra/datasources/quote_search_datasource.dart';
import '../../infra/models/quote_model.dart';

class QuoteSearchDatasource implements IQuoteSearchDatasource {
  final WebScraper webScraper;
  QuoteSearchDatasource({
    @required this.webScraper,
  });

  @override
  Future<List<QuoteModel>> getScrapyngQuote(String search) async {
    List<Map<String, dynamic>> quotes = [];
    if (await webScraper.loadWebPage('${search.replaceSpacing()}/')) {
      var authorsElement = webScraper.getElement(
          'div#phrasesList > div.thought-card > span.autor > a', ['title']);
      var quotesElement = webScraper
          .getElement('div#phrasesList > div.thought-card > p', ['data-alt']);
      var imagesElement = webScraper
          .getElement('div#phrasesList > div.thought-card', ['data-src']);

      for (var i = 0; i < authorsElement.length; i++) {
        var map = {
          "author": authorsElement[i]['title'],
          "quote": quotesElement[i]['title'],
          "imageQuote": imagesElement[i]['attributes']['data-src']
        };
        quotes.add(map);
      }

      var list = quotes.map((e) => QuoteModel.fromMap(e)).toList();
      if (list.length > 0) {
        return list;
      } else {
        throw DataSourceError();
      }
    } else {
      throw DataSourceError();
    }
  }
}
