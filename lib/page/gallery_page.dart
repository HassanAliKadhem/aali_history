import 'dart:math';

import 'package:flutter/material.dart';

import '../data/infos.dart';
import '../data/is_large.dart';
import '../data/mosques.dart';
import '../data/other_images.dart';
import '../widget/adaptive_padding.dart';
import '../widget/image_viewer.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> images = [];
    for (Info info in infos) {
      images.add(info.imageUrl);
    }
    for (Mosque mosque in mosques) {
      if (mosque.imageUrl != "") {
        images.add(mosque.imageUrl);
      }
    }
    for (String image in otherImages) {
      if (image != "") {
        images.add(image);
      }
    }
    return GridView.count(
      padding: adaptiveEdgeInsets(context),
      crossAxisCount: max(1, MediaQuery.sizeOf(context).width ~/ 300),
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      scrollDirection: IsLarge.of(context) ? Axis.horizontal : Axis.vertical,
      children: images
          .map((e) => FittedBox(
                child: GestureDetector(
                  child: Hero(
                    tag: e,
                    child: Image.network(e,errorBuilder: (context, error, stackTrace) {
                            return Text(error.toString());
                          },),
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return ImageViewer(
                          image: Image.network(e,errorBuilder: (context, error, stackTrace) {
                            return Text(error.toString());
                          },),
                          heroTag: e,
                        );
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation.drive(Tween(begin: 0, end: 1)),
                          child: child,
                        );
                      },
                    ));
                  },
                ),
              ))
          .toList(),
    );
  }
}
