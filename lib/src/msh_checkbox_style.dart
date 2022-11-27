/// The animation/style for an [MSHCheckbox].
enum MSHCheckboxStyle {
  /// Draws a circle and a check mark inside.
  stroke,

  /// Scales in the fill color (from the center) for the circle, while fading in the
  /// check mark.
  ///
  /// The fill color is given by [MSHCheckbox.checkedColor], and the check mark
  /// will be colored white.
  fillScaleColor,

  /// Fades in a filled circle, while scaling in the check mark.
  ///
  /// The fill color is given by [MSHCheckbox.checkedColor], and the check mark
  /// will be colored white.
  fillScaleCheck,

  /// Fades in both a filled circle and a check mark - No scaling animation.
  ///
  /// The fill color is given by [MSHCheckbox.checkedColor], and the check mark
  /// will be colored white.
  fillFade,
}
