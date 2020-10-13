import 'package:flutter/material.dart';

typedef VerticalCardListBuilder<T> = Widget Function(BuildContext context, T item);

class VerticalCardList<T> extends StatelessWidget {
  final List<T> items;
  final String title;
  final VerticalCardListBuilder<T> itemBuilder;

  VerticalCardList({
    Key key,
    this.title,
    this.items,
    this.itemBuilder
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold
          ),
        ),
        Container(
          height: 190,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
          child: ListView.builder(
            itemCount: items.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) => this.itemBuilder(context, items[index]),
          ),
        ),
      ],
    );
  }

}
