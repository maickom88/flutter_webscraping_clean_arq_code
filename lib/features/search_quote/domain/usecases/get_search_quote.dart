import 'package:dartz/dartz.dart';
import 'package:frases_e_pensamentos/core/errors/failure.dart';
import 'package:frases_e_pensamentos/features/search_quote/domain/entities/quote.dart';
import 'package:frases_e_pensamentos/features/search_quote/domain/repositories/quote_repository.dart';

class GetSearchQuote {
  final IQuoteRepository repository;

  GetSearchQuote(this.repository);
  Future<Either<Failure, List<Quote>>> call(String search) async {
    if (search == null || search.isEmpty) {
      return Left(InvalidTextSearch());
    }
    return await repository.getQuoteSearch(search);
  }
}
