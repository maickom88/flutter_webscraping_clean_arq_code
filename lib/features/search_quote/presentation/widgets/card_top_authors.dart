import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CardTopAuthors extends StatelessWidget {
  final String imageNetwork;
  final String author;
  final String urlDetails;

  const CardTopAuthors(
      {Key key, this.imageNetwork, this.author, this.urlDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: Get.height,
        width: Get.width * 0.43,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(5), boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(2, 3),
            color: Colors.black.withOpacity(0.4),
          )
        ]),
        child: Stack(
          children: [
            Container(
              height: Get.height,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  imageNetwork,
                  fit: BoxFit.cover,
                  loadingBuilder: (build, widget, event) {
                    if (event == null) return widget;
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              height: Get.height,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  author,
                  style: GoogleFonts.merriweather(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
