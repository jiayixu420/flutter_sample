import 'package:happy_nation/helpers/helper.dart';

class Video {
  String? name;
  String? video;
  String? thumb;
  bool? hasThumb;

  Video();

  Video.fromJson(Map<String, dynamic> json) {
    try {
      name = json['name'];
      video = json['video'];
      thumb = json['thumb'];
      hasThumb = json['has_thumb'];
    } catch (e) {
      Helper.printConsole('from Video Model => $e');
    }
  }
}
