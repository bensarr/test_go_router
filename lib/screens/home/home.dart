import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_go_router/core/navigations/router_names.dart';
class HomeScreen extends StatefulWidget {
  final Widget child;
  const HomeScreen({
    required this.child,
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'IN PROGRESS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important_rounded),
            label: 'DELIVERIES',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'PROFIL',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith(RouterNames.home)) {
      return 0;
    }
    if (location.startsWith(RouterNames.inprogress)) {
      return 1;
    }
    if (location.startsWith(RouterNames.deliveries)) {
      return 2;
    }
    if (location.startsWith(RouterNames.profil)) {
      return 3;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(RouterNames.home);
        break;
      case 1:
        context.go(RouterNames.inprogress);
        break;
      case 2:
        context.go(RouterNames.deliveries);
        break;
      case 3:
        context.go(RouterNames.profil);
        break;
    }
  }
}
