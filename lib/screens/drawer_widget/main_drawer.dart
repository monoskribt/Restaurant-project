import 'package:flutter/material.dart';
import 'package:Foodbox/screens/drawer_widget/drawer_header.dart';
import 'package:provider/provider.dart';

import '../../features/provider/order_provider.dart';



class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  late OrderProvider orderProvider;

  @override
  void initState() {
    super.initState();
    orderProvider = Provider.of<OrderProvider>(context, listen: false);
  }

  int calculateTotalQuantity() {
    int totalQuantity = 0;
    for(var order in orderProvider.orderMap.values) {
      totalQuantity += order.quantity;
    }
    return totalQuantity;
  }


  @override
  Widget build(BuildContext context) {
    int totalQuantity = calculateTotalQuantity();
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(26),
        bottomLeft: Radius.circular(26),
      ),
      child: FractionallySizedBox(
        widthFactor: 0.7,
        heightFactor: 1.0,
        child: Drawer(
          child: Container(
            height: double.infinity,
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
            child: SingleChildScrollView(
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
                      Navigator.pop(context);
                      Navigator.of(context).pushNamed('/');
                    },
                  ),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          totalQuantity > 0 ? "Order ($totalQuantity)" : "Order",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: "DMSans-Regular",
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).pushNamed('/order_menu');
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
                      Navigator.pop(context);
                      Navigator.of(context).pushNamed('/contacts');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
