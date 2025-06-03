import 'package:flutter/material.dart';
import 'package:money_care/presentation/route/route.dart';
import 'package:money_care/presentation/route/router.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (id) {
          if (id == 0) {
            navigate(context, MyRoute.feature);
          } else if (id == 1) {
            navigate(context, MyRoute.login);
          }
        },
        items: [
          BottomNavigationBarItem(
            label: "All Feature",
            icon: const Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            label: "User",
            icon: const Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
