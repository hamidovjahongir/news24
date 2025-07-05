import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/dp/injection.dart';
import 'package:news/features/home/data/repository/news_repository.dart';
import 'package:news/features/home/presentation/bloc/news_bloc.dart';
import 'package:news/features/main/presentation/pages/main_page.dart';

void main() {
  setup();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

final NewsRepository repository = NewsRepository();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(repository),
      child: MaterialApp(
        title: 'News',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: MainPage(),
      ),
    );
  }
}
