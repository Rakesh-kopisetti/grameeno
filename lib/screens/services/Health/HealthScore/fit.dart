import 'package:flutter/material.dart';

class Fit extends StatelessWidget {
  final IconData? icon;
  final double count;
  final String name;
  final Color color;
  const Fit({required this.icon,required this.count,required this.name,required this.color});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon,color: color,size: 36,),
        SizedBox(width: 8,),
        Column(
          children: [
            Text(count.toString(),style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600
            ),),
            Text(name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black54),)
          ],
        )
      ],
    );
  }
}

