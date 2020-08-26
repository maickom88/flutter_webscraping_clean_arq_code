import 'package:frases_e_pensamentos/features/search_quote/infra/models/quote_model.dart';

abstract class IQuoteSearchDatasource {
  Future<List<QuoteModel>> getScrapyngQuote(String search);
}
