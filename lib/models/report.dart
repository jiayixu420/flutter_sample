import 'package:happy_nation/helpers/helper.dart';

class Report {
  String? name;
  String? file;
  bool? hasMedia;

  Report();

  Report.fromJson(Map<String, dynamic> json) {
    try {
      name = json['name'];
      hasMedia = json['has_media'];
      file = json['file'];
    } catch (e) {
      Helper.printConsole('from Report Model => $e');
    }
  }
}
