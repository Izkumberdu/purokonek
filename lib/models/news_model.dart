import 'package:flutter/cupertino.dart';

class NewsModel {
  String icon;
  Color color;
  String title;
  String description;

  NewsModel({
    required this.icon,
    required this.color,
    required this.title,
    required this.description,
  });

  static List<NewsModel> getNews() {
    List<NewsModel> news = [];

    news.add(NewsModel(
      icon: 'assets/icons/health_icon.png',
      color: const Color(0xFFFFF3EB),
      title: 'Operation Tuli!',
      description:
          'The City Government of Pardo, through the Pardo Medical Assistance Office, is set to conduct a series of free circumcision programs, known as "Operation Libreng …',
    ));

    news.add(NewsModel(
      icon: 'assets/icons/trash_icon.png',
      color: const Color(0xFFEEFEF4),
      title: 'Earth Day Celebration',
      description:
          'celebrate and protect our planet on Earth Day 2024, with the theme Planet vs. Plastics.',
    ));

    news.add(NewsModel(
      icon: 'assets/icons/maps_icon.png',
      color: const Color(0xFFF9F6ED),
      title: 'More Barangay Services?',
      description:
          'PuroKonek help you look for MORE SERVICES near you with the app’s new update!',
    ));

    news.add(NewsModel(
      icon: 'assets/icons/person_icon.png',
      color: const Color(0xFFE5E5E5),
      title: "It's Election Season",
      description: "Remember to vote!",
    ));
    return news;
  }
}
