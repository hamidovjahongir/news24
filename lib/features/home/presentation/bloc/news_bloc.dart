import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/features/home/data/model/news_model.dart';
import 'package:news/features/home/data/repository/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository repository;
  NewsBloc(this.repository) : super(NewsInitial()) {
    on<GetNewsEvent>((event, emit) async {
      try {
        emit(NewsLoading());
        final response = await repository.getNews(); 
        emit(NewsSuccess(response.articles));
      } catch (e) {
        emit(NewsError(e.toString()));
      }
    });
  }
}
