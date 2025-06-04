import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:money_care/presentation/route/route.dart';
import 'package:money_care/presentation/screen/feature_screen.dart';
import 'package:money_care/presentation/screen/login_screen.dart';
import 'package:money_care/presentation/screen/one_piece_tracking_screen.dart';

import '../screen/main_screen.dart';

void navigate(BuildContext context, MyRoute route) {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    NavigatorState state = Navigator.of(context);
    switch (route) {
      case MyRoute.main:
        state.push(MaterialPageRoute(builder: (context) => const MainScreen()));

      case MyRoute.feature:
        state.push(
          MaterialPageRoute(builder: (context) => const FeatureScreen()),
        );

      case MyRoute.login:
        state.push(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );

      case MyRoute.onePieceTracking:
        state.push(
          MaterialPageRoute(builder: (context) => const OnePieceTrackingScreen()),
        );
    }
  });
}
