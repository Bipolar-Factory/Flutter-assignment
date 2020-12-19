import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstants {
  static const String appName = "Buddy";
  static String primaryFont = GoogleFonts.poppins().fontFamily;

  static const gradientColor1 = const Color(0xFFF54B64);
  static const gradientColor2 = const Color(0xFFF78361);

  static const LinearGradient gradient = LinearGradient(
    colors: [gradientColor1, gradientColor2],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
