import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:paint/domain/di/global_dependency.dart';
import 'package:paint/gen/colors.gen.dart';
import 'package:paint/presentation/navigation/app_router.dart';
import 'package:paint/presentation/navigation/guards/auth_guard.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static AppRouter router = AppRouter(AuthGuard());
  static late Locale locale;

  @override
  Widget build(BuildContext context) {
    locale = context.locale;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'paint',

      //localization
      supportedLocales: context.supportedLocales,
      locale: locale,
      localizationsDelegates: context.localizationDelegates,
      //theming
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: ColorName.white,
      ),
      //navigation
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
      //builders
      builder: (_, child) {
        return Navigator(
          pages: [
            CupertinoPage(
              child: Provider(
                create: GlobalDependency.new,
                dispose: (_, global) => global.dispose(),
                child: child ?? const SizedBox(),
              ),
            ),
          ],
          onPopPage: (_, __) => false,
        );
      },
    );
  }
}
