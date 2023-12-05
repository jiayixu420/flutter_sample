import 'package:get/get.dart';
import 'package:happy_nation/controllers/user_controller.dart';
import 'package:happy_nation/models/report.dart';
import 'package:happy_nation/repositories/report_repository.dart';

class ReportController extends GetxController {
  var reports = <Report>[].obs;
  var userController = Get.put(UserController());
  var isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    listenForListOfReport();
  }

  // get list of Reports
  Future<void> listenForListOfReport() async {
    isLoading.update((val) => val = true);
    final Stream<Report> stream =
        await getReportList(token: userController.currentUser.token!);
    stream.listen(
      (Report _report) {
        reports.add(_report);
      },
      onError: (a) {},
      onDone: () {
        isLoading.value = false;
        update();
      },
    );
  }
}
