import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frases_e_pensamentos/core/errors/failure.dart';
import 'package:frases_e_pensamentos/features/search_quote/domain/entities/quote.dart';
import 'package:frases_e_pensamentos/features/search_quote/domain/repositories/quote_repository.dart';
import 'package:frases_e_pensamentos/features/search_quote/domain/usecases/get_search_quote.dart';
import 'package:mockito/mockito.dart';

class MockQuoteRepository extends Mock implements IQuoteRepository {}

void main() {
  MockQuoteRepository repository;
  GetSearchQuote usecase;

  setUp(() {
    repository = MockQuoteRepository();
    usecase = GetSearchQuote(repository: repository);
  });

  test('A class of type "Quote" must be returned', () async {
    when(repository.getQuoteSearch(any))
        .thenAnswer((_) async => Right(<Quote>[]));

    final result = await usecase('Mario');

    expect(result | null, isA<List<Quote>>());
  });

  test('A class of type "Fialure" must be returned', () async {
    when(repository.getQuoteSearch(any))
        .thenAnswer((_) async => Right(<Quote>[]));
    var result = await usecase(null);
    expect(result.isLeft(), true);
    result = await usecase("");
    expect(result.fold(id, id), isA<InvalidTextSearch>());
  });
}
