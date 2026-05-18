import 'package:flutter/widgets.dart';

enum FormFactor { mobile, tablet, desktop }

/// Breakpoint helpers for mobile / tablet / web-desktop layouts.
class Responsive {
  const Responsive._();

  static const double tabletMin = 600;
  static const double desktopMin = 1024;

  static FormFactor of(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    if (w >= desktopMin) return FormFactor.desktop;
    if (w >= tabletMin) return FormFactor.tablet;
    return FormFactor.mobile;
  }

  static bool isMobile(BuildContext c) => of(c) == FormFactor.mobile;
  static bool isDesktop(BuildContext c) => of(c) == FormFactor.desktop;

  /// Responsive grid column count for content cards.
  static int gridColumns(BuildContext context) {
    switch (of(context)) {
      case FormFactor.mobile:
        return 2;
      case FormFactor.tablet:
        return 3;
      case FormFactor.desktop:
        return 4;
    }
  }

  static double maxContentWidth(BuildContext context) =>
      isDesktop(context) ? 1200 : double.infinity;
}
