import 'package:meta/meta.dart';
import 'package:web_scraper/web_scraper.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/extensions/search_string_space.dart';
import '../../infra/datasources/quote_search_datasource.dart';
import '../../infra/models/author_model.dart';
import '../../infra/models/quote_model.dart';

class QuoteSearchDatasource implements IQuoteSearchDatasource {
  final WebScraper webScraper;
  QuoteSearchDatasource({
    @required this.webScraper,
  });

  @override
  Future<List<QuoteModel>> getScrapyngQuote(String search) async {
    var quotes = <Map<String, dynamic>>[];
    if (await webScraper.loadWebPage('/${search.replaceSpacing()}/')) {
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

  @override
  Future<List<AuthorModel>> getTopAuthors() async {
    var authors = <Map<String, dynamic>>[];

    if (await webScraper.loadWebPage('/')) {
      var authorsElement =
          webScraper.getElement('div#topautores > ul > li > a ', ['href']);
      var images =
          webScraper.getElement('div#topautores > ul > li > a > img ', ['src']);
      for (var i = 0; i < authorsElement.length; i++) {
        String nameAuthor = authorsElement[i]['title'];

        if (!nameAuthor.contains('ver todos')) {
          String imageAuthor = images[i]['attributes']['src'];
          String hrefAuthor = authorsElement[i]['attributes']['href'];

          var map = {
            "name": nameAuthor,
            "image": imageAuthor,
            "href": hrefAuthor,
          };
          authors.add(map);
        }
      }
      var listAuthors = authors.map((e) => AuthorModel.fromMap(e)).toList();
      if (listAuthors.length > 0) {
        return listAuthors;
      } else {
        throw DataSourceError();
      }
    } else {
      throw DataSourceError();
    }
  }
}
