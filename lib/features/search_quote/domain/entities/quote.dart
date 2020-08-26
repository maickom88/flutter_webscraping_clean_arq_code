import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Quote extends Equatable {
  final String quote;
  final String author;
  final String imageQuote;

  Quote({
    @required this.quote,
    @required this.author,
    @required this.imageQuote,
  });

  @override
  List<Object> get props => [quote, author, imageQuote];
}
