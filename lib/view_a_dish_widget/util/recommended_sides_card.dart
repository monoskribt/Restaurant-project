import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../PROVIDER/order_provider.dart';
import '../../order_widget/tools/order_model.dart';
import '../tools/cart_counter.dart';
import '../tools/request_provider.dart';
import '../view_a_dish.dart';

class RecommendedSidesCard extends StatelessWidget {
  final String imageRecommended;
  final String nameRecommended;
  final double priceRecommended;

  const RecommendedSidesCard({
    Key? key,
    required this.imageRecommended,
    required this.nameRecommended,
    required this.priceRecommended,
  }) : super(key: key);

  void showViewADish(BuildContext context) {
    showModalBottomSheet<void>(
      enableDrag: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(25),
          ),
          child: FractionallySizedBox(
            heightFactor: 7 / 8,
            child: ViewADish(
              imageDishView: imageRecommended,
              nameDishView: nameRecommended,
              priceView: priceRecommended,
              descriptionView: '',
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        showViewADish(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 120,
            color: Colors.white,
            child: Row(
              children: [
                SizedBox(
                  width: 120,
                  height: 140,
                  child: Image.asset(
                    imageRecommended,
                    width: 140,
                    height: 140,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 1.0, bottom: 10.0, top: 10.0),
                            child: Row(
                              children: [
                                Text(
                                  nameRecommended,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Mulish-Regular",
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF32324D),
                                  ),
                                  softWrap: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 3.0),
                            child: Text(
                              "\$",
                              style: TextStyle(
                                fontSize: 8,
                                fontFamily: "Mulish-Regular",
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFFB080),
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            priceRecommended.toStringAsFixed(2),
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: "Mulish-Regular",
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFF7B2C),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CartCounter(
                  onAdd: (newQuantity) {
                    OrderModel orderModel = OrderModel(
                      image: imageRecommended,
                      name: nameRecommended,
                      price: priceRecommended,
                      quantity: newQuantity,
                      comment: '',
                    );
                    orderProvider.addToOrder(orderModel);
                  },
                  onRemove: (newQuantity) {
                    OrderModel(
                      image: imageRecommended,
                      name: nameRecommended,
                      price: priceRecommended,
                      quantity: newQuantity,
                      comment: '',
                    );
                    orderProvider.updateQuantity(nameRecommended, newQuantity);
                  },
                  dishName: nameRecommended,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
