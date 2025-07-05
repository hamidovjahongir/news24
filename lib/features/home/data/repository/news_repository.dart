import 'package:news/core/interceptor/interceptor.dart';
import 'package:news/features/home/data/model/news_model.dart';

class NewsRepository {
  DioClient dio = DioClient();

  Future<NewsModel> getNews() async {
    final response = await dio.dioClient.get(
      '/v2/everything?q=tesla&from=2025-06-05&sortBy=publishedAt&apiKey=5f2d16a7fda041a6ad83c247f1b1aa8d',
    );
    return NewsModel.fromMap(response.data);
  }
}
