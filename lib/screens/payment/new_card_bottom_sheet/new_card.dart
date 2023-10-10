import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/features/provider/card_details_provider.dart';
import 'package:sushi_shop_project/models/card_details_model.dart';
import 'package:sushi_shop_project/screens/payment/tools/input_formatters.dart';

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

    final isCardInfoFinish =
        cardDetails.cardNumber.isNotEmpty &&
            cardDetails.cardholderName.isNotEmpty &&
            cardDetails.expireDate.isNotEmpty &&
            cardDetails.cvv.isNotEmpty;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add a new card",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Mulish-Regular",
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF32324D),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                buildInputField(
                  _cardNumberController,
                  'Card number',
                  TextInputType.number,
                  [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(16),
                    CartNumberInputFormat(),
                  ],
                  cardDetailsProvider,
                  TextInputAction.next,
                ),
                const SizedBox(height: 16),
                buildInputField(
                  _cardholderNameController,
                  'Cardholder name',
                  TextInputType.text,
                  [],
                  cardDetailsProvider,
                  TextInputAction.next,
                ),
                const SizedBox(height: 16),
                buildDateAndCVVFields(cardDetailsProvider),

                const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  if (isCardInfoFinish) {
                    CardDetails newCard = CardDetails();
                    newCard.cardNumber = _cardNumberController.text;
                    newCard.cardholderName = _cardholderNameController.text;
                    newCard.expireDate = _expireDateController.text;
                    newCard.cvv = _cvvController.text;

                    cardDetailsProvider.addCard(newCard);

                    _cardNumberController.clear();
                    _cardholderNameController.clear();
                    _expireDateController.clear();
                    _cvvController.clear();

                    Navigator.pop(context);
                  }
                  isCardInfoFinish ? cardDetailsProvider.setShowCardBanking(true) : null;
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFF615793),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Text(
                      "Add card",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Mulish-Regular",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInputField(
      TextEditingController controller,
      String hintText,
      TextInputType inputType,
      List<TextInputFormatter> inputFormatters,
      CardDetailsProvider cardDetailsProvider,
      TextInputAction textInputAction,
      ) {
    return Container(
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
                if (hintText.toLowerCase().contains("card number")) {
                  cardDetailsProvider.updateCardNumber(value);
                } else if (hintText.toLowerCase().contains("cardholder")) {
                  cardDetailsProvider.updateCardholderName(value);
                } else if (hintText.toLowerCase().contains("expire date")) {
                  cardDetailsProvider.updateExpireDate(value);
                } else if (hintText.toLowerCase().contains("cvv")) {
                  cardDetailsProvider.updateCVV(value);
                }
              },
              keyboardType: inputType,
              inputFormatters: inputFormatters,
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontSize: 14,
                  fontFamily: "Mulish-Regular",
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF8E8EA9),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                counterStyle: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFFC0C0CF),
                  fontFamily: "Mulish-Regular",
                  fontWeight: FontWeight.w400,
                ),
              ),
              textInputAction: textInputAction,
              onSubmitted: (value) {},
            ),
          ),
          if(hintText.toLowerCase().contains("card number"))
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
    );
  }


  Widget buildDateAndCVVFields(CardDetailsProvider cardDetailsProvider) {
    return Row(
      children: [
        Expanded(
          child: buildInputField(
            _expireDateController,
            'Expire date',
            TextInputType.number,
            [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
              CardMonthInputFormat(),
            ],
              cardDetailsProvider,
            TextInputAction.next,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: buildInputField(
            _cvvController,
            'CVV',
            TextInputType.number,
            [LengthLimitingTextInputFormatter(3),
              FilteringTextInputFormatter.digitsOnly,
            ],
            cardDetailsProvider,
            TextInputAction.done,
          ),
        ),
      ],
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
