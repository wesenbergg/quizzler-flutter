import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  List<Question> questionObjects = [
    Question(
      question: 'You can lead a cow down stairs but not up stairs.',
      answer: false
    ),
    Question(
      question: 'Approximately one quarter of human bones are in the feet.',
      answer: true
      ),
    Question(
      question: 'A slug\'s blood is green.',
      answer: true
    )
  ];

  int questionTracker = 0;

  Icon correct(){
    return Icon(
      Icons.check,
      color: Colors.green,
    );
  }

  Icon incorrect(){
    return Icon(
      Icons.close,
      color: Colors.red,
    );
  }

  void handleTrue() {
    setState(() {
      (questionObjects[questionTracker].answer) ? 
      scoreKeeper.add(correct()):
      scoreKeeper.add(incorrect());
      questionTracker++;
    });
  }

  void handleFalse() {
    setState(() {
      !(questionObjects[questionTracker].answer) ? 
      scoreKeeper.add(correct()):
      scoreKeeper.add(incorrect());
      questionTracker++;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                (questionTracker < questionObjects.length) ? questionObjects[questionTracker].question: 'Out of questions',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ), 
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () => handleTrue(),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () => handleFalse(),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
