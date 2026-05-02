import 'package:demo/screens/bottomnav/updates/home/news/news_list.dart';
import 'package:demo/screens/bottomnav/updates/home/news/news_page_view.dart';
import 'package:flutter/material.dart';

class NewsTypes extends StatelessWidget {
  final String name;
  final Color color;
  final String title;
  final String sub;
  final String img;
  final IconData icon;
  const NewsTypes({
    super.key,
    required this.name,
    required this.icon,
    required this.color,
    required this.title,
    required this.sub,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          final List<Map<String, dynamic>> list = newsData[name] ?? [];
          final int index = list.indexWhere((item) => item['title'] == title);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => NewsPageView(newsList: list, initialIndex: index),
            ),
          );
        },
        child: Card(
          shadowColor: Colors.black,
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        icon,
                        color: color,
                        size: icon == Icons.shopping_bag_rounded ? 25 : 30,
                      ),
                      SizedBox(width: 4),
                      Text(
                        name,
                        style: TextStyle(
                          color: color,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 130,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(img),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                sub,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              TextButton(
                                onPressed: () {
                                  final List<Map<String, dynamic>> list =
                                      newsData[name] ?? [];
                                  final int index = list.indexWhere(
                                    (item) => item['title'] == title,
                                  );

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (_) => NewsPageView(
                                            newsList: list,
                                            initialIndex: index,
                                          ),
                                    ),
                                  );
                                },
                                child: Text(
                                  "READ MORE",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
