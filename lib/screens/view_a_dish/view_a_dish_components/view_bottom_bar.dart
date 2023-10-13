import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/features/provider/order_provider.dart';
import 'package:sushi_shop_project/features/provider/request_provider.dart';
import 'package:sushi_shop_project/features/provider/toppings_provider.dart';
import 'package:sushi_shop_project/models/order_model.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildQuantitySelector(),
        buildAddToOrderButton(basePrice),
      ],
    );
  }

  Widget buildQuantitySelector() {
    return Container(
      height: 55,
      padding: const EdgeInsets.only(top: 17, bottom: 17, left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFFF6F6F9),
      ),
      child: Row(
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
          const SizedBox(width: 20),
          Text(
            quantityProvider.quantity.toString(),
            style: const TextStyle(color: Color(0xFFA5A5BA), fontSize: 17),
          ),
          const SizedBox(width: 20),
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

  Widget buildAddToOrderButton(double basePrice) {
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
          orderProvider.addToOrder(orderModel);
          quantityProvider.updateQuantity(0);
          requestProvider.updateRequest('');
          Navigator.pop(context);
        }
      },
      child: Container(
        width: 200,
        height: 60,
        padding:
            const EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24),
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
}
