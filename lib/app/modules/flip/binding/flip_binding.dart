import 'package:get/get.dart';

// ignore: unused_import
import '../controllers/flip_controller.dart';

class FlipBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlipBinding>(
      () => FlipBinding(),
    );
  }
}
