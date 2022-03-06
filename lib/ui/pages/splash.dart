import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moni/core/constants/images.dart';
import 'package:moni/core/routes/routes.dart';
import 'package:moni/ui/shared/helpers/colors.dart';
import 'package:moni/ui/shared/helpers/utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RoutePaths.clusterPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SizedBox(
        width: deviceWidth(context),
        height: deviceHeight(context),
        child: Center(
          child: Image.asset(moniLogo1, width: 160.w, height: 160.w),
        ),
      ),
    );
  }
}
