import 'dart:io';

import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/quote.dart';
import '../../domain/usecases/get_search_quote.dart';

class HomeController extends GetxController {
  final GetSearchQuote usecase;

  HomeController({
    @required this.usecase,
  });

  RxList quotesList = [].obs;
  Failure failure;

  Future<void> getQuotes(String search) async {
    final result = await usecase(search);
    result.fold((l) {
      failure = l;
      update();
      print(l);
    }, (r) {
      quotesList.value = r;
    });
  }
}
