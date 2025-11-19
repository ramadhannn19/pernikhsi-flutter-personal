class MainAssets {
  /// Returns the path of the language flag image based on the provided [code].
  static String pathLanguage(String code) => 'assets/flags/$code.png';

  // -------------------------------- IMAGES -----------------------------------

  static const _baseImagePath = 'assets/images';

  // svgs
  static const logoIconSvg = '$_baseImagePath/svgs/logo-icon.svg';
  static const textLogoSvg = '$_baseImagePath/svgs/text-logo.svg';
  static const logoAppleSvg = '$_baseImagePath/svgs/Apple.svg';
  static const logoGoogleSvg = '$_baseImagePath/svgs/Google.svg';

  // bitmap
  static const background = '$_baseImagePath/bitmaps/background.webp';
  static const planeIcon = '$_baseImagePath/bitmaps/plane-icon.png';

  // ---------------------------- END IMAGES -----------------------------------

  // ------------------------------ OTHER --------------------------------------

  // ----------------------------- END OTHER ----------------------------------
}
