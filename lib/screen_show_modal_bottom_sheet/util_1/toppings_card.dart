import 'package:flutter/material.dart';

class ToppingsCard extends StatefulWidget {
  final String nameToppings;
  final double priceToppings;

  const ToppingsCard({
    Key? key,
    required this.nameToppings,
    required this.priceToppings,
  }) : super(key: key);

  @override
  State<ToppingsCard> createState() => _ToppingsCardState();
}

class _ToppingsCardState extends State<ToppingsCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            color: Colors.white,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(2.5),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: const Color(0xFFC0C0CF),
                    ),
                  ),
                  child: isSelected
                      ? const Icon(
                          Icons.check_outlined,
                          size: 15,
                          color: Color(0xFFFF7B2C),
                        )
                      : const SizedBox(),
                ),
                const SizedBox(width: 8),
                Text(
                  widget.nameToppings,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF666687),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: Text(
                        "\$",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFB080),
                        ),
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      widget.priceToppings.toStringAsFixed(2),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFF7B2C),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
