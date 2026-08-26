class NewsModel {
  final String title;
  final String uuid;
  final String description;
  final String source;
  final String image_url;

  NewsModel({required this.uuid, required this.title, required this.description, required this.source, required this.image_url});
  
  factory NewsModel.fromJson({required Map<String, dynamic> json}) {
    return NewsModel(
      uuid: json['uuid'] ?? '',
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? '',
      source: json['source'] ?? 'Unknown',
      image_url: json['image_url'] ?? '',
    );
  }
}
