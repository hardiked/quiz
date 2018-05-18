import 'dart:math';

import 'package:flutter/material.dart';

class CorrectWrongOverlay extends StatefulWidget {

  final bool _isCorrect;
  final VoidCallback _onTap;

  CorrectWrongOverlay(this._isCorrect, this._onTap);


  @override
  _CorrectWrongOverlayState createState() => new _CorrectWrongOverlayState();
}

class _CorrectWrongOverlayState extends State<CorrectWrongOverlay> with SingleTickerProviderStateMixin {

  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _iconAnimationController=new AnimationController(
        vsync: this,
        duration: new Duration(seconds: 2)
    );
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.elasticOut
    );
    _iconAnimation.addListener(() => this.setState((){}));
    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: (){ print("gf");widget._onTap();},
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: new Transform.rotate(
                  angle: _iconAnimation.value * 2 * 3.14 ,
                  child: new Icon(widget._isCorrect == true ? Icons.done : Icons.clear, size: _iconAnimation.value * 80.0,)),
            ),
            new Text(widget._isCorrect == true ? "Correct" : "Incorrect", style: new TextStyle(color: Colors.white, fontSize: 30.0),)
          ],
        ),
      )
    );
  }
}
