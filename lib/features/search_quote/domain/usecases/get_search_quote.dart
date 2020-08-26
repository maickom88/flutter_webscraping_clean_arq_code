import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failure.dart';
import '../entities/quote.dart';
import '../repositories/quote_repository.dart';

class GetSearchQuote {
  final IQuoteRepository repository;

  GetSearchQuote({
    @required this.repository,
  });
  Future<Either<Failure, List<Quote>>> call(String search) async {
    if (search == null || search.isEmpty) {
      return Left(InvalidTextSearch());
    }
    return await repository.getQuoteSearch(search);
  }
}
