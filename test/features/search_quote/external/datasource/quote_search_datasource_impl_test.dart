import 'package:flutter_test/flutter_test.dart';
import 'package:frases_e_pensamentos/core/constants/url_base_const.dart';
import 'package:frases_e_pensamentos/core/errors/failure.dart';
import 'package:frases_e_pensamentos/features/search_quote/external/datasource/quote_search_datasource_impl.dart';
import 'package:frases_e_pensamentos/features/search_quote/infra/models/author_model.dart';
import 'package:frases_e_pensamentos/features/search_quote/infra/models/quote_model.dart';
import 'package:mockito/mockito.dart';
import 'package:web_scraper/web_scraper.dart';

class MockWebScraper extends Mock implements WebScraper {}

void main() {
  QuoteSearchDatasource datasource;
  WebScraper webScraper;

  setUp(() {
    webScraper = WebScraper(UrlbaseConsts.urlBase);
    datasource = QuoteSearchDatasource(webScraper: webScraper);
  });

  group('List<QuoteModel>', () {
    test('A class of type "List<QuoteModel>" must be returned', () async {
      final result = await datasource.getScrapyngQuote('pedro');
      expect(result, isA<List<QuoteModel>>());
    });

    test('A class of type "DataSourceError" must be returned', () async {
      final result = datasource.getScrapyngQuote('joão marcos');
      expect(result, throwsA(isA<DataSourceError>()));
    });
  });

  group('List<Aut>', () {
    test('A class of type "List<AuthorModel>" must be returned', () async {
      final result = await datasource.getTopAuthors();
      expect(result, isA<List<AuthorModel>>());
    });

    test('A class of type "DataSourceError" must be returned', () async {
      final result = datasource.getTopAuthors();
      expect(result, throwsA(isA<DataSourceError>()));
    });
  });
}
