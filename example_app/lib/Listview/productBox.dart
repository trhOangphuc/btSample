import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Productbox extends StatelessWidget{
  const Productbox({super.key, required this.name, required this.description,
    required this.price, required this.image});

  final String name;
  final String description;
  final int price;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2), height: 125, child: Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, children:<Widget> [
          Image.asset('assets/$image', width: 50, height: 50, fit: BoxFit.fill,), Expanded(
            child: Container(
              padding: EdgeInsets.all(5), child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(this.name,
                  style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(this.description),
                  Text("Prince: "+ this.price.toString()),
              ],
            ),
            )
        )
      ],
      )
    ),
    );
  }

}