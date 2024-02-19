import 'package:get/get.dart';
import 'package:semic/routes/routes_name.dart';
import 'package:semic/view/home_view.dart';



class AppRoutes {
  static appRoutes() => [
    GetPage(
      name: RoutesName.homeView,
      page: () => HomeView(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
  ];
}
