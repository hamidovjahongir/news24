import 'package:get_it/get_it.dart';
import 'package:news/features/home/data/repository/news_repository.dart';
import 'package:news/features/home/presentation/bloc/news_bloc.dart';

final sl = GetIt.instance;

void setup() {
  sl.registerLazySingleton(() => NewsRepository());
  sl.registerFactory(() => NewsBloc(sl()));
}
