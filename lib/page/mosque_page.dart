import 'dart:math';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../data/mosques.dart';
import '../data/is_large.dart';
import '../widget/adaptive_padding.dart';

class MosquePage extends StatelessWidget {
  const MosquePage({super.key});
  @override
  Widget build(BuildContext context) {
    return PageView(
      allowImplicitScrolling: true,
      scrollDirection: IsLarge.of(context) ? Axis.horizontal : Axis.vertical,
      children:
          mosques
              .where(
                (element) => element.imageUrl != "" && element.mapUrl != "",
              )
              .map(
                (mosque) => AdaptivePadding(
                  child: Column(
                    children: [
                      Text(
                        mosque.name,
                        style: Theme.of(context).textTheme.displayLarge,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8.0),
                      if (mosque.imageUrl != "" && mosque.mapUrl != "")
                        MosquePageItem(mosque: mosque),
                    ],
                  ),
                ),
              )
              .toList(),
    );
  }
}

class MosquePageItem extends StatelessWidget {
  const MosquePageItem({super.key, required this.mosque});
  final Mosque mosque;
  final double spacer = 8.0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          double width = (constraints.maxWidth - spacer) / 2;
          double height = (constraints.maxHeight - spacer) / 2;
          Widget map = Card(
            margin: const EdgeInsets.all(0),
            clipBehavior: Clip.antiAlias,
            child: WebViewWidget(
              controller:
                  WebViewController()
                    ..setJavaScriptMode(JavaScriptMode.unrestricted)
                    ..loadHtmlString(mosque.mapUrl),
            ),
          );
          Widget image = Card(
            margin: const EdgeInsets.all(0),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              "assets/images/${mosque.imageUrl}",
              width: IsLarge.of(context) ? min(width, height) : null,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox();
              },
            ),
          );
          return IsLarge.of(context)
              ? Stack(
                children: [
                  map,
                  Align(alignment: Alignment.topLeft, child: image),
                ],
              )
              : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  image,
                  SizedBox(height: spacer),
                  Expanded(child: map),
                ],
              );
        },
      ),
    );
  }
}
