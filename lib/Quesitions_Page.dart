import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'Questions_Database.dart';
import 'Scores_Page.dart';

class QuestionsPage extends StatefulWidget {
  final String username;
  final String level;
  final List<Map<String, dynamic>> scores;

  QuestionsPage(
      {required this.username, required this.level, required this.scores});

  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  int _currentQuestionIndex = 0;
  late Timer _timer;
  int _timeLeft = 0;
  List<bool> _answeredQuestions = List.filled(10, false);
  int _answeredCount = 0;
  int _totalPoints = 0;
  late List<Question> _questions;
  late List<String> _questionLevels;

  @override
  void initState() {
    super.initState();
    _questions = _getQuestionsForLevel(widget.level);
    _questionLevels = _getQuestionLevels(widget.level);
    _startTimer();
  }

  List<Question> _getQuestionsForLevel(String level) {
    if (level == "Mix") {
      List<Question> mixedQuestions = [];
      mixedQuestions.addAll(_getRandomQuestions("Easy", 3));
      mixedQuestions.addAll(_getRandomQuestions("Medium", 3));
      mixedQuestions.addAll(_getRandomQuestions("Hard", 4));
      return mixedQuestions;
    } else {
      return QuestionsDatabase.questionsByLevel[level] ?? [];
    }
  }

  List<Question> _getRandomQuestions(String level, int count) {
    List<Question> questions = QuestionsDatabase.questionsByLevel[level] ?? [];
    questions.shuffle();
    return questions.take(count).toList();
  }

  List<String> _getQuestionLevels(String level) {
    if (level == "Mix") {
      return List.filled(3, "Easy") +
          List.filled(3, "Medium") +
          List.filled(4, "Hard");
    } else {
      return List.filled(_questions.length, level);
    }
  }

  void _startTimer() {
    _timeLeft = _getTimeForLevel(_questionLevels[_currentQuestionIndex]);
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          _nextQuestion();
        }
      });
    });
  }

  int _getTimeForLevel(String level) {
    switch (level) {
      case "Hard":
        return 6;
      case "Medium":
        return 9;
      case "Easy":
        return 12;
      default:
        return 12;
    }
  }

  int _getPointsForLevel(String level) {
    switch (level) {
      case "Hard":
        return 3;
      case "Medium":
        return 2;
      case "Easy":
        return 1;
      default:
        return 1;
    }
  }

  void _nextQuestion() {
    _timer.cancel();
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
        _startTimer();
      } else {
        _showScore();
      }
    });
  }

  void _answerQuestion(int choiceIndex) {
    if (choiceIndex == _questions[_currentQuestionIndex].correctAnswerIndex) {
      _answeredQuestions[_currentQuestionIndex] = true;
      _answeredCount++;
      _totalPoints +=
          _getPointsForLevel(_questionLevels[_currentQuestionIndex]);
    }
    if (_currentQuestionIndex < _questions.length - 1) {
      _nextQuestion();
    } else {
      _showScore();
    }
  }

  void _showScore() {
    List<Map<String, dynamic>> updatedScores = List.from(widget.scores);
    updatedScores.add({'username': widget.username, 'score': _totalPoints});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ScoresPage(scores: updatedScores),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return WillPopScope(
        onWillPop: () async => false, // Disable back navigation
        child: Scaffold(
          appBar: AppBar(
            title: Text(
                "Questions for ${widget.username} - Level: ${widget.level}"),
            automaticallyImplyLeading: false, // Disable back button
          ),
          body: Center(
            child: Text("No questions available for this level."),
          ),
        ),
      );
    }

    final question = _questions[_currentQuestionIndex];
    final questionLevel = _questionLevels[_currentQuestionIndex];

    return WillPopScope(
      onWillPop: () async => false, // Disable back navigation
      child: Scaffold(
        appBar: AppBar(
          title:
              Text("Questions for ${widget.username} - Level: ${widget.level}"),
          automaticallyImplyLeading: false, // Disable back button
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Question ${_currentQuestionIndex + 1} ($questionLevel):",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Answered correctly: $_answeredCount",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Total Points: $_totalPoints",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  SizedBox(height: 20),
                  Text(
                    question.text,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children:
                        List.generate(question.choices.length, (choiceIndex) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle choice selection
                            _answerQuestion(choiceIndex);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.circle, size: 20),
                              SizedBox(width: 10),
                              Text(
                                question.choices[choiceIndex],
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Time left: $_timeLeft seconds",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
