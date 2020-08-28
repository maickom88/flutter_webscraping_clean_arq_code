import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/home_controller.dart';
import '../widgets/card_options.dart';
import '../widgets/card_top_authors.dart';

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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            keyboardType: TextInputType.text,
                            autofocus: true,
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
                  SizedBox(height: 20),
                  Text(
                    'Top Autores',
                    style: GoogleFonts.merriweather(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: double.infinity,
                    height: Get.height * 0.25,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      children: [
                        CardTopAuthors(
                          author: 'Luis de camaes',
                          imageNetwork:
                              'https://cdn.pensador.com/img/authors/lu/is/luis-de-camoes-sm.jpg',
                        ),
                        CardTopAuthors(
                          author: 'Friedrich Nietzsche',
                          imageNetwork:
                              'https://cdn.pensador.com/img/authors/fr/ie/friedrich-nietzsche-2-sm.jpg',
                        ),
                        CardTopAuthors(
                          author: 'Mario Quintana',
                          imageNetwork:
                              'https://cdn.pensador.com/img/authors/ma/ri/mario-quintana-2-sm.jpg',
                        ),
                        CardTopAuthors(
                          author: 'Carlos Drummond de Andrade',
                          imageNetwork:
                              'https://cdn.pensador.com/img/authors/ca/rl/carlos-drummond-de-andrade-sm.jpg',
                        ),
                      ],
                    ),
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
    );
  }
}
