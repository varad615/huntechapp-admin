import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff30000c),
      surfaceTint: Color(0xff9e3e51),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff641127),
      onPrimaryContainer: Color(0xffffaab6),
      secondary: Color(0xff825158),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffc6cc),
      onSecondaryContainer: Color(0xff5e3339),
      tertiary: Color(0xff250c00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff512708),
      onTertiaryContainer: Color(0xfff6b289),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff23191a),
      onSurfaceVariant: Color(0xff554244),
      outline: Color(0xff887274),
      outlineVariant: Color(0xffdbc0c2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2f),
      inversePrimary: Color(0xffffb2bc),
      primaryFixed: Color(0xffffd9dd),
      onPrimaryFixed: Color(0xff400012),
      primaryFixedDim: Color(0xffffb2bc),
      onPrimaryFixedVariant: Color(0xff7f263a),
      secondaryFixed: Color(0xffffd9dd),
      onSecondaryFixed: Color(0xff331016),
      secondaryFixedDim: Color(0xfff5b6be),
      onSecondaryFixedVariant: Color(0xff673a40),
      tertiaryFixed: Color(0xffffdbc8),
      onTertiaryFixed: Color(0xff321300),
      tertiaryFixedDim: Color(0xfffcb78e),
      onTertiaryFixedVariant: Color(0xff6a3b1b),
      surfaceDim: Color(0xffe8d6d7),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0f1),
      surfaceContainer: Color(0xfffceaea),
      surfaceContainerHigh: Color(0xfff6e4e5),
      surfaceContainerHighest: Color(0xfff0dedf),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff30000c),
      surfaceTint: Color(0xff9e3e51),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff641127),
      onPrimaryContainer: Color(0xffffebec),
      secondary: Color(0xff62363d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff9b666d),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff250c00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff512708),
      onTertiaryContainer: Color(0xffffebe2),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff23191a),
      onSurfaceVariant: Color(0xff513e40),
      outline: Color(0xff6f5a5c),
      outlineVariant: Color(0xff8c7577),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2f),
      inversePrimary: Color(0xffffb2bc),
      primaryFixed: Color(0xffba5366),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff9b3b4e),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff9b666d),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff7f4e55),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff9f6744),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff834f2e),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe8d6d7),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0f1),
      surfaceContainer: Color(0xfffceaea),
      surfaceContainerHigh: Color(0xfff6e4e5),
      surfaceContainerHighest: Color(0xfff0dedf),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff30000c),
      surfaceTint: Color(0xff9e3e51),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff641127),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff3b161d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff62363d),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff250c00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff512708),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff302022),
      outline: Color(0xff513e40),
      outlineVariant: Color(0xff513e40),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2f),
      inversePrimary: Color(0xffffe6e8),
      primaryFixed: Color(0xff7a2236),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff5c0921),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff62363d),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff482027),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff653718),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff4a2204),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe8d6d7),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0f1),
      surfaceContainer: Color(0xfffceaea),
      surfaceContainerHigh: Color(0xfff6e4e5),
      surfaceContainerHighest: Color(0xfff0dedf),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb2bc),
      surfaceTint: Color(0xffffb2bc),
      onPrimary: Color(0xff610e25),
      primaryContainer: Color(0xff430014),
      onPrimaryContainer: Color(0xfff98598),
      secondary: Color(0xfff5b6be),
      onSecondary: Color(0xff4d242b),
      secondaryContainer: Color(0xff5f333a),
      onSecondaryContainer: Color(0xffffc7cd),
      tertiary: Color(0xfffcb78e),
      onTertiary: Color(0xff4f2507),
      tertiaryContainer: Color(0xff341400),
      onTertiaryContainer: Color(0xffda9a72),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1a1112),
      onSurface: Color(0xfff0dedf),
      onSurfaceVariant: Color(0xffdbc0c2),
      outline: Color(0xffa38b8d),
      outlineVariant: Color(0xff554244),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dedf),
      inversePrimary: Color(0xff9e3e51),
      primaryFixed: Color(0xffffd9dd),
      onPrimaryFixed: Color(0xff400012),
      primaryFixedDim: Color(0xffffb2bc),
      onPrimaryFixedVariant: Color(0xff7f263a),
      secondaryFixed: Color(0xffffd9dd),
      onSecondaryFixed: Color(0xff331016),
      secondaryFixedDim: Color(0xfff5b6be),
      onSecondaryFixedVariant: Color(0xff673a40),
      tertiaryFixed: Color(0xffffdbc8),
      onTertiaryFixed: Color(0xff321300),
      tertiaryFixedDim: Color(0xfffcb78e),
      onTertiaryFixedVariant: Color(0xff6a3b1b),
      surfaceDim: Color(0xff1a1112),
      surfaceBright: Color(0xff423637),
      surfaceContainerLowest: Color(0xff140c0d),
      surfaceContainerLow: Color(0xff23191a),
      surfaceContainer: Color(0xff271d1e),
      surfaceContainerHigh: Color(0xff322728),
      surfaceContainerHighest: Color(0xff3d3233),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb8c1),
      surfaceTint: Color(0xffffb2bc),
      onPrimary: Color(0xff36000e),
      primaryContainer: Color(0xffdc6f81),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffabac2),
      onSecondary: Color(0xff2d0a11),
      secondaryContainer: Color(0xffba8289),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffbc94),
      onTertiary: Color(0xff2a0f00),
      tertiaryContainer: Color(0xffc0835d),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1a1112),
      onSurface: Color(0xfffff9f9),
      onSurfaceVariant: Color(0xffdfc4c6),
      outline: Color(0xffb69d9f),
      outlineVariant: Color(0xff947d80),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dedf),
      inversePrimary: Color(0xff81283b),
      primaryFixed: Color(0xffffd9dd),
      onPrimaryFixed: Color(0xff2c000a),
      primaryFixedDim: Color(0xffffb2bc),
      onPrimaryFixedVariant: Color(0xff69152a),
      secondaryFixed: Color(0xffffd9dd),
      onSecondaryFixed: Color(0xff26060c),
      secondaryFixedDim: Color(0xfff5b6be),
      onSecondaryFixedVariant: Color(0xff532a30),
      tertiaryFixed: Color(0xffffdbc8),
      onTertiaryFixed: Color(0xff220a00),
      tertiaryFixedDim: Color(0xfffcb78e),
      onTertiaryFixedVariant: Color(0xff562b0c),
      surfaceDim: Color(0xff1a1112),
      surfaceBright: Color(0xff423637),
      surfaceContainerLowest: Color(0xff140c0d),
      surfaceContainerLow: Color(0xff23191a),
      surfaceContainer: Color(0xff271d1e),
      surfaceContainerHigh: Color(0xff322728),
      surfaceContainerHighest: Color(0xff3d3233),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff9f9),
      surfaceTint: Color(0xffffb2bc),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffb8c1),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffff9f9),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xfffabac2),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffffaf8),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffffbc94),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1a1112),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffff9f9),
      outline: Color(0xffdfc4c6),
      outlineVariant: Color(0xffdfc4c6),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dedf),
      inversePrimary: Color(0xff58061f),
      primaryFixed: Color(0xffffdfe2),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb8c1),
      onPrimaryFixedVariant: Color(0xff36000e),
      secondaryFixed: Color(0xffffdfe2),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xfffabac2),
      onSecondaryFixedVariant: Color(0xff2d0a11),
      tertiaryFixed: Color(0xffffe1d1),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffffbc94),
      onTertiaryFixedVariant: Color(0xff2a0f00),
      surfaceDim: Color(0xff1a1112),
      surfaceBright: Color(0xff423637),
      surfaceContainerLowest: Color(0xff140c0d),
      surfaceContainerLow: Color(0xff23191a),
      surfaceContainer: Color(0xff271d1e),
      surfaceContainerHigh: Color(0xff322728),
      surfaceContainerHighest: Color(0xff3d3233),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );

  /// Custom Color 1
  static const customColor1 = ExtendedColor(
    seed: Color(0xff51011a),
    value: Color(0xff51011a),
    light: ColorFamily(
      color: Color(0xff30000c),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff641127),
      onColorContainer: Color(0xffffaab6),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff30000c),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff641127),
      onColorContainer: Color(0xffffaab6),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff30000c),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff641127),
      onColorContainer: Color(0xffffaab6),
    ),
    dark: ColorFamily(
      color: Color(0xffffb2bc),
      onColor: Color(0xff610e25),
      colorContainer: Color(0xff430014),
      onColorContainer: Color(0xfff98598),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xffffb2bc),
      onColor: Color(0xff610e25),
      colorContainer: Color(0xff430014),
      onColorContainer: Color(0xfff98598),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xffffb2bc),
      onColor: Color(0xff610e25),
      colorContainer: Color(0xff430014),
      onColorContainer: Color(0xfff98598),
    ),
  );


  List<ExtendedColor> get extendedColors => [
    customColor1,
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
