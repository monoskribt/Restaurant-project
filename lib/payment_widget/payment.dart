import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/order_status_widget/order_status.dart';
import 'package:sushi_shop_project/order_status_widget/util/bottom_navigation_bar.dart';
import 'package:sushi_shop_project/payment_widget/tools/bottom_sheet_helper.dart';
import 'package:sushi_shop_project/payment_widget/util/add_new_card.dart';
import 'package:sushi_shop_project/payment_widget/util/bottom_navigation_bar.dart';
import 'package:sushi_shop_project/payment_widget/util/card_banking.dart';
import 'package:sushi_shop_project/payment_widget/util/info_about_order.dart';
import 'package:sushi_shop_project/payment_widget/tools/card_details_provider.dart';

class Payment extends StatelessWidget {
  Payment({Key? key}) : super(key: key);

  bool isTextEmpty = true;

  bool newCard = false;

  bool showCardBanking = false;

  @override
  Widget build(BuildContext context) {
    final cardDetailsProvider = Provider.of<CardDetailsProvider>(context);
    final cardDetails = cardDetailsProvider.cardDetails;

    return Scaffold(
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              icon: const Icon(Icons.arrow_back, size: 22),
                              color: const Color(0xFF666687),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const OrderStatus()),
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
                                  "Checkout",
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
                    IconButton(
                      icon: SvgPicture.asset(
                        "assets/images/menu.svg",
                        height: 24,
                        width: 24,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              cardDetailsProvider.showCardBanking
                  ? Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, right: 24, left: 24, bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Text(
                                "Payment method",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Mulish-Regular",
                                    color: Color(0xFF666687)),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showViewACard(context);
                                },
                                child: const Text(
                                  "Add new card",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Mulish-Regular",
                                      color: Color(0xFFFFB01D)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(height: 20),
              cardDetailsProvider.showCardBanking
                  ? CardBanking(cardList: cardDetailsProvider.cardList)
                  : const AddNewCard(),
              const SizedBox(height: 15),
              InfoAboutOrder(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: cardDetailsProvider.showCardBanking ? const BottomBarPayment() : null,
    );
  }
  void showViewACard(BuildContext context) {
    BottomSheetHelper().showViewACard(context);
  }
}
