import 'package:flutter/material.dart';

class Tasks extends StatefulWidget {
  final Color? color;
  final IconData? icon;
  final String? title;
  final String? sub;
  const Tasks({
    required this.color,
    required this.icon,
    required this.title,
    required this.sub,
    super.key,
  });

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          activeColor: Colors.amber,
          side: BorderSide(color: Colors.black, width: 2),
          checkColor: Colors.black,
          value: isSelected,
          onChanged: (val) {
            setState(() {
              isSelected = !isSelected;
            });
          },
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              widget.sub!,
              maxLines: 1,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Spacer(),
        Icon(widget.icon, size: 50, color: widget.color),
      ],
    );
  }
}
