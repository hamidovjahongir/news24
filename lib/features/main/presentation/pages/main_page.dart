import 'package:flutter/material.dart';
import '../../../bookmark/presentation/pages/bookmark.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../../search/presentation/pages/search_page.dart';
import '../../../settings/presentation/pages/settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> pages = [
    HomePage(),
    SearchPage(),
    Bookmark(),
    SettingsPage(),
  ];
  final ValueNotifier<int> pagesIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: pagesIndex,
      builder: (context, value, child) {
        return Scaffold(
          body: pages[pagesIndex.value],

          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              pagesIndex.value = value;
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.black),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.black),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark, color: Colors.black),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings, color: Colors.black),
                label: "",
              ),
            ],
          ),
        );
      },
    );
  }
}
