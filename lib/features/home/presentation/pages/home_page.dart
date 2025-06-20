import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/home/data/repository/news_repository.dart';
import 'package:news/features/home/presentation/bloc/news_bloc.dart';
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
  final NewsRepository repository = NewsRepository();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NewsBloc>().add(GetNewsEvent());
    });
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
                  const NewsListView(),
                  const NewsListView(),
                  const NewsListView(),
                  const NewsListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
