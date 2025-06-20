import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/home/presentation/bloc/news_bloc.dart';
import 'package:news/features/home/presentation/widgets/newscard.dart';
import 'package:news/features/home/presentation/widgets/newserrorwidget.dart';
import 'package:news/features/home/presentation/widgets/newsloadingwidget.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          return const NewsLoadingWidget();
        }
        if (state is NewsError) {
          return NewsErrorWidget(error: state.error);
        }
        if (state is NewsSuccess) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: state.news.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final news = state.news[index];
              return NewsCard(news: news);
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
