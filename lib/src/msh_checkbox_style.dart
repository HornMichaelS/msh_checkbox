/// The animation/style for an [MSHCheckbox].
enum MSHCheckboxStyle {
  /// Draws a circle and a checkmark inside.
  stroke,

  /// Scales in the fill color (from the center) for the circle, while fading in the
  /// checkmark.
  ///
  /// The fill color is given by [MSHCheckbox.checkedColor], and the checkmark
  /// will be colored white.
  fillScaleColor,

  /// Fades in a filled circle, while scaling in the checkmark.
  ///
  /// The fill color is given by [MSHCheckbox.checkedColor], and the checkmark
  /// will be colored white.
  fillScaleCheck,

  /// Fades in both a filled circle and a checkmark - No scaling animation.
  ///
  /// The fill color is given by [MSHCheckbox.checkedColor], and the checkmark
  /// will be colored white.
  fillFade,
}
