import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/payment_widget/tools/card_details_provider.dart';
import 'package:sushi_shop_project/payment_widget/tools/input_formatters.dart';

class NewCard extends StatefulWidget {
  NewCard({Key? key}) : super(key: key);

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  final TextEditingController _cardNumberController = TextEditingController();

  final TextEditingController _cardholderNameController = TextEditingController();

  final TextEditingController _expireDateController = TextEditingController();

  final TextEditingController _cvvController = TextEditingController();

  bool showCardBanking = false;

  @override
  Widget build(BuildContext context) {
    final cardDetailsProvider = Provider.of<CardDetailsProvider>(context);
    final cardDetails = cardDetailsProvider.cardDetails;

    final isCardInfoFinish = cardDetails.cardNumber.isNotEmpty &&
    cardDetails.cardholderName.isNotEmpty &&
    cardDetails.expireDate.isNotEmpty &&
    cardDetails.cvv.isNotEmpty;


    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Add a new card", style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Mulish-Regular",
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF32324D)
                    ),)
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFFEAEAEF),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: TextField(
                          onChanged: (value) {
                            cardDetailsProvider.updateCardNumber(value);
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(16),
                            CartNumberInputFormat(),
                          ],
                          controller: _cardNumberController,
                          decoration: const InputDecoration(
                            hintText: 'Card number',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: "Mulish-Regular",
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF8E8EA9),
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                            counterStyle: TextStyle(
                              fontSize: 13,
                              color: Color(0xFFC0C0CF),
                              fontFamily: "Mulish-Regular",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                          onSubmitted: (value) {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Image.asset(
                          "assets/images/mastercard.png",
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFFEAEAEF),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: TextField(
                          onChanged: (value) {
                            cardDetailsProvider.updateCardholderName(value);
                          },
                          controller: _cardholderNameController,
                          decoration: const InputDecoration(
                            hintText: 'Cardholder name',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: "Mulish-Regular",
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF8E8EA9),
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                            counterStyle: TextStyle(
                              fontSize: 13,
                              color: Color(0xFFC0C0CF),
                              fontFamily: "Mulish-Regular",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                          onSubmitted: (value) {},
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFFEAEAEF),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: TextField(
                                onChanged: (value) {
                                  cardDetailsProvider.updateExpireDate(value);
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(4),
                                  CardMonthInputFormat(),
                                ],
                                controller: _expireDateController,
                                decoration: const InputDecoration(
                                  hintText: 'Expire date',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Mulish-Regular",
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF8E8EA9),
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                  counterStyle: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFFC0C0CF),
                                    fontFamily: "Mulish-Regular",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                textInputAction: TextInputAction.next,
                                onSubmitted: (value) {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFFEAEAEF),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: TextField(
                                onChanged: (value) {
                                  cardDetailsProvider.updateCVV(value);
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(3),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                controller: _cvvController,
                                decoration: const InputDecoration(
                                  hintText: 'CVV',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Mulish-Regular",
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF8E8EA9),
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                  counterStyle: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFFC0C0CF),
                                    fontFamily: "Mulish-Regular",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 36),
                GestureDetector(
                  onTap: () {
                    isCardInfoFinish ? cardDetailsProvider.setShowCardBanking(true) : null;
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFF615793),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Add card", style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Mulish-Regular",
                          color: Colors.white,
                        ),)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),

      ),


    );
  }

  void showViewACard(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return NewCard();
        }
    );
  }
}
