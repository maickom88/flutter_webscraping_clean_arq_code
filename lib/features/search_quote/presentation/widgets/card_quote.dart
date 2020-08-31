import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'buttons_container.dart';

class CardQuote extends StatelessWidget {
  final String quote;
  final String author;
  final String image;

  const CardQuote({Key key, this.quote, this.author, this.image})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              quote,
              style: GoogleFonts.merriweather(
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonsContainer(
                    icon: Icon(
                      Icons.image,
                      color: Colors.white,
                      size: 22,
                    ),
                    text: 'Ver Imagem',
                    onPressed: () => print(1),
                  ),
                  SizedBox(width: 10),
                  ButtonsContainer(
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 22,
                    ),
                    text: 'Compartilhar',
                    onPressed: () => print(2),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
