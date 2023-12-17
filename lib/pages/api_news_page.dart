import 'package:flutter/material.dart';
import 'package:grid_api_news/data_source/news_data_source.dart';
import '../model/news_model.dart';

class ApiNewsPage extends StatefulWidget {
  const ApiNewsPage({super.key});

  @override
  State<ApiNewsPage> createState() => _ApiNewsPageState();
}

class _ApiNewsPageState extends State<ApiNewsPage> {

  final NewsDataSource newsDataSource = NewsDataSource();
  late Future<List<NewsModel>> futureNews;

  @override
  void initState () {
    super.initState();
    futureNews = newsDataSource.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: const Center(
              child: Text('News')),
      ),
      body: FutureBuilder(
        future: futureNews,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            );
          }
          else if (snapshot.data!.isEmpty){
          return const Center(
            child: Text('List Empty'),
          );
          }
          else {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemBuilder: (BuildContext context, int index) {
                final NewsModel news = snapshot.data![index];
                return Card(
                  child: Column(
                    children: [
                      Image.network(
                        news.urlToImage,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          news.title,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        }
      ),
    );
  }
}
