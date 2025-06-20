part of 'news_bloc.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

// ignore: must_be_immutable
final class NewsError extends NewsState {
  String error;
  NewsError(this.error);
}

final class NewsLoading extends NewsState {}

final class NewsSuccess extends NewsState {
  final List<Article> news;
  NewsSuccess(this.news);

}
