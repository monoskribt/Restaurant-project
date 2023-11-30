import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Foodbox/data_parsing/parsing/parsing_contacts/contacts_parse.dart';
import 'package:Foodbox/features/cubit/cubit_for_restaurant/restaurant_cubit.dart';
import 'package:Foodbox/screens/drawer_widget/main_drawer.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();

}



class _ContactsState extends State<Contacts> {

  String contactNumber = "";
  String contactEmail = "";
  String contactAddress = "";

  @override
  void initState() {
    super.initState();
    loadContactInfo();
  }

  Future<void> loadContactInfo() async {
    final restaurantCubit = context.read<RestaurantCubit>();
    final selectedRestaurant = restaurantCubit.state;
    final contactInfo = await ContactInfoParse.loadContactInfo(selectedRestaurant);

    setState(() {
      contactNumber = contactInfo["number"]!;
      contactEmail = contactInfo["email"]!;
      contactAddress = contactInfo["address"]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
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
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 0.03 * screenHeight,
                  left: 0.06 * screenWidth,
                  right: 0.06 * screenWidth,
                  bottom: 0),
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
          ),
        ),
      ),
    );
  }

  Widget buildTopBar(BuildContext context) {
    return Row(
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
                    Navigator.of(context).pushNamed('/');
                  },
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: BlocBuilder<RestaurantCubit, String>(
                        builder: (context, selectedRestaurant) {
                          return Text(
                            selectedRestaurant,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF8E8EA9),
                              fontFamily: "Mulish-Regular",
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const Row(
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
    );
  }

  Widget buildCircularImage() {
    return Container(
      height: 150,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage("assets/images/foodbox.png"),
        ),
      ),
    );
  }

  Widget buildContactInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Container(
          width: 300,
          height: 350,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),

          ),
          child: buildContactDetails(),
        ),
      ),
    );
  }

  Widget buildContactDetails() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildContactRow("Phone: ", contactNumber),
        buildContactRow("Email: ", contactEmail),
        buildContactRow(
          "Address: ",
          contactAddress,
        ),
      ],
    );
  }

  Widget buildContactRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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

