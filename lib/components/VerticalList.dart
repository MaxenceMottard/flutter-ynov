import 'package:flutter/material.dart';

typedef VerticalCardListBuilder<T> = Widget Function(BuildContext context, T item);

class VerticalCardList<T> extends StatelessWidget {
  final Future<List<T>> future;
  final String title;
  final VerticalCardListBuilder<T> itemBuilder;

  VerticalCardList({
    Key key,
    this.title,
    this.future,
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
          child: FutureBuilder<List<T>>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print("error");
                print(snapshot.error);
              }

              if (!snapshot.hasData) {
                print("Là");
                return Text("rien", style: TextStyle(color: Colors.white));
              }

              return ListView.builder(
                itemCount: snapshot.data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => this.itemBuilder(context, snapshot.data[index]),
              );
            },
          ),
        ),
      ],
    );
  }

}
