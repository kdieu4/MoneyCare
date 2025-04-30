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
        items: [
          BottomNavigationBarItem(
            label: "All Feature",
            icon: IconButton(
              onPressed: () {
                navigate(context, MyRoute.feature);
              },
              icon: Icon(Icons.category),
            ),
          ),
          BottomNavigationBarItem(
            label: "User",
            icon: IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          ),
        ],
      ),
    );
  }
}
