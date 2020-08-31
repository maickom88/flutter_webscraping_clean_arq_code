import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frases_e_pensamentos/core/errors/failure.dart';
import 'package:frases_e_pensamentos/features/search_quote/domain/entities/author.dart';
import 'package:frases_e_pensamentos/features/search_quote/domain/entities/quote.dart';
import 'package:frases_e_pensamentos/features/search_quote/infra/datasources/quote_search_datasource.dart';
import 'package:frases_e_pensamentos/features/search_quote/infra/models/author_model.dart';
import 'package:frases_e_pensamentos/features/search_quote/infra/models/quote_model.dart';
import 'package:frases_e_pensamentos/features/search_quote/infra/repositories/quote_impl_repository.dart';
import 'package:mockito/mockito.dart';

class MockQuoteSearchDatasource extends Mock implements IQuoteSearchDatasource {
}

void main() {
  QuoteImplRepository repository;
  MockQuoteSearchDatasource datasource;

  setUp(() {
    datasource = MockQuoteSearchDatasource();
    repository = QuoteImplRepository(quoteSearchDatasource: datasource);
  });

  final tsearch = 'Mario';

  group('List<QuoteModel>', () {
    test('A class of type "List<QuoteModel>" must be returned', () async {
      when(datasource.getScrapyngQuote(any))
          .thenAnswer((_) async => <QuoteModel>[]);

      final result = await repository.getQuoteSearch(tsearch);
      verify(repository.getQuoteSearch(tsearch));
      expect(result | null, isA<List<Quote>>());
    });

    test('A class of type "DataSourceError" must be returned', () async {
      when(repository.getQuoteSearch(any))
          .thenAnswer((_) async => Right(<QuoteModel>[]));
      final result = await repository.getQuoteSearch('sdasd');
      expect(result.fold(id, id), isA<DataSourceError>());
    });
  });

  group('List<AuthorModel>', () {
    test('A class of type "List<AuthorModel>" must be returned', () async {
      when(datasource.getTopAuthors()).thenAnswer((_) async => <AuthorModel>[]);
      final result = await repository.getTopAuthors();
      expect(result | null, isA<List<Author>>());
    });
    test('A class of type "DataSourceError" must be returned', () async {
      when(datasource.getTopAuthors()).thenThrow(DataSourceError());
      final result = await repository.getTopAuthors();
      expect(result.fold(id, id), isA<DataSourceError>());
    });
  });
}
