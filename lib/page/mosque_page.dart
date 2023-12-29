import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../data/mosques.dart';
import '../data/is_large.dart';
import '../widget/adaptive_padding.dart';

class MosquePage extends StatelessWidget {
  const MosquePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: PageView(
        scrollDirection: IsLarge.of(context) ? Axis.horizontal : Axis.vertical,
        children: mosques
            .where((element) => element.imageUrl != "" && element.mapUrl != "")
            .map(
              (mosque) => AdaptivePadding(
                child: Column(
                  children: [
                    FittedBox(
                      child: Text(
                        mosque.name,
                        textScaleFactor: 10,
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(height: 8.0,),
                    if (mosque.imageUrl != "" && mosque.mapUrl != "")
                      MosquePageItem(mosque: mosque),
                  ],
                ),
              ),
            )
            .toList(),
      ),
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
          return IsLarge.of(context)
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      margin: const EdgeInsets.all(0),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        mosque.imageUrl,
                        width: width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: spacer),
                    Card(
                      margin: const EdgeInsets.all(0),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        mosque.mapUrl,
                        width: width,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      margin: const EdgeInsets.all(0),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        mosque.imageUrl,
                        height: height,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: spacer),
                    Expanded(
                      child: Card(
                        margin: const EdgeInsets.all(0),
                        clipBehavior: Clip.antiAlias,
                        child: WebViewWidget(
                            controller: WebViewController()
                              ..setJavaScriptMode(JavaScriptMode.unrestricted)
                              ..loadHtmlString(mosque.mapUrl)),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
