import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:rick_and_morty/core/router/app_router.gr.dart";

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
            selectedItemColor: Theme.of(
              context,
            ).bottomNavigationBarTheme.selectedItemColor,
            unselectedItemColor: Theme.of(
              context,
            ).bottomNavigationBarTheme.unselectedItemColor,
            backgroundColor: Theme.of(
              context,
            ).bottomNavigationBarTheme.backgroundColor,
            unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
            selectedLabelStyle: Theme.of(context).textTheme.bodyMedium
                ?.copyWith(
                  color: Theme.of(
                    context,
                  ).bottomNavigationBarTheme.selectedItemColor,
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
                label: "Избранное",
                icon: Icon(Icons.star),
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
