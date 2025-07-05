import 'package:flutter/material.dart';
import 'package:news/features/home/data/model/news_model.dart';
import 'package:news/features/home/presentation/widgets/newsimagewidget.dart';
import 'package:news/features/home/presentation/widgets/newsmetadata.dart';

class NewsCard extends StatelessWidget {
  final Article news;

  const NewsCard({super.key, required this.news});

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NewsImageWidget(imageUrl: news.urlToImage),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news.title ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 12),

                NewsMetaData(
                  author: "${news.author}",
                  publishedAt: DateTime.parse(news.publishedAt ?? ''),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
