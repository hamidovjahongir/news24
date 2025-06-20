import 'package:flutter/material.dart';
import 'package:news/features/home/presentation/widgets/newscardskeleton.dart';

class NewsLoadingWidget extends StatelessWidget {
  const NewsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return const NewsCardSkeleton();
      },
    );
  }
}
