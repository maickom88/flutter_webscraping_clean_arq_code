import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CardOptions extends StatelessWidget {
  final String title;
  final String image;
  final Function function;

  const CardOptions({
    Key key,
    this.title,
    this.image,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(2, 3),
            color: Colors.black.withOpacity(0.2),
          )
        ],
      ),
      child: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width * 0.43,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: Get.height,
            width: Get.width * 0.43,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.5)
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: Get.height * 0.17,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 8),
              width: Get.width * 0.40,
              height: Get.height * 0.06,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 7,
                    offset: Offset(-1, 3),
                    color: Colors.green.withOpacity(0.4),
                  )
                ],
                color: Colors.green[600],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                title,
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
    );
  }
}
