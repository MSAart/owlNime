import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButtons extends StatelessWidget {
  CustomButtons({
    required this.colorButton,
    required this.textButton,
    required this.textStyle,
    this.onTap,
    this.widthButtons,
    this.heightButtons,
    Key? key,
  }) : super(key: key);

  final double? widthButtons;
  final double? heightButtons;
  final Color colorButton;
  final String textButton;
  VoidCallback? onTap;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 1,
      child: Container(
        height: (heightButtons == null) ? 40 : heightButtons,
        width: (widthButtons == null) ? double.infinity : widthButtons,
        decoration: BoxDecoration(
          color: colorButton,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
          child: InkWell(
              splashColor: Colors.white,
              borderRadius: BorderRadius.circular(10),
              child: Center(
                  child: Text(
                textButton,
                style: textStyle,
              )),
              onTap: onTap),
        ),
      ),
    );
  }
}
