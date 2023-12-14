import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routing_practice/src/dashboard/presentation/views/dashboard_view.dart';
import 'package:routing_practice/src/home/presentation/views/home_view.dart';
import 'package:routing_practice/src/profile/presentation/views/profile_view.dart';
import 'package:routing_practice/src/shop/presentation/views/shop_view.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: '/home',
  errorBuilder: (context, state) => Scaffold(
    body: Center(child: Text(state.error.toString())),
  ),
  routes: [
    GoRoute(path: '/', redirect: (_, __) => HomeView.routeName),
    ShellRoute(
      navigatorKey: GlobalKey<NavigatorState>(),
      builder: (_, state, child) => DashboardView(state: state, child: child),
      routes: [
        GoRoute(
          path: HomeView.routeName,
          name: 'home',
          pageBuilder: (context, state) => _pageBuilder(
            const HomeView(),
            state: state,
          ),
        ),
        GoRoute(
          path: ProfileView.routeName,
          name: 'profile',
          pageBuilder: (context, state) => _pageBuilder(
            const ProfileView(),
            state: state,
          ),
        ),
        GoRoute(
          path: ShopView.routeName,
          name: 'shop',
          pageBuilder: (context, state) => _pageBuilder(
            const ShopView(),
            state: state,
          ),
        ),
      ],
    ),
  ],
);

Page<dynamic> _pageBuilder(Widget page, {required GoRouterState state}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: page,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
      child: child,
    ),
  );
}
