import 'package:flutter/material.dart';

import '../data/infos.dart';
import '../data/is_large.dart';
import '../widget/adaptive_padding.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: IsLarge.of(context) ? Axis.horizontal : Axis.vertical,
      children: infos
          .map(
            (info) => AdaptivePadding(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.network(info.imageUrl),
                  ),
                  Text(
                    info.description,
                    textScaleFactor: IsLarge.of(context) ? 1.5 : 1.2,
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
