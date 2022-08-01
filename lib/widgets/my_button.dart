import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String buttonTitle;
  final Color color, colorTitle;
  final Function onPressed;
  final Widget? icon;
  const MyButton(
      {Key? key,
      required this.buttonTitle,
      required this.color,
      required this.onPressed,
      required this.colorTitle, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      child: MaterialButton(
        minWidth: 150,
        elevation: 3,
        onPressed: () => onPressed(),
        height: 50,
        color: color,
        child: icon != null ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              buttonTitle,
              style: GoogleFonts.getFont('Lato', color: colorTitle, fontSize: 14),
            ),
            icon ?? const SizedBox(),
          ],
        ) : Text(
          buttonTitle,
          style: GoogleFonts.getFont('Lato', color: colorTitle, fontSize: 14),
        ),
      ),
    );
  }
}
