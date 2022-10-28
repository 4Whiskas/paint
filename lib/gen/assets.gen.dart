/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsColorsGen {
  const $AssetsColorsGen();

  /// File path: assets/colors/colors.xml
  String get colors => 'assets/colors/colors.xml';

  /// List of all assets
  List<String> get values => [colors];
}

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/SF-Pro-Display-Black.otf
  String get sFProDisplayBlack => 'assets/fonts/SF-Pro-Display-Black.otf';

  /// File path: assets/fonts/SF-Pro-Display-Bold.otf
  String get sFProDisplayBold => 'assets/fonts/SF-Pro-Display-Bold.otf';

  /// File path: assets/fonts/SF-Pro-Display-Heavy.otf
  String get sFProDisplayHeavy => 'assets/fonts/SF-Pro-Display-Heavy.otf';

  /// File path: assets/fonts/SF-Pro-Display-Light.otf
  String get sFProDisplayLight => 'assets/fonts/SF-Pro-Display-Light.otf';

  /// File path: assets/fonts/SF-Pro-Display-Medium.otf
  String get sFProDisplayMedium => 'assets/fonts/SF-Pro-Display-Medium.otf';

  /// File path: assets/fonts/SF-Pro-Display-Regular.otf
  String get sFProDisplayRegular => 'assets/fonts/SF-Pro-Display-Regular.otf';

  /// File path: assets/fonts/SF-Pro-Display-Semibold.otf
  String get sFProDisplaySemibold => 'assets/fonts/SF-Pro-Display-Semibold.otf';

  /// File path: assets/fonts/SF-Pro-Display-Thin.otf
  String get sFProDisplayThin => 'assets/fonts/SF-Pro-Display-Thin.otf';

  /// File path: assets/fonts/SF-Pro-Display-Ultralight.otf
  String get sFProDisplayUltralight =>
      'assets/fonts/SF-Pro-Display-Ultralight.otf';

  /// File path: assets/fonts/SF-Pro-Text-Bold.otf
  String get sFProTextBold => 'assets/fonts/SF-Pro-Text-Bold.otf';

  /// List of all assets
  List<String> get values => [
        sFProDisplayBlack,
        sFProDisplayBold,
        sFProDisplayHeavy,
        sFProDisplayLight,
        sFProDisplayMedium,
        sFProDisplayRegular,
        sFProDisplaySemibold,
        sFProDisplayThin,
        sFProDisplayUltralight,
        sFProTextBold
      ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/add.svg
  SvgGenImage get add => const SvgGenImage('assets/icons/add.svg');

  /// File path: assets/icons/brush.svg
  SvgGenImage get brush => const SvgGenImage('assets/icons/brush.svg');

  /// File path: assets/icons/clear.svg
  SvgGenImage get clear => const SvgGenImage('assets/icons/clear.svg');

  /// File path: assets/icons/dropdown_arrow.svg
  SvgGenImage get dropdownArrow =>
      const SvgGenImage('assets/icons/dropdown_arrow.svg');

  /// File path: assets/icons/eraser.svg
  SvgGenImage get eraser => const SvgGenImage('assets/icons/eraser.svg');

  /// File path: assets/icons/faceid.svg
  SvgGenImage get faceid => const SvgGenImage('assets/icons/faceid.svg');

  /// File path: assets/icons/filter.svg
  SvgGenImage get filter => const SvgGenImage('assets/icons/filter.svg');

  /// File path: assets/icons/pencil.svg
  SvgGenImage get pencil => const SvgGenImage('assets/icons/pencil.svg');

  /// File path: assets/icons/rollBack.svg
  SvgGenImage get rollBack => const SvgGenImage('assets/icons/rollBack.svg');

  /// File path: assets/icons/rollForward.svg
  SvgGenImage get rollForward =>
      const SvgGenImage('assets/icons/rollForward.svg');

  /// File path: assets/icons/search.svg
  SvgGenImage get search => const SvgGenImage('assets/icons/search.svg');

  /// File path: assets/icons/touchid.svg
  SvgGenImage get touchid => const SvgGenImage('assets/icons/touchid.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        add,
        brush,
        clear,
        dropdownArrow,
        eraser,
        faceid,
        filter,
        pencil,
        rollBack,
        rollForward,
        search,
        touchid
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/base.png
  AssetGenImage get base => const AssetGenImage('assets/images/base.png');

  /// List of all assets
  List<AssetGenImage> get values => [base];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// File path: assets/translations/ru.json
  String get ru => 'assets/translations/ru.json';

  /// List of all assets
  List<String> get values => [en, ru];
}

class Assets {
  Assets._();

  static const $AssetsColorsGen colors = $AssetsColorsGen();
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
