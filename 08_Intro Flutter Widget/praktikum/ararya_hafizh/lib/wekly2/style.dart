import 'package:flutter/material.dart';

Color defaultBG = const Color.fromARGB(255, 255, 253, 245);
Color white = Colors.white;
Color black = Colors.black;
Color purple = const Color.fromARGB(255, 78, 68, 240);

InputDecoration loginTheme = InputDecoration(
  filled: true,
  fillColor: Colors.lightBlue.shade50,
  enabledBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(width: 2, color: Colors.black38),
  ),
  focusedBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(width: 2, color: Colors.black38),
  ),
);

TextStyle roboto = TextStyle(
  fontSize: 14,
  color: black,
  fontFamily: 'Roboto',
);

TextStyle lexend = TextStyle(
  fontSize: 14,
  color: black,
  fontFamily: 'Lexend',
);

TextStyle lexendW = TextStyle(
  fontSize: 14,
  color: white,
  fontFamily: 'Lexend',
);

TextStyle unbounded = TextStyle(
  fontSize: 14,
  color: black,
  fontFamily: 'Unbound',
);
