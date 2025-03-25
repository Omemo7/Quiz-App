class Question {
  final String text;
  final List<String> choices;
  final int correctAnswerIndex;

  Question({
    required this.text,
    required this.choices,
    required this.correctAnswerIndex,
  });
}

class QuestionsDatabase {
  static final Map<String, List<Question>> questionsByLevel = {
    "Easy": [
      Question(
        text: "What is 2 + 2?",
        choices: ["3", "4", "5", "6"],
        correctAnswerIndex: 1,
      ),
      Question(
        text: "What is the capital of France?",
        choices: ["Berlin", "Madrid", "Paris", "Lisbon"],
        correctAnswerIndex: 2,
      ),
      Question(
        text: "What color is the sky?",
        choices: ["Blue", "Green", "Red", "Yellow"],
        correctAnswerIndex: 0,
      ),
      Question(
        text: "What is 5 - 3?",
        choices: ["1", "2", "3", "4"],
        correctAnswerIndex: 1,
      ),
      Question(
        text: "What is the capital of Italy?",
        choices: ["Rome", "Paris", "Berlin", "Madrid"],
        correctAnswerIndex: 0,
      ),
      Question(
        text: "What is 3 + 3?",
        choices: ["5", "6", "7", "8"],
        correctAnswerIndex: 1,
      ),
      Question(
        text: "What is the capital of Spain?",
        choices: ["Madrid", "Paris", "Berlin", "Lisbon"],
        correctAnswerIndex: 0,
      ),
      Question(
        text: "What is 4 + 4?",
        choices: ["6", "7", "8", "9"],
        correctAnswerIndex: 2,
      ),
      Question(
        text: "What is the capital of Germany?",
        choices: ["Berlin", "Paris", "Madrid", "Lisbon"],
        correctAnswerIndex: 0,
      ),
      Question(
        text: "What is 6 - 2?",
        choices: ["2", "3", "4", "5"],
        correctAnswerIndex: 2,
      ),
    ],
    "Medium": [
      Question(
        text: "What is the square root of 16?",
        choices: ["2", "4", "6", "8"],
        correctAnswerIndex: 1,
      ),
      Question(
        text: "Who wrote 'To Kill a Mockingbird'?",
        choices: [
          "Harper Lee",
          "Mark Twain",
          "Ernest Hemingway",
          "F. Scott Fitzgerald"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        text: "What is the capital of Canada?",
        choices: ["Toronto", "Ottawa", "Vancouver", "Montreal"],
        correctAnswerIndex: 1,
      ),
      Question(
        text: "What is 12 / 4?",
        choices: ["2", "3", "4", "5"],
        correctAnswerIndex: 1,
      ),
      Question(
        text: "Who painted the Mona Lisa?",
        choices: [
          "Vincent van Gogh",
          "Pablo Picasso",
          "Leonardo da Vinci",
          "Claude Monet"
        ],
        correctAnswerIndex: 2,
      ),
      Question(
        text: "What is the capital of Australia?",
        choices: ["Sydney", "Melbourne", "Canberra", "Brisbane"],
        correctAnswerIndex: 2,
      ),
      Question(
        text: "What is 15 / 3?",
        choices: ["3", "4", "5", "6"],
        correctAnswerIndex: 2,
      ),
      Question(
        text: "Who wrote '1984'?",
        choices: [
          "George Orwell",
          "Aldous Huxley",
          "Ray Bradbury",
          "J.K. Rowling"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        text: "What is the capital of Japan?",
        choices: ["Tokyo", "Osaka", "Kyoto", "Nagoya"],
        correctAnswerIndex: 0,
      ),
      Question(
        text: "What is 18 / 6?",
        choices: ["2", "3", "4", "5"],
        correctAnswerIndex: 1,
      ),
    ],
    "Hard": [
      Question(
        text: "What is the derivative of x^2?",
        choices: ["x", "2x", "x^2", "2"],
        correctAnswerIndex: 1,
      ),
      Question(
        text: "What is the capital of Mongolia?",
        choices: ["Ulaanbaatar", "Astana", "Tashkent", "Bishkek"],
        correctAnswerIndex: 0,
      ),
      Question(
        text: "What is the integral of 1/x?",
        choices: ["ln(x)", "x", "1/x", "x^2"],
        correctAnswerIndex: 0,
      ),
      Question(
        text: "What is the capital of Kazakhstan?",
        choices: ["Astana", "Almaty", "Tashkent", "Bishkek"],
        correctAnswerIndex: 0,
      ),
      Question(
        text: "What is the derivative of sin(x)?",
        choices: ["cos(x)", "-cos(x)", "sin(x)", "-sin(x)"],
        correctAnswerIndex: 0,
      ),
      Question(
        text: "What is the capital of Uzbekistan?",
        choices: ["Tashkent", "Astana", "Bishkek", "Dushanbe"],
        correctAnswerIndex: 0,
      ),
      Question(
        text: "What is the integral of e^x?",
        choices: ["e^x", "x", "1/x", "x^2"],
        correctAnswerIndex: 0,
      ),
      Question(
        text: "What is the capital of Kyrgyzstan?",
        choices: ["Bishkek", "Astana", "Tashkent", "Dushanbe"],
        correctAnswerIndex: 0,
      ),
      Question(
        text: "What is the derivative of ln(x)?",
        choices: ["1/x", "x", "ln(x)", "x^2"],
        correctAnswerIndex: 0,
      ),
      Question(
        text: "What is the capital of Tajikistan?",
        choices: ["Dushanbe", "Astana", "Tashkent", "Bishkek"],
        correctAnswerIndex: 0,
      ),
    ],
  };
}
