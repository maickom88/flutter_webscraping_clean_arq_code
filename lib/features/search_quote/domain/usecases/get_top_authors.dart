import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failure.dart';
import '../entities/author.dart';
import '../repositories/quote_repository.dart';

class GetTopAuthors {
  final IQuoteRepository repository;

  GetTopAuthors({
    @required this.repository,
  });

  Future<Either<Failure, List<Author>>> call() async {
    return await repository.getTopAuthors();
  }
}
