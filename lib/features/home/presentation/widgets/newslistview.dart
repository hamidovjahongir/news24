import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/features/home/presentation/controller/news_controller.dart';
import 'package:news/features/home/presentation/widgets/newscard.dart';
import 'package:news/features/home/presentation/widgets/newserrorwidget.dart';
import 'package:news/features/home/presentation/widgets/newsloadingwidget.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewsController>();

    return Obx(() {
      if (controller.isLoading.value) {
        return const NewsLoadingWidget();
      }
      if (controller.error.isNotEmpty) {
        return NewsErrorWidget(error: controller.error.value);
      }
      return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: controller.articles.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final news = controller.articles[index];
          return NewsCard(news: news);
        },
      );
    });
  }
}
