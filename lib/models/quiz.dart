// To parse this JSON data, do
//
//     final quiz = quizFromJson(jsonString);

import 'dart:convert';

Quiz quizFromJson(String str) => Quiz.fromJson(json.decode(str));

String quizToJson(Quiz data) => json.encode(data.toJson());

class Quiz {
  Quiz({
    this.data,
  });

  final Data? data;

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        data: json["Data"] == null ? null : Data.fromJson(json["Data"]),
      );

  Map<String, dynamic> toJson() => {
        "Data": data?.toJson(),
      };
}

class Data {
  Data({
    this.flutter,
  });

  final List<Flutter>? flutter;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        flutter: json["flutter"] == null
            ? []
            : List<Flutter>.from(
                json["flutter"]!.map((x) => Flutter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "flutter": flutter == null
            ? []
            : List<dynamic>.from(flutter!.map((x) => x.toJson())),
      };
}

class Flutter {
  Flutter({
    this.questionText,
    this.answers,
  });

  final String? questionText;
  final List<Answer>? answers;

  factory Flutter.fromJson(Map<String, dynamic> json) => Flutter(
        questionText: json["questionText"],
        answers: json["answers"] == null
            ? []
            : List<Answer>.from(
                json["answers"]!.map((x) => Answer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "questionText": questionText,
        "answers": answers == null
            ? []
            : List<dynamic>.from(answers!.map((x) => x.toJson())),
      };
}

class Answer {
  Answer({
    this.text,
    this.score,
  });

  final String? text;
  final int? score;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        text: json["text"],
        score: json["score"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "score": score,
      };
}
