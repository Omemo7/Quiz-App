import 'package:flutter/material.dart';
import 'dart:math';
import 'Quesitions_Page.dart';

class QuestionsLevelsPage extends StatelessWidget {
  final String username;
  final List<Map<String, dynamic>> scores;

  QuestionsLevelsPage({required this.username, required this.scores});

  void _navigateToQuestionsPage(BuildContext context, String level) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuestionsPage(
          username: username,
          level: level,
          scores: scores,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Disable back navigation
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hello, $username!"),
          automaticallyImplyLeading: false, // Disable back button
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome, $username! 🎉",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                "Choose question level:",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () => _navigateToQuestionsPage(context, "Easy"),
                    child: Text("Easy"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 50),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () =>
                        _navigateToQuestionsPage(context, "Medium"),
                    child: Text("Medium"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 50),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => _navigateToQuestionsPage(context, "Hard"),
                    child: Text("Hard"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 50),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => _navigateToQuestionsPage(context, "Mix"),
                    child: Text("Mix"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 50),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      final levels = ["Easy", "Medium", "Hard", "Mix"];
                      final randomLevel =
                          levels[Random().nextInt(levels.length)];
                      _navigateToQuestionsPage(context, randomLevel);
                    },
                    child: Text("Random"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 50),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
