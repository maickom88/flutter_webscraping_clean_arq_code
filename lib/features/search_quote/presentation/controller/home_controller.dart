import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/usecases/get_search_quote.dart';
import '../../domain/usecases/get_top_authors.dart';

class HomeController extends GetxController {
  final GetSearchQuote usecaseGetSearchQuote;
  final GetTopAuthors usecaseGetAyuthors;

  HomeController({
    @required this.usecaseGetAyuthors,
    @required this.usecaseGetSearchQuote,
  });

  RxList quotesList = [].obs;
  RxList authorsList = [].obs;
  Failure failure;
  RxString search = ''.obs;
  RxBool load = false.obs;

  Future<void> getQuotes(String search) async {
    final result = await usecaseGetSearchQuote(search);
    result.fold((l) {
      failure = l;
      update();
      load.value = false;
      print(l);
    }, (r) {
      quotesList.value = r;
      load.value = false;
    });
  }

  Future<void> getTopAuthor() async {
    final result = await usecaseGetAyuthors();
    result.fold((l) {
      failure = l;
      update();
      print(l);
    }, (r) {
      authorsList.value = r;
    });
  }
}
