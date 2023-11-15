import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/features/provider/order_time_provider.dart';

class OrderStatusFirst extends StatefulWidget {
  const OrderStatusFirst({
    Key? key,
    required this.orderTime,
  }) : super(key: key);

  final double orderTime;

  @override
  State<OrderStatusFirst> createState() => _OrderStatusFirstState();
}

class _OrderStatusFirstState extends State<OrderStatusFirst> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final orderTimeProvider =
        Provider.of<OrderTimeProvider>(context, listen: false);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      orderTimeProvider.setOrderTime(widget.orderTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderTimeProvider>(
      builder: (context, orderTimeProvider, _) {
        return buildOrderStatusContainer(orderTimeProvider);
      },
    );
  }

  Widget buildOrderStatusContainer(OrderTimeProvider orderTimeProvider) {
    return Container(
      height: 430,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3232470A),
            offset: Offset(0, 4),
            blurRadius: 20,
            spreadRadius: -2,
          ),
          BoxShadow(
            color: Color(0x0C1A4B08),
            offset: Offset(0, 0),
            blurRadius: 1,
            spreadRadius: 0,
          ),
        ],
      ),
      child: buildOrderStatusContent(orderTimeProvider),
    );
  }

  Widget buildOrderStatusContent(OrderTimeProvider orderTimeProvider) {
    return Column(
      children: [
        const SizedBox(height: 40),
        if (widget.orderTime >= orderTimeProvider.orderTimeEnd &&
            widget.orderTime < orderTimeProvider.orderTimeEnd + 1)
          buildOrderAlmostReadyContent(orderTimeProvider)
        else if (widget.orderTime >= orderTimeProvider.orderTimeEnd + 1)
          buildOrderReadyContent(orderTimeProvider)
        else
          buildOrderPendingContent(orderTimeProvider),
      ],
    );
  }

  Widget buildOrderReadyContent(OrderTimeProvider orderTimeProvider) {
    return Column(
      children: [
        buildOrderStatusText(
            "Your order is accepted", FontWeight.w600, const Color(0xFF8E8EA9)),
        buildOrderStatusText(
            "We will contact you!", FontWeight.w800, const Color(0xFFFFB01D)),
        const SizedBox(height: 40),
        buildOrderImage(orderTimeProvider),
      ],
    );
  }

  Widget buildOrderAlmostReadyContent(OrderTimeProvider orderTimeProvider) {
    return Column(
      children: [
        buildOrderStatusText(
            "Your order is", FontWeight.w600, const Color(0xFF8E8EA9)),
        buildOrderStatusText(
            "almost ready", FontWeight.w800, const Color(0xFFFFB01D)),
        const SizedBox(height: 40),
        buildOrderImage(orderTimeProvider),
      ],
    );
  }

  Widget buildOrderPendingContent(OrderTimeProvider orderTimeProvider) {
    return Column(
      children: [
        buildOrderStatusText("Your order will be ready in", FontWeight.w600,
            const Color(0xFF8E8EA9)),
        buildOrderStatusText("${widget.orderTime.toInt()} minutes",
            FontWeight.w800, const Color(0xFFFFB01D)),
        const SizedBox(height: 40),
        buildOrderImage(orderTimeProvider),
      ],
    );
  }

  Widget buildOrderStatusText(String text, FontWeight fontWeight, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 18,
              fontWeight: fontWeight,
              fontFamily: "Mulish-Regular",
              color: color),
        )
      ],
    );
  }

  Widget buildOrderImage(OrderTimeProvider orderTimeProvider) {
    return SizedBox(
      child: Image.asset(
        orderTimeProvider.imageAsset,
        width: 327,
        height: 277,
      ),
    );
  }
}
