import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/PROVIDER/order_provider.dart';
import 'package:sushi_shop_project/order_widget/tools/order_model.dart';
import '../tools/request_provider.dart';
import '../tools/toppings_provider.dart';

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
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    final quantityProvider = Provider.of<ToppingsProvider>(context);
    final requestProvider = Provider.of<RequestProvider>(context);
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

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 55,
                padding: const EdgeInsets.only(
                    top: 17, bottom: 17, left: 15, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xFFF6F6F9),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (quantityProvider.quantity > 0) {
                          quantityProvider
                              .updateQuantity(quantityProvider.quantity - 1);
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
                      style: const TextStyle(
                          color: Color(0xFFA5A5BA), fontSize: 17),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        quantityProvider
                            .updateQuantity(quantityProvider.quantity + 1);
                      },
                      child: const Icon(
                        Icons.add,
                        color: Color(0xFF8E8EA9),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
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
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  width: 200,
                  height: 60,
                  padding: const EdgeInsets.only(
                      top: 16, bottom: 16, left: 24, right: 24),
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
              ),
            ],
          );
        },
      ),
    );
  }
}
