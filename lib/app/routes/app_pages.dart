import 'package:get/get.dart';

import 'package:tripify_app/app/modules/category/bindings/category_binding.dart';
import 'package:tripify_app/app/modules/flip/binding/flip_binding.dart';
import 'package:tripify_app/app/modules/profil/bindings/profil_binding.dart';
import 'package:tripify_app/app/modules/profil/views/profil_views.dart';
import 'package:tripify_app/app/modules/transaction/bindings/transaction_binding.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/category/views/category_view.dart';
import '../modules/transaction/views/transaction_view.dart';
import '../modules/flip/views/flip_views.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
     GetPage(
      name: _Paths.CATEGORY,
      page: () => CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
     GetPage(
      name: _Paths.TRANSACTION,
      page: () =>  TransactionView(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL,
      page: () =>  ProfilView(),
      binding: ProfilBinding(),
    ),
     
    
      GetPage(
      name: _Paths.FLIP,
      page: () => const FlipView(),
      binding: FlipBinding(),
    ),
  ];
}
