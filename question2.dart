// Question 2: Collections & Control Flow (Difficulty: 2/5) ⭐⭐
/**
 * EXPECTED OUTPUT:
 * Student Scores: {Alice: <random>, Bob: <random>, ...}
 * Highest Score: <Name> with <Score>
 * Lowest Score: <Name> with <Score>
 * Average Score: <Value>
 * Alice: <Score> (Category)
 * ...
 */

import 'dart:math';

void main() {
  // 1. Create a List<String> of student names
  List<String> studentNames = ["Alice", "Bob", "Charlie", "Diana", "Eve"];

  // 2. Create a Map<String, int> to store student scores
  Map<String, int> studentScores = {};

  // 3. Use a for loop to assign random scores (60-100) to each student
  var random = Random();
  for (var name in studentNames) {
    // nextInt(41) gives 0-40, adding 60 results in 60-100
    studentScores[name] = 60 + random.nextInt(41);
  }

  // 4. Find and display highest, lowest, and average scores
  String highestStudent = "";
  int highestScore = -1;
  String lowestStudent = "";
  int lowestScore = 101;
  double sum = 0;

  studentScores.forEach((name, score) {
    sum += score;

    if (score > highestScore) {
      highestScore = score;
      highestStudent = name;
    }

    if (score < lowestScore) {
      lowestScore = score;
      lowestStudent = name;
    }
  });

  double averageScore = sum / studentNames.length;

  print("Student Scores: $studentScores");
  print("Highest Score: $highestStudent with $highestScore");
  print("Lowest Score: $lowestStudent with $lowestScore");
  print("Average Score: ${averageScore.toStringAsFixed(1)}");

  // 5. Use a switch statement to categorize students
  studentScores.forEach((name, score) {
    String category;

    // In Dart 3.0+, we can use relational patterns in switch expressions
    switch (score) {
      case >= 90:
        category = "Excellent";
        break;
      case >= 80:
        category = "Good";
        break;
      case >= 70:
        category = "Average";
        break;
      default:
        category = "Needs Improvement";
    }
    
    print("$name: $score ($category)");
  });
}
