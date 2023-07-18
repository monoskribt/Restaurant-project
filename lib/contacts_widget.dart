import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sushi_shop_project/drawer_widget/main_drawer.dart';

import 'full_menu_widget/full_menu.dart';

class Contacts extends StatelessWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MainDrawer(),
      body: Container(
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            icon: const Icon(Icons.arrow_back, size: 22),
                            color: const Color(0xFF666687),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FullMenu()),
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
                                "Contacts",
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
            const SizedBox(height: 30),
            Container(
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: const DecorationImage(
                  image: AssetImage("assets/images/logo.jpg"),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 4),
                    blurRadius: 20,
                    spreadRadius: 10,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0, right: 24, left: 24),
              child: Container(
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0, 4),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Phone:",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "DMSans-Regular",
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "+40 726 301 995",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "DMSans-Regular",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Email:",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "DMSans-Regular",
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "office@grambisto.com",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "DMSans-Regular",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Hours:",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "DMSans-Regular",
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Man - Fri: ",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "DMSans-Regular",
                                    ),
                                  ),
                                  Text(
                                    "08:30-00:00",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "DMSans-Regular",
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    "Sut - Sun: ",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "DMSans-Regular",
                                    ),
                                  ),
                                  Text(
                                    "10:00-00:00",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "DMSans-Regular",
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Address:",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "DMSans-Regular",
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Nicolae Titulescu 6-8 ",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "DMSans-Regular",
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    "America House ",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "DMSans-Regular",
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    "Bucharest ",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "DMSans-Regular",
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
