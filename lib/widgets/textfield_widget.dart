import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String? Function(String?) validator;
  void Function(String?)? onsaved;
  String hintext;
  Widget suffixIcon;
  Widget preffixIcon;
  TextStyle style;
  TextStyle hintstyle;
  bool obscureText;
  CustomTextField({
    required this.validator,
    required this.onsaved,
    required this.style,
    required this.hintstyle,
    required this.suffixIcon,
    required this.obscureText,
    required this.hintext,
    required this.preffixIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: const Color(0xff00B2C7),
      validator: validator,
      onSaved: onsaved,
      style: style,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: const Color(0xff030A24).withOpacity(0.7),
        filled: true,
        hintText: hintext,
        hintStyle: hintstyle,
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 5.0),
        prefixIcon: preffixIcon,
        suffixIcon: (obscureText != false) ? suffixIcon : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xffA9BCCF).withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xffA9BCCF).withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.withOpacity(0.4),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.withOpacity(0.4),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
