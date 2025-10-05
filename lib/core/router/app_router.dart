import "package:auto_route/auto_route.dart";
import "package:rick_and_morty/core/router/app_router.gr.dart";

@AutoRouterConfig(replaceInRouteName: "Screen|Page,Route")
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
    //AutoRoute(page: WelcomeRoute.page, path: "/"),
    AutoRoute(
      page: HomeWrapperRoute.page,
      path: "/",
      children: [
        AutoRoute(
          page: CharactersWrapperRoute.page,
          path: "characters",
          children: [
            AutoRoute(page: CharactersRoute.page, path: "start", initial: true),
          ],
        ),

        AutoRoute(
          page: FavoritesWrapperRoute.page,
          path: "favorites",
          children: [
            AutoRoute(page: FavoritesRoute.page, path: "start", initial: true),
          ],
        ),

        AutoRoute(
          page: SettingsWrapperRoute.page,
          path: "settings",
          children: [
            AutoRoute(page: SettingsRoute.page, path: "start", initial: true),
          ],
        ),
      ],
    ),
  ];
}
