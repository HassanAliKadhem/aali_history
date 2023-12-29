import 'package:flutter/widgets.dart';

class IsLarge extends InheritedWidget {
  final bool isLarge;
  const IsLarge({super.key, required super.child, required this.isLarge});

  static bool of(BuildContext context) {
    assert(context.dependOnInheritedWidgetOfExactType<IsLarge>() != null,
        "IsLarge not found in this context");
    return context.dependOnInheritedWidgetOfExactType<IsLarge>()!.isLarge;
  }

  @override
  bool updateShouldNotify(covariant IsLarge oldWidget) {
    return isLarge != oldWidget.isLarge;
  }
}
