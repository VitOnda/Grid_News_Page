import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:grid_api_news/model/news_model.dart';

class NewsDataSource {
  Future<List<NewsModel>> getNews() async {
    print('=================================================Fetch');
    final response = await http.get(
      Uri.parse(
        'https://newsapi.org/v2/everything?q=apple&from=2023-12-16&to=2023-12-16&sortBy=popularity&apiKey=65769ca70dc44b26910d5f5be19def54',
      ),
    );
    print(response.body);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['articles'] != null) {
        return data['articles']
            .map<NewsModel>((element) => NewsModel.fromJson(element))
            .tolist;
      } else {
        throw Exception('Error. Load news list');
      }
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
   }
  }
}
