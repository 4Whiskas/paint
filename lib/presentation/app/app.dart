import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/domain/di/global_dependency.dart';
import 'package:template/presentation/navigation/app_router.dart';
import 'package:template/presentation/navigation/guards/auth_guard.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static AppRouter router = AppRouter(AuthGuard());
  static late Locale locale;

  @override
  Widget build(BuildContext context) {
    locale = context.locale;
    return Provider(
      create: GlobalDependency.new,
      dispose: (_, global) => global.dispose(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'sbeugram',

        //if you need to see pixels
        //debugShowMaterialGrid: true,

        //if you need to see device stats
        //showPerformanceOverlay: true,

        //if you need to see paddings and so on
        //showSemanticsDebugger: true,

        //localization
        supportedLocales: context.supportedLocales,
        locale: locale,
        localizationsDelegates: context.localizationDelegates,
        //theming
        theme: ThemeData(useMaterial3: true),
        //navigation
        routerDelegate: router.delegate(),
        routeInformationParser: router.defaultRouteParser(),
        //builders
        builder: (context, child) {
          return child ?? const SizedBox();
        },
      ),
    );
  }
}
