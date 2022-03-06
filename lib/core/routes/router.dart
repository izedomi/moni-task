import 'package:flutter/material.dart';
import 'package:moni/core/routes/routes.dart';
import 'package:moni/ui/pages/cluster.dart';
import 'package:moni/ui/pages/splash.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splashPage:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case RoutePaths.clusterPage:
        return MaterialPageRoute(builder: (_) => const ClusterPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
