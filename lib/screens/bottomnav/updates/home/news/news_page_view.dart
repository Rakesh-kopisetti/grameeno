import 'package:flutter/material.dart';
import 'news_model.dart';

class NewsPageView extends StatefulWidget {
  final List<Map<String, dynamic>> newsList;
  final int initialIndex;

  const NewsPageView({
    super.key,
    required this.newsList,
    required this.initialIndex,
  });

  @override
  State<NewsPageView> createState() => _NewsPageViewState();
}

class _NewsPageViewState extends State<NewsPageView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.initialIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      controller: _pageController,
      itemCount: widget.newsList.length,
      itemBuilder: (context, index) {
        return AnimatedBuilder(
          animation: _pageController,
          builder: (context, child) {
            double value = 1.0;
            if (_pageController.position.haveDimensions) {
              value = _pageController.page! - index;
              value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
            }
            return Transform.scale(
              scale: value,
              child: Opacity(
                opacity: value,
                child: child,
              ),
            );
          },
          child: NewsModel(
            title: widget.newsList[index]['title'],
            subtitle: widget.newsList[index]['subtitle'],
            img: widget.newsList[index]['img'],
          ),
        );
      },
    );
  }
}
