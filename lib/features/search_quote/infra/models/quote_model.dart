import 'package:meta/meta.dart';
import 'package:frases_e_pensamentos/features/search_quote/domain/entities/quote.dart';

class QuoteModel extends Quote {
  final String quote;
  final String author;
  final String imageQuote;

  QuoteModel({
    @required this.quote,
    @required this.author,
    @required this.imageQuote,
  }) : super(quote: quote, author: author, imageQuote: imageQuote);

  Map<String, dynamic> toMap() {
    return {
      'quote': quote,
      'author': author,
      'imageQuote': imageQuote,
    };
  }

  factory QuoteModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return QuoteModel(
      quote: map['quote'],
      author: map['author'],
      imageQuote: map['imageQuote'],
    );
  }
}
