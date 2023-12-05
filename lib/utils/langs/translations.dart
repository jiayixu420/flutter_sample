import 'package:get/get.dart';

import 'en.dart';
import 'fr.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en': en, 'fr': fr};
}
