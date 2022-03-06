import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moni/core/constants/images.dart';
import 'package:moni/ui/shared/helpers/space.dart';
import 'package:moni/ui/shared/helpers/utils.dart';

class LoadingBackground extends StatefulWidget {
  const LoadingBackground({Key? key}) : super(key: key);
  @override
  _LoadingBackgroundState createState() => _LoadingBackgroundState();
}

class _LoadingBackgroundState extends State<LoadingBackground> {
  late Timer timer;
  double _opacity = 1;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 700), (Timer t) {
      _opacity == 1
          ? setState(() => _opacity = 0)
          : setState(() => _opacity = 1);
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: deviceWidth(context),
      height: deviceHeight(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          VSpace(3.h),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _opacity,
            curve: Curves.easeInOut,
            child: Column(
              children: <Widget>[
                Image.asset(
                  moniLogo,
                  width: 100.w,
                  height: 100.w,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
