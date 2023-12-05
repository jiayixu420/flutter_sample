import 'package:happy_nation/helpers/helper.dart';

class Answer {
  String? id;
  String? answer;
  String? range;
  String? point;
  bool? isQuestion;
  double? startAt;
  double? endAt;

  Answer();

  Answer.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'].toString();
      answer = json['answer'] ?? '';
      range = json['range'] ?? '';
      point = json['point'];
      if (!(['', null]).contains(range)) splitRange();
    } catch (e) {
      Helper.printConsole('from Answer Model => $e');
    }
  }

  // spliting the range
  void splitRange() {
    var ranges = range!.split('-');
    startAt = double.parse(ranges[0]);
    endAt = double.parse(ranges[1]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['range'] = range;
    data['start_at'] = startAt;
    data['end_at'] = endAt;
    data['point'] = point;
    return data;
  }
}
