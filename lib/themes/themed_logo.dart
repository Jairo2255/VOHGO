import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThemedLogo extends StatelessWidget {
  const ThemedLogo({
    super.key,
    required this.lightModeAsset,
    required this.darkModeAsset,
    required this.width,
    required this.height,
  });

  final String lightModeAsset;
  final String darkModeAsset;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final logoAsset = isDarkMode ? darkModeAsset : lightModeAsset;

    return SvgPicture.asset(
      logoAsset,
      width: width,
      height: height,
    );
  }
}
