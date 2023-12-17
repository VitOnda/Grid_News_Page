import 'package:flutter/material.dart';
import 'pages/api_news_page.dart';

void main() {
  runApp(const ApiNews());
}

class ApiNews extends StatelessWidget {
  const ApiNews({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.grey[800],
          hintColor: Colors.grey[600],
          scaffoldBackgroundColor: Colors.grey[900],
        ),
       home: const ApiNewsPage(),
    );
  }
}