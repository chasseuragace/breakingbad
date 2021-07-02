
import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String title;
  final IconData icon;
  const Heading({
    Key key,
    this.title,
    this.icon,
  }) : super(key: key);
  final itemColors = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: itemColors,
              ),
              // sizedbox lai as padding use gareko
              //todo use padding widget
              SizedBox(width: 12),
              Text(title,
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: itemColors)),
            ],
          ),
          Icon(
            Icons.search,
          )
        ],
      ),
    );
  }
}