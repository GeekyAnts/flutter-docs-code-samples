import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(new CardsDemo());

// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.




class TravelDestination {
  const TravelDestination({

    this.title,
    this.description,
  });


  final String title;
  final List<String> description;

}

 List<TravelDestination> destinations = <TravelDestination>[
  const TravelDestination(
    title: 'Top 10 Australian beaches',
    description: const <String>[
      'Number 10',
      'Whitehaven Beach',
      'Whitsunday Island, Whitsunday Islands',
    ],
  ),
  const TravelDestination(
    title: 'Kangaroo Valley Safari',
    description: const <String>[
      '2031 Moss Vale Road',
      'Kangaroo Valley 2577',
      'New South Wales',
    ],
  )
];

class TravelDestinationItem extends StatelessWidget {
  TravelDestinationItem({ Key key, @required this.destination,this.onPress })
      : assert(destination != null ),
        super(key: key);

  static final double height = 366.0;
  final TravelDestination destination;
  final Function onPress;

  Offset startPosition=new Offset(0.0, 0.0);
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline.copyWith(color: Colors.white);
    final TextStyle descriptionStyle = theme.textTheme.subhead;

    return new SafeArea(
      top: false,
      bottom: false,
      child: new GestureDetector(
        onHorizontalDragStart: (details){
          print(details.globalPosition);
          startPosition=details.globalPosition;
          this.onPress;
        },
        onHorizontalDragUpdate: (details){
          print("this is primarydelta:${details.globalPosition}");

        },
        child:
        new Container(
        padding: const EdgeInsets.all(8.0),
        height: height,
        child: new Card(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // photo and title
              new SizedBox(
                height: 184.0,
                child: new Stack(
                  children: <Widget>[
                    new Positioned.fill(
                      child: new Image.network(
                       'https://avatars3.githubusercontent.com/u/14101776?v=4'
                      ),
                    ),
                    new Positioned(
                      bottom: 16.0,
                      left: 16.0,
                      right: 16.0,
                      child: new FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: new Text(destination.title,
                          style: titleStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // description and share/expore buttons
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: new DefaultTextStyle(
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: descriptionStyle,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // three line description
                        new Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: new Text(
                            destination.description[0],
                            style: descriptionStyle.copyWith(color: Colors.black54),
                          ),
                        ),
                        new Text(destination.description[1]),
                        new Text(destination.description[2]),
                      ],
                    ),
                  ),
                ),
              ),
              // share, explore buttons
              new ButtonTheme.bar(
                child: new ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new FlatButton(
                      child: const Text('SHARE'),
                      textColor: Colors.amber.shade500,
                      onPressed: () { /* do nothing */ },
                    ),
                    new FlatButton(
                      child: const Text('EXPLORE'),
                      textColor: Colors.amber.shade500,
                      onPressed: () { /* do nothing */ },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}

class CardsDemo extends StatefulWidget {
  @override
  CardsDemoState createState() => new CardsDemoState();
}
class CardsDemoState extends State<CardsDemo> {

  static const String routeName = '/material/cards';


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home : new Scaffold(
        appBar: new AppBar(
            title: const Text('Travel stream')
        ),
        body: new Stack(
            children: destinations.map((TravelDestination destination) {
              return new Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: new TravelDestinationItem(destination: destination,onPress: () {
                    print("you swiped!");
                    setState((){
                      destinations.removeAt(1);
                      destinations=destinations;
                    });
                  }, )
              );
            }).toList()
        )
    )
    );
  }
}