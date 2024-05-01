import 'package:get/get.dart';
import 'package:tugas_10/app/modules/login/controllers/login_controller.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final loginController = Get.put(LoginController());

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.LOGIN);

      // if (loginController.getStorage.read("status") != null &&
      //     loginController.getStorage.read("status") != "") {
      //   Get.offAllNamed(Routes.HOME);
      // } else {
      //   Get.offAllNamed(Routes.LOGIN);
      // }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
