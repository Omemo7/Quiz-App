import 'package:flutter/material.dart';
import 'package:koko/Home_Page.dart';
import 'Start_Page.dart';

class ScoresPage extends StatelessWidget {
  final List<Map<String, dynamic>> scores;

  ScoresPage({required this.scores}) {
    print("ScoresPage created with scores: $scores");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Disable back navigation
      child: Scaffold(
        appBar: AppBar(
          title: Text("Scores"),
          automaticallyImplyLeading: false, // Disable back button
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: scores.length,
                  itemBuilder: (context, index) {
                    final score = scores[index];
                    return Card(
                      child: ListTile(
                        title: Text(score['username']),
                        trailing: Text(
                          "Score: ${score['score']}",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(scores: scores),
                    ),
                    (route) => false,
                  );
                },
                child: Text("Play Again as Another User"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
