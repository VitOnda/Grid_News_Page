class NewsModel {
  final String source;
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String? content;

  NewsModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      source: json['source'] ?? 'No source',
      author: json['author'] ?? 'No author',
      title: json['title'] ?? 'No title',
      description: json['description'] ?? 'No description',
      url: json['url'] ?? 'No url',
      urlToImage: json['urlToImage'] ?? 'No Image',
      publishedAt: json['published_at'] ?? '',
      content: json['content'] ?? 'No content'
    );
  }
}