import 'package:flutter/material.dart';
import 'package:money_care/presentation/route/route.dart';
import 'package:money_care/presentation/screen/feature_screen.dart';

import '../screen/main_screen.dart';

void navigate(BuildContext context, MyRoute route) {
  switch (route) {
    case MyRoute.main:
      Future.delayed(Duration.zero, () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      });

    case MyRoute.feature:
      Future.delayed(Duration.zero, () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FeatureScreen()),
        );
      });
  }
}
