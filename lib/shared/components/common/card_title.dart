
import 'package:cyber_pos/app/theme/text_styles.dart';
import 'package:flutter/material.dart';

class cardTitle extends StatelessWidget {
  final String title;
  const cardTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.title(),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
