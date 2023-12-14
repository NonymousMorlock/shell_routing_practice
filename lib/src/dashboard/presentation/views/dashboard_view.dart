import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routing_practice/src/home/presentation/views/home_view.dart';
import 'package:routing_practice/src/profile/presentation/views/profile_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({required this.child, required this.state, super.key});

  final Widget child;
  final GoRouterState state;

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  /// In this case, I'm not using this, but you could totally go this route
  /// and use it to track
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      // home, profile, shop
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/');
              // if you were using currentIndex, then you'd have to change it
              // here
              currentIndex = index;
            case 1:
              context.go('/profile');
            // and here
            case 2:
              context.go('/shop');
            // and here
          }
        },
        currentIndex: widget.state.fullPath == HomeView.routeName
            ? 0
            : widget.state.fullPath == ProfileView.routeName
                ? 1
                : 2,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shop',
          ),
        ],
      ),
    );
  }
}
