import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonsContainer extends StatelessWidget {
  final String text;
  final Icon icon;
  final Function onPressed;

  const ButtonsContainer({Key key, this.text, this.onPressed, this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                offset: Offset(2, 3),
                color: Colors.green.withOpacity(0.4),
              )
            ]),
        child: Center(
          child: Row(
            children: [
              icon,
              SizedBox(width: 5),
              Text(
                text,
                style: GoogleFonts.merriweatherSans(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
