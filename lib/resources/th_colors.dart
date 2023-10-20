import 'package:flutter/material.dart';

abstract class ThColors {
  ThColors._();

  static const Color primaryPrimary = Color(0xff66bef5);
  static const Color primaryPrimaryShade1 = Color(0xff73c3f4);
  static const Color primaryPrimaryShade2 = Color(0xff1fa0f0);
  static const Color primaryPrimaryShade3 = Color(0xff168bd2);
  static const Color primaryPrimaryShade4 = Color(0xff0e75b5);
  static const Color secondarySecondary = Color(0xff7c91a2);
  static const Color secondarySecondaryShade1 = Color(0xff71899b);
  static const Color secondarySecondaryShade2 = Color(0xff597489);
  static const Color secondarySecondaryShade3 = Color(0xff214159);
  static const Color secondarySecondaryShade4 = Color(0xff1b3a52);

  static const Color ascentAscent = Color(0xff102475);
  static const Color ascentAscentShade = Color(0xffd2eeff);

  static const Color textText1 = Colors.white;
  static const Color textText2 = Color.fromRGBO(255, 255, 255, 0.8);
  static const Color textText3 = Color.fromRGBO(255, 255, 255, 0.5);
  static const Color textText4 = Color(0xffa8bac4);
  static const Color textText5 = Color.fromRGBO(255, 255, 255, 0.2);

  static const Color highlightColorPastelBlu = Color(0xff485a85);
  static const Color highlightColorPastelBluShade = Color(0xff3c404a);
  static const Color highlightColorLightGreyGreen = Color(0xff516d44);
  static const Color highlightColorLightGreyGreenShade = Color(0xff3b4338);
  static const Color highlightColorPaleGold = Color(0xff846c38);
  static const Color highlightColorPaleGoldShade = Color(0xff44413c);
  static const Color highlightColorCarnationPink = Color(0xff7e4757);
  static const Color highlightColorCarnationPinkShade = Color(0xff4a4043);

  static const Color statusColorSuccess = Color(0xff82E282);
  static const Color statusColorInfo = Color(0xff48b5f7);
  static const Color statusColorWarning = Color(0xfff1dd77);
  static const Color statusColorDanger = Color(0xffe38c87);

  static const Color backgroundBG0 = Color(0xff6979BA);
  static const Color backgroundBG1 = Color(0xff37424A);
  static const Color backgroundBG2 = Color(0xff4C5B66);
  static const Color textFormBg = Color.fromRGBO(255, 255, 255, 0.05);

  static const Color categoriesBody = Color(0xffF19C60);
  static const Color categoriesMind = Color(0xff8c7cca);
  static const Color categoriesSleep = Color(0xff6a98dc);
  static const Color categoriesNutrition = Color(0xff3DD174);

  static const Color elementsButtonSecondaryBackground = Color.fromRGBO(255, 255, 255, 0.1);
  static const Color elementsButtonSecondaryText = Colors.white;

  static const LinearGradient lightElementsButtonPrimaryActiveBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFE6954),
      Color(0xFFFF4867),
    ],
  );
}
