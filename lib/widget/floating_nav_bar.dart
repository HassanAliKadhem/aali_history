import 'dart:ui';

import 'package:flutter/material.dart';

import '../data/is_large.dart';

class FloatingNavigationBar extends StatelessWidget {
  const FloatingNavigationBar({
    super.key,
    required this.homePageIcons,
    required this.selectedPage,
    required this.onSelected,
    this.navButtonSize = 52,
  });
  final List<Icon> homePageIcons;
  final int selectedPage;
  final Function(int value) onSelected;
  final int navButtonSize;

  @override
  Widget build(BuildContext context) {
    List<Widget> items = homePageIcons
        .map(
          (e) => AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: homePageIcons.indexOf(e) != selectedPage
                  ? null
                  : Colors.red.shade100.withOpacity(0.5),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                onSelected(homePageIcons.indexOf(e));
              },
              child: Padding(
                padding: EdgeInsets.all(navButtonSize / 2),
                child: e,
              ),
            ),
          ),
        )
        .toList();
    return Align(
      alignment:
          IsLarge.of(context) ? Alignment.centerRight : Alignment.bottomCenter,
      child: FittedBox(
        child: Container(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.all(30),
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(100),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
            child: IsLarge.of(context)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: items,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: items,
                  ),
          ),
        ),
      ),
    );
  }
}
