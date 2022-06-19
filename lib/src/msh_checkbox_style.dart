/// The animation/style for an [MSHCheckbox].
enum MSHCheckboxStyle {
  /// Draws a circle and a checkmark inside.
  stroke,

  /// Bounces in the fill color for the circle, while fading in the
  /// checkmark.
  ///
  /// The fill color is given by [MSHCheckbox.checkedColor], and the checkmark
  /// will be colored white.
  filled,

  /// Fades in a filled circle, while bouncing in the checkmark.
  ///
  /// The fill color is given by [MSHCheckbox.checkedColor], and the checkmark
  /// will be colored white.
  bounce,

  /// Fades in both a filled circle and a checkmark - No bounce animation.
  ///
  /// The fill color is given by [MSHCheckbox.checkedColor], and the checkmark
  /// will be colored white.
  fade,
}
