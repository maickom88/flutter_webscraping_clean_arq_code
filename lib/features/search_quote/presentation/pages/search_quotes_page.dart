import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../infra/models/author_model.dart';
import '../../infra/models/quote_model.dart';
import '../controller/home_controller.dart';
import '../widgets/card_options.dart';
import '../widgets/card_quote.dart';
import '../widgets/card_top_authors.dart';
import '../widgets/shimmer_card_load.dart';

class SearchQuotesPage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Stack(
        children: [
          Opacity(
            opacity: 0.4,
            child: Container(
              width: double.infinity,
              height: Get.height,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.grey,
                  BlendMode.saturation,
                ),
                child: Image.network(
                  'https://data.whicdn.com/images/319218798/original.jpg',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.grey[900].withOpacity(0.4),
                  Colors.black45,
                  Colors.black54,
                  Colors.black87,
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 40),
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: Get.height * 0.09,
                              width: Get.width * 0.70,
                              child: TextField(
                                onChanged: (value) {
                                  controller.search.value = value;
                                  controller.load.value = true;
                                  debounce(
                                    controller.search,
                                    (valueSearch) =>
                                        controller.getQuotes(valueSearch),
                                    time: Duration(seconds: 3),
                                  );
                                },
                                keyboardType: TextInputType.text,
                                showCursor: false,
                                style: GoogleFonts.merriweather(
                                  color: Colors.black38,
                                ),
                                decoration: InputDecoration(
                                  fillColor: Colors.white.withOpacity(0.7),
                                  filled: true,
                                  hintText: 'Busque por autor, frase...',
                                  hintStyle: GoogleFonts.merriweather(
                                    color: Colors.black26,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: Get.height * 0.09,
                              width: Get.width * 0.15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.green,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 6,
                                    offset: Offset(2, 3),
                                    color: Colors.green.withOpacity(0.4),
                                  )
                                ],
                              ),
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Obx(
                    () => Visibility(
                      replacement: Column(
                        children: [
                          SizedBox(height: 20),
                          Visibility(
                            replacement: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                width: double.infinity,
                                height: Get.height * 0.8,
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    return ShimmerCardLoad(
                                      height: Get.height * 0.3,
                                    );
                                  },
                                ),
                              ),
                            ),
                            visible: !controller.load.value,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                width: double.infinity,
                                height: Get.height * 0.8,
                                child: GetX<HomeController>(
                                  dispose: (_) => controller.onClose(),
                                  builder: (_) => ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    physics: BouncingScrollPhysics(),
                                    itemCount: controller.quotesList.length,
                                    itemBuilder: (context, index) {
                                      var quote = controller.quotesList[index]
                                          as QuoteModel;
                                      return CardQuote(
                                        quote: quote.quote,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      visible: controller.search.value.isEmpty,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            'Top Autores',
                            style: GoogleFonts.merriweather(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            height: Get.height * 0.25,
                            child: GetX<HomeController>(
                                initState: (_) => controller.getTopAuthor(),
                                dispose: (_) => controller.onClose(),
                                builder: (_) {
                                  if (_.authorsList.length > 0) {
                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: _.authorsList.length,
                                      physics: BouncingScrollPhysics(),
                                      itemBuilder: (builder, index) {
                                        var author =
                                            _.authorsList[index] as AuthorModel;
                                        print(author.name);
                                        return CardTopAuthors(
                                          author: author.name.toString(),
                                          imageNetwork: author.image,
                                          urlDetails: author.href,
                                        );
                                      },
                                    );
                                  } else {
                                    return ListView.builder(
                                      itemCount: 8,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (builder, index) {
                                        return ShimmerCardLoad();
                                      },
                                    );
                                  }
                                }),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Frases e Pensamentos',
                            style: GoogleFonts.merriweather(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Container(
                              width: double.infinity,
                              height: Get.height * 0.45,
                              child: GridView.count(
                                padding: EdgeInsets.only(top: 10),
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 10,
                                crossAxisCount: 2,
                                children: <Widget>[
                                  CardOptions(
                                    image:
                                        'https://images.pexels.com/photos/1667847/pexels-photo-1667847.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                    title: 'Frases de Amor',
                                  ),
                                  CardOptions(
                                    image:
                                        'https://images.pexels.com/photos/220429/pexels-photo-220429.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                                    title: 'Frases de Reflexão',
                                  ),
                                  CardOptions(
                                    image:
                                        'https://images.pexels.com/photos/1116302/pexels-photo-1116302.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                                    title: 'Frases de Amizade',
                                  ),
                                  CardOptions(
                                    image:
                                        'https://images.pexels.com/photos/347135/pexels-photo-347135.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                                    title: 'Frases de Motivação',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
