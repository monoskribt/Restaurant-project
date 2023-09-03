import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/view_a_dish_widget/tools/request_provider.dart';

class RequestInput extends StatefulWidget {
  const RequestInput({Key? key}) : super(key: key);

  @override
  State<RequestInput> createState() => _RequestInputState();
}

class _RequestInputState extends State<RequestInput> {
  final TextEditingController _textEditingController = TextEditingController();
  int length = 0;
  int maxLength = 250;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void updateCurrentLength(String text) {
    setState(() {
      length = text.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final requestProvider = Provider.of<RequestProvider>(context, listen: false);
    return Container(
      height: 82,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: const Color(0xFFEAEAEF),
        ),
      ),
      child: TextField(
        controller: _textEditingController,
        maxLength: maxLength,
        maxLines: null,
        onChanged: (text) {
          updateCurrentLength(text);
          requestProvider.updateRequest(text);
        },
        textInputAction: TextInputAction.next,
        onEditingComplete: () {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          hintText: 'Ex: Don’t add onion',
          hintStyle: const TextStyle(
            fontSize: 14,
            fontFamily: "Mulish-Regular",
            fontWeight: FontWeight.w600,
            color: Color(0xFF8E8EA9),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          counterText: '$length/$maxLength',
          counterStyle: const TextStyle(
            fontSize: 13,
            color: Color(0xFFC0C0CF),
            fontFamily: "Mulish-Regular",
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
