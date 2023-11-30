import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Foodbox/data_parsing/parsing/parsing_contacts/contacts_parse.dart';
import 'package:Foodbox/features/cubit/cubit_for_restaurant/restaurant_cubit.dart';

class EndDrawerHeader extends StatefulWidget {
  const EndDrawerHeader({Key? key}) : super(key: key);

  @override
  State<EndDrawerHeader> createState() => _EndDrawerHeaderState();
}

class _EndDrawerHeaderState extends State<EndDrawerHeader> {

  String contactEmail = "";

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
      contactEmail = contactInfo["email"]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Colors.orange[300],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/images/foodbox.png")
              )
            ),
          ),
          const SizedBox(height: 15),
          BlocBuilder<RestaurantCubit, String>(
              builder: (context, selectedRestaurant) {
              return Text(selectedRestaurant, style: const TextStyle(
                  fontSize: 20,
                  fontFamily: "DMSans-Regular",
                  fontWeight: FontWeight.w700,
                  color: Colors.black
              ),
              );
            }
          ),
          const SizedBox(height: 5),
          Text(contactEmail, style: const TextStyle(
              fontSize: 14,
              fontFamily: "DMSans-Regular",
              fontWeight: FontWeight.w500,
              color: Colors.white
          ),
          ),
        ],
      ),
    );
  }
}
