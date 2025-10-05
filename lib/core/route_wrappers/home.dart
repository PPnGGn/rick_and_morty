import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:rick_and_morty/core/router/app_router.gr.dart";
import "package:rick_and_morty/core/utils/app_colors.dart";

@RoutePage()
class HomeWrapperPage extends StatelessWidget {
  const HomeWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        CharactersWrapperRoute(),
        FavoritesWrapperRoute(),
        SettingsWrapperRoute(),
      ],
      transitionBuilder: (context, child, animation) =>
          FadeTransition(opacity: animation, child: child),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.text,
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              fontFamily: "OpenSans",
              fontSize: 14,
            ),
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              fontFamily: "OpenSans",
              fontSize: 14,
            ),
            currentIndex: tabsRouter.activeIndex,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                label: "Персонажи",

                icon: Icon(Icons.person),
              ),
              BottomNavigationBarItem(
                label: "Избраное",
                icon: Icon(Icons.favorite),
              ),

              BottomNavigationBarItem(
                label: "Настройки",
                icon: Icon(Icons.settings),
              ),
            ],
          ),
        );
      },
    );
  }
}
