import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:paint/presentation/screens/auth/auth_view.dart';
import 'package:paint/presentation/screens/home/home_view.dart';

import 'guards/auth_guard.dart';

part 'app_router.gr.dart';

@CustomAutoRouter(
  replaceInRouteName: 'View,Route,Widget',
  transitionsBuilder: TransitionsBuilders.slideRightWithFade,
  routes: <AutoRoute>[
    AutoRoute(
      page: AuthView,
      path: 'login',
    ),
    AutoRoute(
      page: HomeView,
      path: '/',
      initial: true,
      guards: [AuthGuard],
      children: <AutoRoute>[],
    ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter(AuthGuard authGuard) : super(authGuard: authGuard);
}
