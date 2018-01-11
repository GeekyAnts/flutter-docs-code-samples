import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(new CardsDemo());

List cards = ['Card A', 'Card B', 'Card C', 'Card D'];

class CustomCardItem extends StatefulWidget {
  final String card;
  CustomCardItem({this.card});
  @override
  CustomCardItemState createState() => new CustomCardItemState(card: card);
}

class CustomCardItemState extends State<CustomCardItem>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> sliderPosition;
  Offset positionOffset = Offset.zero;
  final String card;
  Offset startoff = new Offset(0.0, 0.0);
  CustomCardItemState({this.card});
  initState() {
    super.initState();
    _controller = new AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    sliderPosition = new Tween<Offset>(
      begin: Offset.zero,
      end: Offset.zero,
    )
        .animate(new CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    ));
  }

  onSwipeUpdate(details) {
    if (details.globalPosition.dx > 0 &&
        details.globalPosition.dx > startoff.dx) {
      sliderPosition = new Tween<Offset>(
        begin: Offset.zero,
        end: new Offset(1.0, 0.1),
      )
          .animate(new CurvedAnimation(
        parent: _controller,
        curve: Curves.decelerate,
      ));
    } else {
      sliderPosition = new Tween<Offset>(
        begin: Offset.zero,
        end: new Offset(-1.0, 0.1),
      )
          .animate(new CurvedAnimation(
        parent: _controller,
        curve: Curves.decelerate,
      ));
    }
    setState(() {
      positionOffset = details.globalPosition - startoff;
    });
  }

  onSwipeEnd(details) {
    _controller.forward();
  }

  onSwipeStart(details) {
    startoff = details.globalPosition;
  }

  @override
  dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle descriptionStyle = theme.textTheme.subhead;
    return new SafeArea(
      top: false,
      bottom: false,
      child: new Transform(
        transform: new Matrix4.translationValues(positionOffset.dx, 0.0, 0.0),
        origin: new Offset(1.0, 0.0),
        child: new SlideTransition(
          position: sliderPosition,
          child: new GestureDetector(
            onHorizontalDragStart: onSwipeStart,
            onHorizontalDragEnd: onSwipeEnd,
            onHorizontalDragUpdate: onSwipeUpdate,
            child: new Container(
              padding: const EdgeInsets.all(8.0),
              height: 280.0,
              child: new Card(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new SizedBox(
                      height: 184.0,
                      child: new Stack(
                        children: <Widget>[
                          new Positioned.fill(
                            child: new Image.network(
                                'https://avatars3.githubusercontent.com/u/14101776?v=4'),
                          ),
                        ],
                      ),
                    ),
                    new Expanded(
                      child: new Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                        child: new DefaultTextStyle(
                          style: descriptionStyle,
                          child: new Column(
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: new Text(
                                  card,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
            appBar: new AppBar(title: const Text('Card Swipe Animation')),
            body: new Stack(
                children: cards.map((String card) {
              return new Container(
                  child: new CustomCardItem(
                card: card,
              ));
            }).toList())));
  }
}
