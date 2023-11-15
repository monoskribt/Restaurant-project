import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/features/provider/order_provider.dart';
import 'package:sushi_shop_project/models/order_model.dart';
import 'package:sushi_shop_project/screens/full_menu/helpers/view_a_dish_helper.dart';
import 'package:sushi_shop_project/screens/view_a_dish/snackbar/snackbar_cart_counter.dart';


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


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        ViewADishHelper.showViewADish(
          context,
          imageRecommended,
          nameRecommended,
          priceRecommended,
          "",
        );
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
                Image.asset(
                  imageRecommended,
                  width: 0.25 * screenWidth,
                  height: 0.25 * screenHeight,
                ),
                SizedBox(width: 0.02 * screenWidth),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 0.45 * screenWidth,
                            child: Text(
                              nameRecommended,
                              style: TextStyle(
                                fontSize: 0.02 * screenHeight,
                                fontFamily: "Mulish-Regular",
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF32324D),
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 0.02 * screenHeight),
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
                const Spacer(),
                SnackbarCartCounter(
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
