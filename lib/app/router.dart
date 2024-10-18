import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:monipoint_challenge/app/router_paths.dart';
import 'package:monipoint_challenge/features/chat/screens/chat.dart';
import 'package:monipoint_challenge/features/favorite/screens/favorite.dart';
import 'package:monipoint_challenge/features/home/screens/home.dart';
import 'package:monipoint_challenge/features/profile/screens/profile.dart';
import 'package:monipoint_challenge/features/search/screens/search.dart';
import 'package:monipoint_challenge/features/splash/screens/splash.dart';
import 'package:monipoint_challenge/resources/colors.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final rootScaffoldStateKey = GlobalKey<ScaffoldState>();

final router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  navigatorKey: rootNavigatorKey,
  // initialLocation: AppPath.timeline.goRoute,
  observers: [],
  initialLocation: AppPath.home.goRoute,
  routes: [
    GoRoute(
      path: AppPath.splash.goRoute,
      builder: (context, state) => const SplashScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          ScaffoldWithNestedNavigation(
        navigationShell: navigationShell,
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppPath.search.goRoute,
              builder: (context, state) => const SearchScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppPath.chat.goRoute,
              builder: (context, state) => const ChatScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppPath.home.goRoute,
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppPath.favorite.goRoute,
              builder: (context, state) => const FavoriteScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppPath.profile.goRoute,
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) => navigationShell.goBranch(
        index,
        initialLocation: index == navigationShell.currentIndex,
      );

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavigationBar(
      body: navigationShell,
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: _goBranch,
    );
  }
}

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
    super.key,
  });

  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: rootScaffoldStateKey,
        body: body,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.noAnimation,
        floatingActionButton: Animate()
            .custom(
              delay: Duration(seconds: 4),
              duration: 2.seconds,
              builder: (_, value, __) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: BottomNavWidget(
                  currentIndex: selectedIndex,
                  onTap: onDestinationSelected,
                ),
              ),
            )
            .slideY(begin: 4.0, end: 0.0));
  }
}

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 64.sp,
        decoration: BoxDecoration(
          color: AppColors.sampleColor3.withOpacity(0.9),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _bottomNavWidget(
                onTap: () => onTap(0),
                currentIndex: currentIndex,
                index: 0,
                icon: Icons.search_outlined),
            _bottomNavWidget(
                onTap: () => onTap(1),
                currentIndex: currentIndex,
                index: 1,
                icon: Icons.message),
            _bottomNavWidget(
                onTap: () => onTap(2),
                currentIndex: currentIndex,
                index: 2,
                icon: Icons.home),
            _bottomNavWidget(
                onTap: () => onTap(3),
                currentIndex: currentIndex,
                index: 3,
                icon: Icons.favorite),
            _bottomNavWidget(
                onTap: () => onTap(4),
                currentIndex: currentIndex,
                index: 4,
                icon: Icons.person),
          ],
        ));
  }

  Widget _bottomNavWidget({
    required int currentIndex,
    required int index,
    required Function()? onTap,
    required IconData icon,
  }) {
    return IconButton(
      onPressed: onTap,
      icon: Container(
        height: currentIndex == index ? 50.sp : 45.sp,
        width: currentIndex == index ? 50.sp : 45.sp,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentIndex == index
              ? AppColors.primaryColor
              : AppColors.sampleColor12,
        ),
        child: Icon(icon),
      ),
      color: AppColors.skyWhite,
    );
  }
}
