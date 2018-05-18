import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {

  final String _question;
  final int _questionNumber;

  QuestionText(this._question, this._questionNumber);

  @override
  _QuestionTextState createState() => new _QuestionTextState();
}

class _QuestionTextState extends State<QuestionText> with SingleTickerProviderStateMixin {

  Animation<double> _fontSizeaAnimation;
  AnimationController _fontSizeAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fontSizeAnimationController=new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 500)
    );
    _fontSizeaAnimation=new CurvedAnimation(
        parent: _fontSizeAnimationController,
        curve: Curves.linear
    );
    _fontSizeaAnimation.addListener(() => this.setState(() {}));
    _fontSizeAnimationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _fontSizeAnimationController.dispose();
    super.dispose();

  }

  @override
  void didUpdateWidget(QuestionText oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if(oldWidget._question!=widget._question){
      _fontSizeAnimationController.reset();
      _fontSizeAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      child: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 20.0),
        child: new Center(
          child: new Text("Stateement "+widget._questionNumber.toString()+": "+ widget._question,
            style: new TextStyle(
              fontSize: _fontSizeaAnimation.value * 15.0,
            ),
          ),
        ),
      ),
    );
  }
}
