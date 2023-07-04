import 'package:flutter/material.dart';
import 'package:sushi_shop_project/screeen_show_bottom_sheet_2/function/product_type_function.dart';
import 'function/categories_function.dart';

class Filters extends StatelessWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFFCFCFC),
              Color(0xFFF7F7F7),
              Color(0xFFF7F7F7),
              Color(0xFFF7F7F7),
              Color(0xFFFCFCFC),
            ],
            stops: [0, 0.1004, 0.5156, 0.8958, 1],
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Filters", style: TextStyle(
                    fontFamily: "Mulish-Regular",
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF32324D),
                  ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            const Padding(
              padding: EdgeInsets.only( left: 24.0),
              child: Row(
                children: [
                  Text("Select Categories", style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    fontFamily: "Mulish-Regular",
                    color: Color(0xFF666687),
                  ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CategoriesBody(),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Padding(
              padding: EdgeInsets.only( left: 24.0),
              child: Row(
                children: [
                  Text("Select Product Type", style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    fontFamily: "Mulish-Regular",
                    color: Color(0xFF666687),
                  ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: ProductTypeBody(),
                  ),
                ],
              ),
            ),

          ],
        )

      ),
    );
  }
}
