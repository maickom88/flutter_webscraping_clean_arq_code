import '../models/quote_model.dart';

abstract class IQuoteSearchDatasource {
  Future<List<QuoteModel>> getScrapyngQuote(String search);
}
