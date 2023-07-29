import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_go_router/core/navigations/router_names.dart';
import 'package:test_go_router/screens/auth/login.dart';
import 'package:test_go_router/screens/auth/signup.dart';
import 'package:test_go_router/screens/home/deliveries.dart';
import 'package:test_go_router/screens/home/in_progress.dart';
import 'package:test_go_router/screens/home/profile.dart';
import 'package:test_go_router/screens/home/home.dart';
import 'package:test_go_router/screens/home/subscreens/confirmation.dart';
import 'package:test_go_router/core/ui/detail.dart';
import 'package:test_go_router/screens/home/subscreens/histories.dart';
import 'package:test_go_router/screens/home/main.home.dart';
import 'package:test_go_router/screens/home/subscreens/notification.dart';
import 'package:test_go_router/screens/tracking/traking.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> _shellHomeNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final routerConfig = GoRouter(
  initialLocation: RouterNames.root,
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: RouterNames.root,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: RouterNames.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: RouterNames.signup,
      builder: (context, state) => const SignUpScreen(),
    ),
    ShellRoute(
      navigatorKey: _shellHomeNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return HomeScreen(child: child);
      },
      routes: <RouteBase>[
        /// The first screen to display in the bottom navigation bar.
        GoRoute(
          path: RouterNames.home,
          builder: (BuildContext context, GoRouterState state) {
            return const HomeWidget();
          },
          routes: <RouteBase>[
            /// Same as "/a/details", but displayed on the root Navigator by
            /// specifying [parentNavigatorKey]. This will cover both screen B
            /// and the application shell.
            GoRoute(
              path: RouterNames.notifications,
              parentNavigatorKey: _rootNavigatorKey,
              builder: (BuildContext context, GoRouterState state) {
                return const NotificationScreen();
              },
            ),
            GoRoute(
              name: 'confirmation',
              path: RouterNames.confirmation,
              parentNavigatorKey: _rootNavigatorKey,
              builder: (BuildContext context, GoRouterState state) {
                return OrderConfirmScreen(orderId: state.pathParameters['orderId']!,);
              },
            ),
            GoRoute(
              path: RouterNames.histories,
              parentNavigatorKey: _rootNavigatorKey,
              builder: (BuildContext context, GoRouterState state) {
                return const HistoryScreen();
              },
              routes: [
                GoRoute(
                  path: RouterNames.details,
                  name: 'historyItemOnListOrder',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    return itemOnListOrder(state);
                  },
                ),
              ]
            ),
            GoRoute(
              path: RouterNames.details,
              name: 'homeItemOnListOrder',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (BuildContext context, GoRouterState state) {
                return itemOnListOrder(state);
              },
            ),
          ],
        ),

        /// Displayed when the second item in the the bottom navigation bar is
        /// selected.
        GoRoute(
          path: RouterNames.inprogress,
          builder: (BuildContext context, GoRouterState state) {
            return const InProgressScreen();
          },
            routes: [
              GoRoute(
                path: RouterNames.details,
                name: 'inProgressItemOnListOrder',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return itemOnListOrder(state);
                },
              ),
            ]
        ),

        /// The third screen to display in the bottom navigation bar.
        GoRoute(
          path: RouterNames.deliveries,
          builder: (BuildContext context, GoRouterState state) {
            return const FavoritesListWidget();
          },
        ),

        /// The 4th screen to display in the bottom navigation bar.
        GoRoute(
          path: RouterNames.profil,
          builder: (BuildContext context, GoRouterState state) {
            return const ProfileScreen();
          },
        ),
      ],
    ),
  ],
  /*redirect: (context, state) {
    final loggingIn = false;
    if (!loggedIn) return loggingIn ? null : '/login';
    return null;
  },*/
);

itemOnListOrder(GoRouterState state){
  if (state.queryParameters['status'] != null &&
      (state.queryParameters['status'] == 'CANCELLED' ||
          state.queryParameters['status'] == 'FINISHED')) {
    return DeliveryDetailsScreen(
      orderId: state.pathParameters['orderId']!,
      status: state.queryParameters['status']!,
      delivererId: state.queryParameters['delivererId'],
    );
  } else {
    if (state.queryParameters['delivererId'] != null) {
      return DeliveryTrakingScreen(
        orderId: state.pathParameters['orderId']!,
      );
    } else {
      return OrderConfirmScreen(
        orderId: state.pathParameters['orderId']!,
      );
    }
  }
}
