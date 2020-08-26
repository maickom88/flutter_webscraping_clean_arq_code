import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/quote.dart';

abstract class IQuoteRepository {
  Future<Either<Failure, List<Quote>>> getQuoteSearch(String search);
}
