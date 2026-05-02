import 'package:flutter/material.dart';

class NewsModel extends StatefulWidget {
  final String title;
  final String subtitle;
  final String img;
  const NewsModel({
    super.key,
    required this.title,
    required this.subtitle,
    required this.img,
  });

  @override
  State<NewsModel> createState() => _NewsModelState();
}

class _NewsModelState extends State<NewsModel> {
  bool isLike = false;
  bool isDisLike = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Image.network(
              widget.img,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(widget.subtitle, style: TextStyle(fontSize: 20)),
                    Spacer(),
                    Divider(thickness: 2),
                    Row(
                      spacing: 10,
                      children: [
                        SizedBox(width: 10),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isLike = !isLike;
                              isDisLike = false;
                            });
                          },
                          icon: Icon(
                            isLike
                                ? Icons.thumb_up_alt
                                : Icons.thumb_up_alt_outlined,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isDisLike = !isDisLike;
                              isLike = false;
                            });
                          },
                          icon: Icon(
                            isDisLike
                                ? Icons.thumb_down_alt
                                : Icons.thumb_down_alt_outlined,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.insert_comment_outlined, size: 30),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.ios_share_rounded, size: 30),
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
