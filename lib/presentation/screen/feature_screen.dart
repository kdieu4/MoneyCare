import 'package:flutter/material.dart';

class FeatureScreen extends StatefulWidget {
  const FeatureScreen({super.key});

  @override
  State<FeatureScreen> createState() => _FeatureScreenState();
}

class _FeatureScreenState extends State<FeatureScreen> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Feature")),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                _visible = !_visible;
              });
            },
            child: Card(
              child: ListTile(leading: Icon(Icons.money), title: Text("Money")),
            ),
          ),
          Visibility(
            visible: _visible,
            child: Column(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Card(child: ListTile(title: Text("View"))),
                ),
                TextButton(
                  onPressed: () {},
                  child: Card(child: ListTile(title: Text("Add"))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
