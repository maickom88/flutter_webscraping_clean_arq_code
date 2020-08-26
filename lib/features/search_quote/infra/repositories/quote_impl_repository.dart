import 'package:frases_e_pensamentos/features/search_quote/domain/entities/quote.dart';
import 'package:frases_e_pensamentos/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:frases_e_pensamentos/features/search_quote/domain/repositories/quote_repository.dart';
import 'package:frases_e_pensamentos/features/search_quote/infra/datasources/quote_search_datasource.dart';

class QuoteImplRepository implements IQuoteRepository {
  final IQuoteSearchDatasource quoteSearchDatasource;
  QuoteImplRepository(this.quoteSearchDatasource);

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
}
