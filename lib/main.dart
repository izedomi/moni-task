import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moni/core/routes/router.dart';
import 'package:moni/locator.dart';
import 'package:moni/ui/pages/cluster.dart';
import 'package:moni/ui/shared/helpers/colors.dart';
import 'package:provider/provider.dart';

import 'ui/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 700),
        builder: () {
          return MultiProvider(
            providers: allProviders,
            child: MaterialApp(
              title: "Moni",
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch: Colors.orange,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  primaryColor: orange,
                  fontFamily: 'DMSans'),
              home: const SplashPage(),
              onGenerateRoute: AppRouter.generateRoute,
            ),
          );
        });
  }
}
