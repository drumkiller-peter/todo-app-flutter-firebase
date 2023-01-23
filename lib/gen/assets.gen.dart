/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesPngGen get png => const $AssetsImagesPngGen();
  $AssetsImagesSvgGen get svg => const $AssetsImagesSvgGen();
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/app_category_json.json
  String get appCategoryJson => 'assets/json/app_category_json.json';

  /// List of all assets
  List<String> get values => [appCategoryJson];
}

class $AssetsImagesPngGen {
  const $AssetsImagesPngGen();

  /// File path: assets/images/png/karya.png
  AssetGenImage get karya => const AssetGenImage('assets/images/png/karya.png');

  /// File path: assets/images/png/karya_logo.png
  AssetGenImage get karyaLogo =>
      const AssetGenImage('assets/images/png/karya_logo.png');

  /// File path: assets/images/png/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/png/logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [karya, karyaLogo, logo];
}

class $AssetsImagesSvgGen {
  const $AssetsImagesSvgGen();

  $AssetsImagesSvgCategoriesGen get categories =>
      const $AssetsImagesSvgCategoriesGen();

  /// File path: assets/images/svg/facebook.svg
  String get facebook => 'assets/images/svg/facebook.svg';

  /// File path: assets/images/svg/google.svg
  String get google => 'assets/images/svg/google.svg';

  /// File path: assets/images/svg/highinflutter.svg
  String get highinflutter => 'assets/images/svg/highinflutter.svg';

  /// File path: assets/images/svg/karya_logo.svg
  String get karyaLogo => 'assets/images/svg/karya_logo.svg';

  /// File path: assets/images/svg/linkedIn.svg
  String get linkedIn => 'assets/images/svg/linkedIn.svg';

  /// List of all assets
  List<String> get values =>
      [facebook, google, highinflutter, karyaLogo, linkedIn];
}

class $AssetsImagesSvgCategoriesGen {
  const $AssetsImagesSvgCategoriesGen();

  /// File path: assets/images/svg/categories/appointments_task.svg
  String get appointmentsTask =>
      'assets/images/svg/categories/appointments_task.svg';

  /// File path: assets/images/svg/categories/financial_task.svg
  String get financialTask => 'assets/images/svg/categories/financial_task.svg';

  /// File path: assets/images/svg/categories/health_related_task.svg
  String get healthRelatedTask =>
      'assets/images/svg/categories/health_related_task.svg';

  /// File path: assets/images/svg/categories/personal_task.svg
  String get personalTask => 'assets/images/svg/categories/personal_task.svg';

  /// File path: assets/images/svg/categories/relationship_task.svg
  String get relationshipTask =>
      'assets/images/svg/categories/relationship_task.svg';

  /// File path: assets/images/svg/categories/shopping_task.svg
  String get shoppingTask => 'assets/images/svg/categories/shopping_task.svg';

  /// File path: assets/images/svg/categories/study_task.svg
  String get studyTask => 'assets/images/svg/categories/study_task.svg';

  /// File path: assets/images/svg/categories/travel_planning_task.svg
  String get travelPlanningTask =>
      'assets/images/svg/categories/travel_planning_task.svg';

  /// File path: assets/images/svg/categories/work_task.svg
  String get workTask => 'assets/images/svg/categories/work_task.svg';

  /// List of all assets
  List<String> get values => [
        appointmentsTask,
        financialTask,
        healthRelatedTask,
        personalTask,
        relationshipTask,
        shoppingTask,
        studyTask,
        travelPlanningTask,
        workTask
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
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
