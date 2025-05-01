import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:money_care/presentation/route/route.dart';
import 'package:money_care/presentation/screen/feature_screen.dart';

import '../screen/main_screen.dart';

void navigate(BuildContext context, MyRoute route) {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    switch (route) {
      case MyRoute.main:
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const MainScreen()));

      case MyRoute.feature:
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const FeatureScreen()));
        ;
    }
  });
}
