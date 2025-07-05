import 'package:get/get.dart';
import 'package:news/features/home/data/model/news_model.dart';
import 'package:news/features/home/data/repository/news_repository.dart';

class NewsController extends GetxController {
  final NewsRepository repository;

  NewsController(this.repository);

  var isLoading = false.obs;
  var articles = <Article>[].obs;
  var error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getNews();
  }

  void getNews() async {
    try {
      isLoading(true);
      final response = await repository.getNews();
      articles.assignAll(response.articles);
    } catch (e) {
      error(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
