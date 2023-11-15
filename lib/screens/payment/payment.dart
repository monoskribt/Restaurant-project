import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/features/cubit/cubit_for_restaurant/restaurant_cubit.dart';
import 'package:sushi_shop_project/features/provider/card_details_provider.dart';
import 'package:sushi_shop_project/screens/drawer_widget/main_drawer.dart';
import 'package:sushi_shop_project/screens/order_status/order_status.dart';
import 'package:sushi_shop_project/screens/payment/helpers/bottom_sheet_helper.dart';
import 'package:sushi_shop_project/screens/payment/payment_components/add_new_card.dart';
import 'package:sushi_shop_project/screens/payment/payment_components/card_banking.dart';
import 'package:sushi_shop_project/screens/payment/payment_components/info_about_order.dart';
import 'package:sushi_shop_project/screens/payment/payment_components/payment_bottom_bar.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final GlobalKey<ScaffoldState> paymentScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final cardDetailsProvider = Provider.of<CardDetailsProvider>(context);

    return Scaffold(
      key: paymentScaffoldKey,
      endDrawer: const MainDrawer(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 0.03 * screenHeight,
                  left: 0.06 * screenWidth,
                  right: 0.06 * screenWidth,
                ),
                child: Column(
                  children: [
                    buildTopBar(),
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
          ),
        ),
      ),
      bottomNavigationBar:
      cardDetailsProvider.showCardBanking ? const PaymentBottomBar() : null,
    );
  }

  Widget buildTopBar() {
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
                    Navigator.of(context).pushNamed('/order_status');
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
            paymentScaffoldKey.currentState!.openEndDrawer();
          },
        )
      ],
    );
  }

  Widget buildCardBankingFalseTrue(CardDetailsProvider cardDetailsProvider) {
    return cardDetailsProvider.showCardBanking
        ? CardBanking(cardList: cardDetailsProvider.cardList)
        : const AddNewCard();
  }

  Widget buildPaymentRowTrue(
      BuildContext context, CardDetailsProvider cardDetailsProvider) {
    final screenHeight = MediaQuery.of(context).size.height;
    return cardDetailsProvider.showCardBanking
        ? Padding(
      padding: EdgeInsets.only(
          top: 0.03 * screenHeight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Payment method",
                  style: TextStyle(
                      fontSize: 0.02 * screenHeight,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Mulish-Regular",
                      color: const Color(0xFF666687)),
                ),
              )
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  showViewACard(context);
                },
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Add new card",
                    style: TextStyle(
                        fontSize: 0.02 * screenHeight,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Mulish-Regular",
                        color: const Color(0xFFFFB01D)),
                  ),
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
