import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:Foodbox/features/provider/order_provider.dart';
import 'package:Foodbox/features/provider/request_provider.dart';
import 'package:Foodbox/features/provider/toppings_provider.dart';
import 'package:Foodbox/models/order_model.dart';
import 'package:provider/provider.dart';


import '../snackbar/snackbar_added_to_order.dart';

class ViewBottomBar extends StatefulWidget {
  final double priceView;
  final String imageDishView;
  final String nameDishView;

  const ViewBottomBar({
    Key? key,
    required this.priceView,
    required this.imageDishView,
    required this.nameDishView,
  }) : super(key: key);

  @override
  State<ViewBottomBar> createState() => _ViewBottomBarState();
}

class _ViewBottomBarState extends State<ViewBottomBar> {
  late OrderProvider orderProvider;
  late ToppingsProvider quantityProvider;
  late RequestProvider requestProvider;

  @override
  void initState() {
    super.initState();
    orderProvider = Provider.of<OrderProvider>(context, listen: false);
    quantityProvider = Provider.of<ToppingsProvider>(context, listen: false);
    requestProvider = Provider.of<RequestProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(26),
          topRight: Radius.circular(26),
        ),
      ),
      child: Consumer<ToppingsProvider>(
        builder: (context, toppingsProvider, _) {
          double basePrice = widget.priceView * quantityProvider.quantity;
          return buildBottomBar(basePrice);
        },
      ),
    );
  }

  Widget buildBottomBar(double basePrice) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double buttonWidth = constraints.maxWidth * 0.4;
        double buttonHeight = constraints.maxHeight * 0.08;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildQuantitySelector(buttonWidth, buttonHeight),
            buildAddToOrderButton(basePrice, buttonWidth, buttonHeight),
          ],
        );
      },
    );
  }

  Widget buildQuantitySelector(double buttonWidth, double buttonHeight) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: buttonWidth / 1.2,
      height: buttonHeight,
      padding: EdgeInsets.only(
          top: 0.01 * screenHeight / 2,
          bottom: 0.01 * screenHeight / 2,
          left: 0.03 * screenWidth,
          right: 0.03 * screenWidth),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFFF6F6F9),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              if (quantityProvider.quantity > 0) {
                quantityProvider.updateQuantity(quantityProvider.quantity - 1);
              }
            },
            child: const Icon(
              Icons.remove,
              color: Color(0xFFDCDCE4),
            ),
          ),
          Text(
            quantityProvider.quantity.toString(),
            style: TextStyle(
                color: const Color(0xFFA5A5BA), fontSize: 0.025 * screenHeight),
          ),
          GestureDetector(
            onTap: () {
              quantityProvider.updateQuantity(quantityProvider.quantity + 1);
            },
            child: const Icon(
              Icons.add,
              color: Color(0xFF8E8EA9),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAddToOrderButton(
      double basePrice, double buttonWidth, double buttonHeight) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        if (quantityProvider.quantity > 0) {
          OrderModel orderModel = OrderModel(
            image: widget.imageDishView,
            name: widget.nameDishView,
            price: widget.priceView,
            quantity: quantityProvider.quantity,
            comment: requestProvider.request,
          );
          if (!orderProvider.orderMap.containsKey(widget.nameDishView)) {
            orderProvider.addToOrder(orderModel);
            showInfoAboutSelectedDish(context);
          } else {
            SnackBarAddToOrder.showSnackBar(
                context,
                'Dishes are already in order',
                quantityProvider.quantity,
                false);
          }
          requestProvider.updateRequest('');
        }
      },
      child: Container(
        width: buttonWidth * 1.2,
        height: buttonHeight * 1.1,
        padding: EdgeInsets.only(
            top: 0.01 * screenHeight,
            bottom: 0.01 * screenHeight,
            left: 0.04 * screenWidth,
            right: 0.04 * screenWidth),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFF615793),
        ),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Add to order ',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Mulish-Regular",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: '\$${basePrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Mulish-Regular",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showInfoAboutSelectedDish(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 0.05 * screenHeight,
            ),
            content: Text(
              '"${widget.nameDishView}" added to order in quantities: ${quantityProvider.quantity}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 0.02 * screenHeight,
                fontFamily: "Mulish-Regular",

              ),
            ),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 0.02 * screenHeight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        TextButton(
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 0.02 * screenHeight,
                              fontFamily: "Mulish-Regular",
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFFFF7B2C),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextButton(
                          child: Text(
                            'Order',
                            style: TextStyle(
                              fontSize: 0.02 * screenHeight,
                              fontFamily: "Mulish-Regular",
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFFFF7B2C),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('/order_menu');
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        });
  }
}
