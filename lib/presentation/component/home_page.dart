import 'package:flutter/material.dart';
import 'package:money_care/presentation/route/route.dart';
import 'package:money_care/presentation/route/router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    navigate(context, MyRoute.main);
  }

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}