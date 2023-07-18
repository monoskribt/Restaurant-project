import 'package:flutter/material.dart';

class EndDrawerHeader extends StatelessWidget {
  const EndDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Colors.orange[300],
        borderRadius: BorderRadius.only(
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
                image: AssetImage("assets/images/logo.jpg")
              )
            ),
          ),
          const SizedBox(height: 15),
          const Text("Gram Bistro", style: TextStyle(
              fontSize: 20,
              fontFamily: "DMSans-Regular",
              fontWeight: FontWeight.w700,
              color: Colors.black
          ),
          ),
          const SizedBox(height: 5),
          const Text("@GRAMBISTROBUCHAREST", style: TextStyle(
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
