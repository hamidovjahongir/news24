import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/features/home/data/repository/news_repository.dart';
import 'package:news/features/home/presentation/controller/news_controller.dart';
import 'package:news/features/home/presentation/widgets/newsappbar.dart';
import 'package:news/features/home/presentation/widgets/newslistview.dart';
import 'package:news/features/home/presentation/widgets/newstabbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final NewsController controller = Get.put(NewsController(NewsRepository()));

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const NewsAppBar(),
            NewsTabBar(tabController: _tabController),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (controller.error.isNotEmpty) {
                      return Center(child: Text(controller.error.value));
                    } else {
                      return NewsListView();
                    }
                  }),
                  const Center(child: Text("Tab 2")),
                  const Center(child: Text("Tab 3")),
                  const Center(child: Text("Tab 4")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
