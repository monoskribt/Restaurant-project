import 'package:flutter/material.dart';

class OrderStatusFirst extends StatefulWidget {

  final double orderTime;

  const OrderStatusFirst({
    Key? key,
    required this.orderTime,
  }) : super(key: key);



  @override
  _OrderStatusFirstState createState() => _OrderStatusFirstState();
}

class _OrderStatusFirstState extends State<OrderStatusFirst> {
  String imageAsset = "assets/images/order_status_1.png";


  final double orderTimeEnd = 12;

  @override
  void initState() {
    super.initState();
    updateImage();
  }

  void updateImage() {
    if (widget.orderTime >= orderTimeEnd && widget.orderTime < orderTimeEnd + 1) {
      setState(() {
        imageAsset = "assets/images/order_status_2.png";
      });
    } else if (widget.orderTime >= orderTimeEnd + 1) {
      setState(() {
        imageAsset = "assets/images/order_status_3.png";
      });
    } else {
      setState(() {
        imageAsset = "assets/images/order_status_1.png";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 357,
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
      child: Column(
        children: [
          const SizedBox(height: 40),
          if (widget.orderTime >= orderTimeEnd && widget.orderTime < orderTimeEnd + 1)
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your order is ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Mulish-Regular",
                        color: Color(0xFF8E8EA9),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "almost ready",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        fontFamily: "Mulish-Regular",
                        color: Color(0xFFFFB01D),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                SizedBox(
                  child: Image.asset(
                    imageAsset,
                    width: 327,
                    height: 277,
                  ),
                ),
              ],
            )
          else if (widget.orderTime >= orderTimeEnd + 1)
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your dishes are ready.",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Mulish-Regular",
                        color: Color(0xFF8E8EA9),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Enjoy!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        fontFamily: "Mulish-Regular",
                        color: Color(0xFFFFB01D),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                SizedBox(
                  child: Image.asset(
                    imageAsset,
                    width: 327,
                    height: 277,
                  ),
                ),

              ],
            )
          else
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your order will be ready in ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Mulish-Regular",
                        color: Color(0xFF8E8EA9),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${widget.orderTime.toInt()} minutes",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        fontFamily: "Mulish-Regular",
                        color: Color(0xFFFFB01D),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                SizedBox(
                  child: Image.asset(
                    imageAsset,
                    width: 327,
                    height: 277,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
