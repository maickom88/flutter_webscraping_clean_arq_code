import 'package:dartz/dartz.dart';
import 'package:frases_e_pensamentos/core/errors/failure.dart';
import 'package:frases_e_pensamentos/features/search_quote/domain/entities/quote.dart';

abstract class IQuoteRepository {
  Future<Either<Failure, List<Quote>>> getQuoteSearch(String search);
}
