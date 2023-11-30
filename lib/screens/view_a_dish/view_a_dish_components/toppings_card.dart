import 'package:flutter/material.dart';
import 'package:Foodbox/features/provider/toppings_provider.dart';
import 'package:provider/provider.dart';

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
  @override
  Widget build(BuildContext context) {
    final toppingsProvider = Provider.of<ToppingsProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () {
              if (toppingsProvider.quantity > 0) {
                _onToppingsTap(context, toppingsProvider);
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              color: Colors.white,
              child: Row(
                children: [
                  _buildToppingsIcon(toppingsProvider),
                  const SizedBox(width: 8),
                  Text(
                    widget.nameToppings,
                    style: const TextStyle(
                      fontFamily: "Mulish-Regular",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF666687),
                    ),
                  ),
                  const Spacer(),
                  _buildToppingsPrice(),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToppingsIcon(ToppingsProvider provider) {
    return Container(
      padding: const EdgeInsets.all(2.5),
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: const Color(0xFFC0C0CF),
        ),
      ),
      child: provider.isSelected(widget.nameToppings)
          ? const Icon(
        Icons.check_outlined,
        size: 15,
        color: Color(0xFFFF7B2C),
      )
          : const SizedBox(),
    );
  }

  Widget _buildToppingsPrice() {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 3),
          child: Text(
            "\$",
            style: TextStyle(
              fontSize: 10,
              fontFamily: "Mulish-Regular",
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
            fontFamily: "Mulish-Regular",
            fontWeight: FontWeight.w700,
            color: Color(0xFFFF7B2C),
          ),
        ),
      ],
    );
  }

  void _onToppingsTap(BuildContext context, ToppingsProvider provider) {
    setState(() {
      final isSelected = provider.isSelected(widget.nameToppings);
      isSelected
          ? provider.removeToppings(widget.nameToppings)
          : provider.addToppings(widget.nameToppings, widget.priceToppings);
    });
  }
}
