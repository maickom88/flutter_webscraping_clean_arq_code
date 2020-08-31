import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/author.dart';
import '../../domain/entities/quote.dart';
import '../../domain/repositories/quote_repository.dart';
import '../datasources/quote_search_datasource.dart';

class QuoteImplRepository implements IQuoteRepository {
  final IQuoteSearchDatasource quoteSearchDatasource;
  QuoteImplRepository({
    @required this.quoteSearchDatasource,
  });

  @override
  Future<Either<Failure, List<Quote>>> getQuoteSearch(String search) async {
    try {
      return Right(await quoteSearchDatasource.getScrapyngQuote(search));
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DataSourceError(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Author>>> getTopAuthors() async {
    try {
      return Right(await quoteSearchDatasource.getTopAuthors());
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        DataSourceError(error: e),
      );
    }
  }
}
