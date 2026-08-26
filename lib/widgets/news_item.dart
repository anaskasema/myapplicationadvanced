import 'package:flutter/material.dart';
import 'package:myapplicationadvanced/core/routing/routes_name.dart';
import 'package:myapplicationadvanced/features/genral_news/data/models/news_model.dart';

class NewsWidget extends StatelessWidget {
  final NewsModel newsModel;
  const NewsWidget({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesName.newsDetails, arguments: newsModel);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 140,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(newsModel.title, maxLines: 3, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Text(newsModel.source, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(width: 12),
            ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.network(newsModel.image_url, width: 100, height: 100, fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) => Container(width: 100, height: 100, color: Colors.grey.shade200, child: const Icon(Icons.broken_image)))),
          ],
        ),
      ),
    );
  }
}
