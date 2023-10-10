import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/features/provider/card_details_provider.dart';
import 'package:sushi_shop_project/screens/drawer_widget/main_drawer.dart';
import 'package:sushi_shop_project/screens/order_status/order_status.dart';
import 'package:sushi_shop_project/screens/payment/helpers/bottom_sheet_helper.dart';
import 'package:sushi_shop_project/screens/payment/payment_components/add_new_card.dart';
import 'package:sushi_shop_project/screens/payment/payment_components/card_banking.dart';
import 'package:sushi_shop_project/screens/payment/payment_components/info_about_order.dart';
import 'package:sushi_shop_project/screens/payment/payment_components/payment_bottom_bar.dart';

class Payment extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardDetailsProvider = Provider.of<CardDetailsProvider>(context);
    return Scaffold(
      key: scaffoldKey,
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
              buildTopBar(context),
              buildPaymentRowTrue(context, cardDetailsProvider),
              const SizedBox(height: 20),
              buildCardBankingFalseTrue(cardDetailsProvider),
              const SizedBox(height: 15),
              InfoAboutOrder(),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          cardDetailsProvider.showCardBanking ? const PaymentBottomBar() : null,
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
            onPressed: () {
              scaffoldKey.currentState?.openEndDrawer();
            },
          )
        ],
      ),
    );
  }

  Widget buildCardBankingFalseTrue(CardDetailsProvider cardDetailsProvider) {
    return cardDetailsProvider.showCardBanking
        ? CardBanking(cardList: cardDetailsProvider.cardList)
        : const AddNewCard();
  }

  Widget buildPaymentRowTrue(
      BuildContext context, CardDetailsProvider cardDetailsProvider) {
    return cardDetailsProvider.showCardBanking
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
        : const SizedBox.shrink();
  }

  void showViewACard(BuildContext context) {
    BottomSheetHelper.showViewACard(context);
  }
}
