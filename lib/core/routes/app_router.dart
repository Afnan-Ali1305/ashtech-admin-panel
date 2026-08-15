import 'package:ashtech_app/core/routes/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';

//  dart run build_runner build

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    CustomRoute(
      page: SplashRoute.page,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      // initial: true,
    ),
    CustomRoute(
      page: NavigationRoute.page,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      initial: true,

      children: [
        CustomRoute(
          page: DashboardRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: EmployeeRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: ProjectRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: ClientRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: FinanceRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
      ],
    ),
  ];
}
