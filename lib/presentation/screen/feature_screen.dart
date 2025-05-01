import 'package:flutter/material.dart';

class FeatureScreen extends StatefulWidget {
  const FeatureScreen({super.key});

  @override
  State<FeatureScreen> createState() => _FeatureScreenState();
}

class MenuItemData {
  final String label;
  final IconData icon;
  final VoidCallback onSelected;

  MenuItemData(this.label, this.icon, this.onSelected);
}

class DropDownMenuData {
  final MenuItemData label;
  final List<MenuItemData> items;

  DropDownMenuData({required this.label, required this.items});

  Widget toWidget() {
    return DropdownMenu(
      expandedInsets: EdgeInsets.zero,
      label: ListTile(leading: Icon(label.icon), title: Text(label.label)),
      dropdownMenuEntries:
          items.map<DropdownMenuEntry<MenuItemData>>((item) {
            return DropdownMenuEntry<MenuItemData>(
              value: item,
              label: item.label,
              labelWidget: ListTile(
                leading: Icon(item.icon),
                title: Text(item.label),
              ),
            );
          }).toList(),
      onSelected: (value) {
        if (value != null) {
          value.onSelected();
        }
      },
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
            child:
                DropDownMenuData(
                  label: MenuItemData("Money", Icons.money, () {}),
                  items: [
                    MenuItemData("Add", Icons.add, () {}),
                    MenuItemData("View", Icons.remove_red_eye_sharp, () {}),
                  ],
                ).toWidget(),
          ),
        ],
      ),
    );
  }
}
