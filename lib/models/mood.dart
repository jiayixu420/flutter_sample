class Mood {
  String? userId;
  String? moodRange;
  String? text;
  String? mood;
  String? imgPath;

  Mood({this.userId, this.moodRange, this.text, this.mood, this.imgPath});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mood_range'] = moodRange;
    return data;
  }
}
