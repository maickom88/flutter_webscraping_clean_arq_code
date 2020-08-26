import 'package:frases_e_pensamentos/features/search_quote/domain/usecases/get_search_quote.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class HomeController extends GetxController {
  final GetSearchQuote usecase;

  HomeController({
    @required this.usecase,
  });
}
