import 'package:flutter/material.dart';

abstract class ThShadows {
  ThShadows._();

  static BoxShadow dropShadow = BoxShadow(
    color: const Color(0xff232A2F).withOpacity(0.08),
    blurRadius: 12.0,
    spreadRadius: 0.0,
    offset: const Offset(0, 3),
  );

  static BoxShadow dropShadowForTag = BoxShadow(
    color: Colors.black.withOpacity(0.07),
    blurRadius: 20.0,
    spreadRadius: 0.0,
    offset: const Offset(0.0, 2.0),
  );
}
