import 'package:flutter/material.dart';
import 'package:sushi_shop_project/contacts_widget.dart';
import 'package:sushi_shop_project/drawer_widget/drawer_header.dart';
import 'package:sushi_shop_project/full_menu_widget/full_menu.dart';
import 'package:sushi_shop_project/order_widget/order_menu.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(26),
        bottomLeft: Radius.circular(26),
      ),
      child: Drawer(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFFFCFCFC),
                  Color(0xFFF7F7F7),
                  Color(0xFFF7F7F7),
                  Color(0xFFF7F7F7),
                  Color(0xFFFCFCFC),
                ],
                stops: [0, 0.1004, 0.5156, 0.8958, 1],
              ),
            ),
            child: Column(
              children: [
                const EndDrawerHeader(),
                const SizedBox(height: 20),
                ListTile(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Full Menu",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: "DMSans-Regular",
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FullMenu()),
                    );
                  },
                ),
                ListTile(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Order",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: "DMSans-Regular",
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const OrderMenu()),
                    );
                  },
                ),
                ListTile(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Contacts",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: "DMSans-Regular",
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Contacts()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
