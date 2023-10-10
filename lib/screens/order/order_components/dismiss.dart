import 'package:flutter/material.dart';

class DismissBackground extends StatelessWidget {

  final MainAxisAlignment mainAxisAlignment;

  const DismissBackground({
    Key? key,
    required this.mainAxisAlignment
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFFFFB01D),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset("assets/images/icon_delete.png", width: 24, height: 24),
          )
        ],
      ),
    );
  }
}
