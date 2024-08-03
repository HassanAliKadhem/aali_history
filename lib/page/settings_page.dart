import 'package:flutter/material.dart';

import '../widget/adaptive_padding.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: adaptiveEdgeInsets(context),
      scrollDirection: Axis.vertical,
      children: const [
        ListTile(
          title: Text("المصادر"),
          leading: Icon(Icons.newspaper),
        ),
        ListTile(
          dense: true,
          title: Text("https://en.wikipedia.org/wiki/A%27ali"),
        ),
        ListTile(
          dense: true,
          title: Text("https://ar.wikipedia.org/wiki/عالي_(مدينة)"),
        ),
        ListTile(
          dense: true,
          title: Text("https://aalinet.net/history"),
        ),
        ListTile(
          dense: true,
          title: Text("https://aalinet.net"),
        ),
        ListTile(
          dense: true,
          title: Text("https://www.marefa.org/عالي"),
        ),
        ListTile(
          dense: true,
          title: Text("http://www.alwasatnews.com/news/50621.html"),
        ),
        Divider(),
        ListTile(
          title: Text("صنعت بي"),
          subtitle: Text("حسن كاظم"),
          leading: Icon(Icons.person),
        ),
        ListTile(
          title: Text("صنعت باستخدام"),
          subtitle: Text("Flutter"),
          leading: FlutterLogo(),
        ),
        AboutListTile(
          icon: Icon(Icons.info),
          applicationVersion: "1.2.0",
          child: Text("عن تاريخ عالي"),
        ),
      ],
    );
  }
}
