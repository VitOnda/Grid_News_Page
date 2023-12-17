import 'package:flutter/material.dart';
import 'package:grid_api_news/pages/detail_api_news_page.dart';

class ApiNewsPage extends StatefulWidget {
  const ApiNewsPage({super.key});

  @override
  State<ApiNewsPage> createState() => _ApiNewsPageState();
}

class _ApiNewsPageState extends State<ApiNewsPage> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: const Center(
              child: Text('News')),
      ),

    );
  }
}
