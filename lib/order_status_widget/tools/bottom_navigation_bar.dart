import 'package:flutter/material.dart';

class BottomBarOrder extends StatelessWidget {
  BottomBarOrder({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {


    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(26),
          topRight: Radius.circular(26),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFDCDCE4),
            offset: Offset(0, -10),
            blurRadius: 20,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x0C1A4B05),
            offset: Offset(0, 0),
            blurRadius: 5,
            spreadRadius: 0,
          ),
        ],
      ),
      child: InkWell(
        onTap: () {

        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 340,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xFF615793),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Pay",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Mulish-Regular",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "\$53.80",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Mulish-Regular",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
