import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/features/provider/user_contact_details_provider.dart';
import 'package:sushi_shop_project/models/user_contact_details.dart';

class AddContactDetails extends StatefulWidget {
  const AddContactDetails({Key? key}) : super(key: key);

  @override
  State<AddContactDetails> createState() => _AddContactDetailsState();
}

class _AddContactDetailsState extends State<AddContactDetails> {

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userNumberController = TextEditingController();
  final TextEditingController _userAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }


  Widget buildBody(BuildContext context) {
    final userContactProvider = Provider.of<UserContactDetailsProvider>(context);
    return SingleChildScrollView(
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Enter your contact",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Mulish-Regular",
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF32324D),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              buildInputField(
                controller: _userNameController,
                hintText: "Name",
                inputType: TextInputType.text,
                provider: userContactProvider,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              buildInputField(
                controller: _userNumberController,
                hintText: "Number",
                inputType: TextInputType.number,
                provider: userContactProvider,
                textInputAction: TextInputAction.next,

              ),
              const SizedBox(height: 16),
              buildInputField(
                controller: _userAddressController,
                hintText: "Address",
                inputType: TextInputType.multiline,
                provider: userContactProvider,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  if(userContactProvider.isContactInfoFinish) {
                    UserContactDetails newContact = UserContactDetails();
                    newContact.name = _userNameController.text;
                    newContact.number = _userNumberController.text;
                    newContact.address = _userAddressController.text;
                    userContactProvider.addContact(newContact);

                    _userNameController.clear();
                    _userNumberController.clear();
                    _userAddressController.clear();
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFF615793),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Text(
                      "Add contact",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Mulish-Regular",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputField({
    required TextEditingController controller,
    required String hintText,
    required TextInputType inputType,
    required UserContactDetailsProvider provider,
    required TextInputAction textInputAction,
}) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFFEAEAEF),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: TextField(
              onChanged: (value) {
                if (hintText.toLowerCase().contains("name")) {
                  provider.updateUserContactName(value);
                } else if (hintText.toLowerCase().contains("number")) {
                  provider.updateUserContactNumber(value);
                } else if (hintText.toLowerCase().contains("address")) {
                  provider.updateUserContactAddress(value);
                }
              },
              keyboardType: inputType,
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontSize: 14,
                  fontFamily: "Mulish-Regular",
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF8E8EA9),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                counterStyle: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFFC0C0CF),
                  fontFamily: "Mulish-Regular",
                  fontWeight: FontWeight.w400,
                ),
              ),
              textInputAction: textInputAction,
              onSubmitted: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
