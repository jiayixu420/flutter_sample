import 'package:happy_nation/models/answer.dart';

import 'package:happy_nation/helpers/helper.dart';

class Question {
  // int? id;
  String? question;
  int? order;
  String? type;
  List<Answer>? answers;

  Question();

  Question.fromJson(Map<String, dynamic> json) {
    try {
      // id = json['id'];
      question = json['question'];
      order = json['order'];
      type = json['type'];
      answers = json['answers'] != null && (json['answers'] as List).isNotEmpty
          ? List.from(json['answers']).map((e) => Answer.fromJson(e)).toList()
          : [];
    } catch (e) {
      Helper.printConsole('from Question Model => $e');
    }
  }

  // get type of question
  bool get isQuestion => type == 'question';
}
