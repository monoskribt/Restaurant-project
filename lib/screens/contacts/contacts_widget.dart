import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sushi_shop_project/screens/drawer_widget/main_drawer.dart';
import 'package:sushi_shop_project/screens/full_menu/full_menu.dart';

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
            buildTopBar(context),
            const SizedBox(height: 50),
            buildCircularImage(),
            const SizedBox(height: 10),
            buildContactInfo(),
          ],
        ),
      ),
    );
  }

  Widget buildTopBar(BuildContext context) {
    return Padding(
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
    );
  }

  Widget buildCircularImage() {
    return Container(
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
    );
  }

  Widget buildContactInfo() {
    return Padding(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: buildContactDetails(),
        ),
      ),
    );
  }

  Widget buildContactDetails() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildContactRow("Phone:", "+40 726 301 995"),
        const SizedBox(height: 15),
        buildContactRow("Email:", "office@grambisto.com"),
        const SizedBox(height: 15),
        buildContactRow("Hours:", "Man - Fri: 08:30-00:00\nSut - Sun: 10:00-00:00"),
        const SizedBox(height: 15),
        buildContactRow(
          "Address:",
          "Nicolae Titulescu 6-8\nAmerica House\nBucharest",
        ),
      ],
    );
  }

  Widget buildContactRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildContactText(title),
        buildContactText(value),
      ],
    );
  }

  Widget buildContactText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        fontFamily: "DMSans-Regular",
      ),
    );
  }
}

