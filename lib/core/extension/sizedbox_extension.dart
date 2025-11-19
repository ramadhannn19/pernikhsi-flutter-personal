import 'package:flutter/material.dart';

/// Extension methods on [double] for creating [SizedBox] widgets conveniently.
///
/// This extension allows using numeric values directly to
/// create `SizedBox` instances for spacing in layouts.
///
/// Example usage:
/// ```dart
/// // Horizontal spacing of 16 pixels
/// 16.0.width,
///
/// // Vertical spacing of 8 pixels
/// 8.0.height,
///
/// // Square box with both width & height = 24 pixels
/// 24.0.box,
/// ```
extension SizedBoxExtension on double {
  /// Creates a [SizedBox] with width equal to this value.
  SizedBox get width => SizedBox(width: this);

  /// Creates a [SizedBox] with height equal to this value.
  SizedBox get height => SizedBox(height: this);

  /// Creates a [SizedBox] with both width and height
  /// equal to this value (square).
  SizedBox get box => SizedBox(height: this, width: this);
}
