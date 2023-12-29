import 'package:flutter/material.dart';

import 'page/gallery_page.dart';
import 'page/info_page.dart';
import 'page/mosque_page.dart';
import 'page/settings_page.dart';
import 'widget/floating_nav_bar.dart';

class AaliHome extends StatefulWidget {
  const AaliHome({super.key});

  @override
  State<AaliHome> createState() => _AaliHomeState();
}

class _AaliHomeState extends State<AaliHome> {
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(),
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: const [
              InfoPage(),
              Placeholder(),
              MosquePage(),
              GalleryPage(),
              SettingsPage(),
            ][selectedPage],
          ),
          FloatingNavigationBar(
            homePageIcons: const [
              Icon(Icons.info),
              Icon(Icons.short_text),
              Icon(Icons.mosque),
              Icon(Icons.image),
              Icon(Icons.settings),
            ],
            selectedPage: selectedPage,
            onSelected: (value) {
              setState(() {
                selectedPage = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
