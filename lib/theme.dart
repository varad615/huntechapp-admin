import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281335820),
      surfaceTint: Color(4288560721),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4284748071),
      onPrimaryContainer: Color(4294945462),
      secondary: Color(4286730584),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294952652),
      onSecondaryContainer: Color(4284363577),
      tertiary: Color(4280617984),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283508488),
      onTertiaryContainer: Color(4294357641),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294965495),
      onSurface: Color(4280490266),
      onSurfaceVariant: Color(4283777604),
      outline: Color(4287132276),
      outlineVariant: Color(4292591810),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281871919),
      inversePrimary: Color(4294947516),
      primaryFixed: Color(4294957533),
      onPrimaryFixed: Color(4282384402),
      primaryFixedDim: Color(4294947516),
      onPrimaryFixedVariant: Color(4286522938),
      secondaryFixed: Color(4294957533),
      onSecondaryFixed: Color(4281536534),
      secondaryFixedDim: Color(4294293182),
      onSecondaryFixedVariant: Color(4284955200),
      tertiaryFixed: Color(4294958024),
      onTertiaryFixed: Color(4281471744),
      tertiaryFixedDim: Color(4294752142),
      onTertiaryFixedVariant: Color(4285152027),
      surfaceDim: Color(4293449431),
      surfaceBright: Color(4294965495),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963441),
      surfaceContainer: Color(4294765290),
      surfaceContainerHigh: Color(4294370533),
      surfaceContainerHighest: Color(4293975775),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281335820),
      surfaceTint: Color(4288560721),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4284748071),
      onPrimaryContainer: Color(4294962156),
      secondary: Color(4284626493),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4288374381),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280617984),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283508488),
      onTertiaryContainer: Color(4294962146),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965495),
      onSurface: Color(4280490266),
      onSurfaceVariant: Color(4283514432),
      outline: Color(4285487708),
      outlineVariant: Color(4287395191),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281871919),
      inversePrimary: Color(4294947516),
      primaryFixed: Color(4290401126),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4288363342),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4288374381),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4286533205),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4288636740),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4286795566),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293449431),
      surfaceBright: Color(4294965495),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963441),
      surfaceContainer: Color(4294765290),
      surfaceContainerHigh: Color(4294370533),
      surfaceContainerHighest: Color(4293975775),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281335820),
      surfaceTint: Color(4288560721),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4284748071),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282062365),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284626493),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280617984),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283508488),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965495),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4281344034),
      outline: Color(4283514432),
      outlineVariant: Color(4283514432),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281871919),
      inversePrimary: Color(4294960872),
      primaryFixed: Color(4286194230),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4284221729),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284626493),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282916903),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4284823320),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283048452),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293449431),
      surfaceBright: Color(4294965495),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963441),
      surfaceContainer: Color(4294765290),
      surfaceContainerHigh: Color(4294370533),
      surfaceContainerHighest: Color(4293975775),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294947516),
      surfaceTint: Color(4294947516),
      onPrimary: Color(4284550693),
      primaryContainer: Color(4282581012),
      onPrimaryContainer: Color(4294542744),
      secondary: Color(4294293182),
      onSecondary: Color(4283245611),
      secondaryContainer: Color(4284429114),
      onSecondaryContainer: Color(4294952909),
      tertiary: Color(4294752142),
      onTertiary: Color(4283376903),
      tertiaryContainer: Color(4281603072),
      onTertiaryContainer: Color(4292516466),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279898386),
      onSurface: Color(4293975775),
      onSurfaceVariant: Color(4292591810),
      outline: Color(4288908173),
      outlineVariant: Color(4283777604),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293975775),
      inversePrimary: Color(4288560721),
      primaryFixed: Color(4294957533),
      onPrimaryFixed: Color(4282384402),
      primaryFixedDim: Color(4294947516),
      onPrimaryFixedVariant: Color(4286522938),
      secondaryFixed: Color(4294957533),
      onSecondaryFixed: Color(4281536534),
      secondaryFixedDim: Color(4294293182),
      onSecondaryFixedVariant: Color(4284955200),
      tertiaryFixed: Color(4294958024),
      onTertiaryFixed: Color(4281471744),
      tertiaryFixedDim: Color(4294752142),
      onTertiaryFixedVariant: Color(4285152027),
      surfaceDim: Color(4279898386),
      surfaceBright: Color(4282529335),
      surfaceContainerLowest: Color(4279503885),
      surfaceContainerLow: Color(4280490266),
      surfaceContainer: Color(4280753438),
      surfaceContainerHigh: Color(4281476904),
      surfaceContainerHighest: Color(4282200627),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294949057),
      surfaceTint: Color(4294947516),
      onPrimary: Color(4281729038),
      primaryContainer: Color(4292636545),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294621890),
      onSecondary: Color(4281141777),
      secondaryContainer: Color(4290413193),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294950036),
      onTertiary: Color(4280946432),
      tertiaryContainer: Color(4290806621),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279898386),
      onSurface: Color(4294965753),
      onSurfaceVariant: Color(4292854982),
      outline: Color(4290157983),
      outlineVariant: Color(4287921536),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293975775),
      inversePrimary: Color(4286654523),
      primaryFixed: Color(4294957533),
      onPrimaryFixed: Color(4281073674),
      primaryFixedDim: Color(4294947516),
      onPrimaryFixedVariant: Color(4285076778),
      secondaryFixed: Color(4294957533),
      onSecondaryFixed: Color(4280681996),
      secondaryFixedDim: Color(4294293182),
      onSecondaryFixedVariant: Color(4283640368),
      tertiaryFixed: Color(4294958024),
      onTertiaryFixed: Color(4280420864),
      tertiaryFixedDim: Color(4294752142),
      onTertiaryFixedVariant: Color(4283837196),
      surfaceDim: Color(4279898386),
      surfaceBright: Color(4282529335),
      surfaceContainerLowest: Color(4279503885),
      surfaceContainerLow: Color(4280490266),
      surfaceContainer: Color(4280753438),
      surfaceContainerHigh: Color(4281476904),
      surfaceContainerHighest: Color(4282200627),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294965753),
      surfaceTint: Color(4294947516),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4294949057),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294965753),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4294621890),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294966008),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294950036),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279898386),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294965753),
      outline: Color(4292854982),
      outlineVariant: Color(4292854982),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293975775),
      inversePrimary: Color(4283958815),
      primaryFixed: Color(4294959074),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4294949057),
      onPrimaryFixedVariant: Color(4281729038),
      secondaryFixed: Color(4294959074),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4294621890),
      onSecondaryFixedVariant: Color(4281141777),
      tertiaryFixed: Color(4294959569),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294950036),
      onTertiaryFixedVariant: Color(4280946432),
      surfaceDim: Color(4279898386),
      surfaceBright: Color(4282529335),
      surfaceContainerLowest: Color(4279503885),
      surfaceContainerLow: Color(4280490266),
      surfaceContainer: Color(4280753438),
      surfaceContainerHigh: Color(4281476904),
      surfaceContainerHighest: Color(4282200627),
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
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );

  /// Custom Color 1
  static const customColor1 = ExtendedColor(
    seed: Color(4283498778),
    value: Color(4283498778),
    light: ColorFamily(
      color: Color(4281335820),
      onColor: Color(4294967295),
      colorContainer: Color(4284748071),
      onColorContainer: Color(4294945462),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(4281335820),
      onColor: Color(4294967295),
      colorContainer: Color(4284748071),
      onColorContainer: Color(4294945462),
    ),
    lightHighContrast: ColorFamily(
      color: Color(4281335820),
      onColor: Color(4294967295),
      colorContainer: Color(4284748071),
      onColorContainer: Color(4294945462),
    ),
    dark: ColorFamily(
      color: Color(4294947516),
      onColor: Color(4284550693),
      colorContainer: Color(4282581012),
      onColorContainer: Color(4294542744),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(4294947516),
      onColor: Color(4284550693),
      colorContainer: Color(4282581012),
      onColorContainer: Color(4294542744),
    ),
    darkHighContrast: ColorFamily(
      color: Color(4294947516),
      onColor: Color(4284550693),
      colorContainer: Color(4282581012),
      onColorContainer: Color(4294542744),
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
