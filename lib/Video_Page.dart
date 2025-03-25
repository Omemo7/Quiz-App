import 'package:flutter/material.dart';
import 'Questions_Level_Page.dart';

class VideoPage extends StatelessWidget {
  final String username;
  final List<Map<String, dynamic>> scores;

  VideoPage({required this.username, required this.scores});

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
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuestionsLevelsPage(
                        username: username,
                        scores: scores,
                      ),
                    ),
                  );
                },
                child: Text("Go to Third Page"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
