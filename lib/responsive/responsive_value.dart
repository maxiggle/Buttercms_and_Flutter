import 'package:flutter/material.dart';

import 'break_points.dart';

class ResponsiveValue<T> {
  const ResponsiveValue({
    Key? key,
    required this.small,
    required this.large,
    this.medium,
    this.xLarge,
  });

  final T small;
  final T? medium;
  final T large;
  final T? xLarge;

  T getValue(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    if (deviceWidth <= AppBreakpoints.small) {
      return small;
    } else if (deviceWidth <= AppBreakpoints.medium) {
      return (medium ?? large);
    } else if (deviceWidth <= AppBreakpoints.large) {
      return large;
    } else {
      return (xLarge ?? large);
    }
  }
}
