import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frases_e_pensamentos/core/errors/failure.dart';
import 'package:frases_e_pensamentos/features/search_quote/domain/entities/author.dart';
import 'package:frases_e_pensamentos/features/search_quote/domain/repositories/quote_repository.dart';
import 'package:frases_e_pensamentos/features/search_quote/domain/usecases/get_top_authors.dart';
import 'package:mockito/mockito.dart';

class MockQuoteRepository extends Mock implements IQuoteRepository {}

void main() {
  MockQuoteRepository repository;
  GetTopAuthors usecase;

  setUp(() {
    repository = MockQuoteRepository();
    usecase = GetTopAuthors(repository: repository);
  });
  test('A class of type "List of Authors" must be returned', () async {
    when(repository.getTopAuthors()).thenAnswer((_) async => Right(<Author>[]));
    final result = await usecase();
    expect(result | null, isA<List<Author>>());
  });

  test('A class of type "Failure" must be returned', () async {
    when(repository.getTopAuthors())
        .thenAnswer((_) async => Left(DataSourceError()));
    final result = await usecase();
    expect(result.isLeft(), true);
  });
}
