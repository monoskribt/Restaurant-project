import 'package:flutter/material.dart';
import 'package:sushi_shop_project/screens/payment/helpers/bottom_sheet_helper.dart';


class AddNewCard extends StatelessWidget {
  const AddNewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3232470A),
            offset: Offset(0, 4),
            blurRadius: 20,
            spreadRadius: -2,
          ),
          BoxShadow(
            color: Color(0x0C1A4B08),
            offset: Offset(0, 0),
            blurRadius: 1,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0, left: 10, right: 10.0),
        child: buildMainContent(context),
      ),
    );
  }

  Widget buildMainContent(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Image.asset(
            "assets/images/wallet.png",
            width: 70,
            height: 70,
          ),
        ),
        const SizedBox(height: 20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You don’t have any card",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: "Mulish-Regular",
                color: Color(0xFF32324D),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                "Please add a credit or a debit card in order to pay your order.",
                style: TextStyle(
                    fontFamily: "Mulish-Regular",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8E8EA9)),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        buildNewCardButton(context),
      ],
    );
  }

  Widget buildNewCardButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BottomSheetHelper.showViewACard(context);
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
              "Add a new card",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFFB01D),
                fontFamily: "Mulish-Regular",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
