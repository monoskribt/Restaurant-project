import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sushi_shop_project/drawer_widget/main_drawer.dart';
import 'package:sushi_shop_project/full_menu_widget/full_menu.dart';
import 'package:sushi_shop_project/order_widget/function/order_body_function.dart';
import 'package:sushi_shop_project/order_widget/tools/bottom_navigation_bar.dart';

class OrderMenu extends StatelessWidget {
  const OrderMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MainDrawer(),
      body: SingleChildScrollView(
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
              Padding(
                padding: const EdgeInsets.only(top: 50.0, right: 24, left: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x32324705),
                                  offset: Offset(0, 4),
                                  blurRadius: 20,
                                  spreadRadius: -2,
                                ),
                                BoxShadow(
                                  color: Color(0x0C1A4B0D),
                                  offset: Offset(0, 0),
                                  blurRadius: 2,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: IconButton(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                              icon: const Icon(Icons.arrow_back, size: 22),
                              color: const Color(0xFF666687),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const FullMenu()),
                                );
                              },
                            ),
                          ),
                        ),

                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 2.0),
                                  child: Text(
                                    "Gram Bistro",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF8E8EA9),
                                      fontFamily: "Mulish-Regular",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Your order",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF32324D),
                                    fontFamily: "Mulish-Regular",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Builder(builder: (context) {
                      return IconButton(
                        icon: SvgPicture.asset(
                          "assets/images/menu.svg",
                          height: 24,
                          width: 24,
                        ),
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                      );
                    })
                  ],
                ),
              ),
              const SizedBox(height: 15),
              OrderBody(),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FullMenu())
                  );
                },
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.add,
                          size: 25,
                          color: Color(0xFFFFB01D),
                        ),
                      ),
                      Text(
                        "Add more food to order",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFB01D),
                          fontFamily: "Mulish-Regular",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}

