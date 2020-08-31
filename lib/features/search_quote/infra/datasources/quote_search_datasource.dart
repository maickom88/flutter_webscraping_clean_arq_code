import '../models/author_model.dart';

import '../models/quote_model.dart';

abstract class IQuoteSearchDatasource {
  Future<List<QuoteModel>> getScrapyngQuote(String search);
  Future<List<AuthorModel>> getTopAuthors();
}
