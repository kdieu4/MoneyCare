import 'package:flutter/material.dart';

import '../route/route.dart';
import '../route/router.dart';

class FeatureScreen extends StatefulWidget {
  const FeatureScreen({super.key});

  @override
  State<FeatureScreen> createState() => _FeatureScreenState();
}

typedef ContextCallback = void Function(BuildContext context);

class MenuItemData {
  final String label;
  final IconData icon;
  final ContextCallback onSelected;

  MenuItemData(this.label, this.icon, this.onSelected);
}

class DropDownMenuData extends StatefulWidget {
  final MenuItemData label;
  final List<MenuItemData> items;

  const DropDownMenuData({super.key, required this.label, required this.items});

  @override
  State<StatefulWidget> createState() => _DropDownMenuDataState();
}

class _DropDownMenuDataState extends State<DropDownMenuData> {
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isShow = !isShow;
            });
          },
          child: ListTile(
            leading: Icon(widget.label.icon),
            title: Text(widget.label.label),
            hoverColor: Colors.blueAccent,
          ),
        ),
        Visibility(
          visible: isShow,
          child: Column(
            children:
                widget.items.map<GestureDetector>((item) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        item.onSelected(context);
                      });
                    },
                    child: ListTile(
                      leading: Icon(item.icon),
                      title: Text(item.label),
                      hoverColor: Colors.blueAccent,
                    ),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}

class _FeatureScreenState extends State<FeatureScreen> {
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
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: DropDownMenuData(
              label: MenuItemData("Money", Icons.money, (ctx) {}),
              items: [
                MenuItemData("Add", Icons.add, (ctx) {}),
                MenuItemData("View", Icons.remove_red_eye_sharp, (ctx) {}),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: DropDownMenuData(
              label: MenuItemData(
                "OnePiece Tracking",
                Icons.directions_boat,
                (ctx) {},
              ),
              items: [
                MenuItemData("Edit", Icons.edit, (ctx) {
                  navigate(ctx, MyRoute.onePieceTracking);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
