import 'package:flutter/material.dart';

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

  void updateCurrentLength() {
    setState(() {
      length = _textEditingController.text.length;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        onChanged: (_) => updateCurrentLength(),
        decoration: InputDecoration(
          hintText: 'Ex: Don’t add onion',
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
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
            fontSize: 14,
            color: Color(0xFFC0C0CF),
            fontWeight: FontWeight.w400,
          )
        ),
      ),
    );
  }
}
