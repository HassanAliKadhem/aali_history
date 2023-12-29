import 'package:flutter/widgets.dart';

import '../data/is_large.dart';

class AdaptivePadding extends StatelessWidget {
  const AdaptivePadding({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: adaptiveEdgeInsets(context),
      child: child,
    );
  }
}

EdgeInsets adaptiveEdgeInsets(BuildContext context) {
  return EdgeInsets.only(
    right: IsLarge.of(context) ? 142 : 42,
    bottom: IsLarge.of(context) ? 42 : 142,
    left: 42,
    top: 42,
  );
}
