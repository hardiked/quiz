import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {

  final bool answer;
  AnswerButton(this.answer);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Material(
        color: answer == true ? Colors.greenAccent : Colors.redAccent,
        child: new InkWell(
          onTap: () => print("true"),
          child: new Center(
            child: new Container(
              child: new Text(answer == true ? "True" : "False"),
            ),
          ),
        ),
      ),
    );
  }
}
