import 'package:flutter/material.dart';

class HistoryScreenItems extends StatelessWidget {
  final String Id;
  final String title;
  final Color color;

  HistoryScreenItems(this.Id, this.title, this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          Text(this.title),
          Text(this.Id),
        ],
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.4),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
