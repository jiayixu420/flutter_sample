import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageController extends GetxController {
  var storage = GetStorage();

  // set data to local storage
  void setData({required data, required String key}) =>
      storage.write(key, data);

  // get data from local storage
  getData({required String key}) {
    var data = storage.read(key);

    return data;
  }

  // check if has value with key or not
  hasData({required key}) {
    return storage.hasData(key);
  }

  // clear data
  void clearData({required key}) => storage.remove(key);
}
