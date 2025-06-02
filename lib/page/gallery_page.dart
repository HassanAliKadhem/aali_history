import 'dart:math';

import 'package:flutter/material.dart';

import '../data/infos.dart';
import '../data/is_large.dart';
import '../data/mosques.dart';
import '../data/other_images.dart';
import '../widget/adaptive_padding.dart';
import '../widget/image_viewer.dart';

final List<String> images = [
  ...infos.map((info) => info.imageUrl),
  ...mosques
      .where((mosque) => mosque.imageUrl != "")
      .map((mosque) => mosque.imageUrl),
  ...otherImages.where((image) => image != ""),
];

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      padding: adaptiveEdgeInsets(context),
      maxCrossAxisExtent: 350,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      scrollDirection: IsLarge.of(context) ? Axis.horizontal : Axis.vertical,
      children:
          images
              .map(
                (e) => FittedBox(
                  child: GestureDetector(
                    child: Hero(
                      tag: e,
                      child: Image.asset(
                        "assets/images/$e",
                        errorBuilder: (context, error, stackTrace) {
                          return Text(error.toString());
                        },
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                          ) {
                            return ImageViewer(
                              image: Image.asset(
                                "assets/images/$e",
                                errorBuilder: (context, error, stackTrace) {
                                  return Text(error.toString());
                                },
                              ),
                              heroTag: e,
                            );
                          },
                          transitionsBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                            child,
                          ) {
                            return FadeTransition(
                              opacity: animation.drive(Tween(begin: 0, end: 1)),
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              )
              .toList(),
    );
  }
}
