import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tripify_app/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final getStorage = GetStorage();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    // getStorage.write("status", "login");
  }

  @override
  void onReady() {
    super.onReady();
    if (getStorage.read("status") != "" && getStorage.read("status") != null) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAllNamed(Routes.HOME);
      });
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
