import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  final String title;
  final IconData icon;
  const SectionHeading({
    Key key,
    this.title,
    this.icon,
  }) : super(key: key);
  final itemColors = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 8),
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
