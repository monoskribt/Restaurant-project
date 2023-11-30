import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Foodbox/features/cubit/cubit_for_restaurant/restaurant_cubit.dart';
import 'package:Foodbox/features/provider/email_controller_provider.dart';
import 'package:Foodbox/features/provider/order_provider.dart';
import 'package:Foodbox/features/provider/order_total_provider.dart';
import 'package:Foodbox/features/provider/user_contact_details_provider.dart';
import 'package:Foodbox/models/user_contact_details.dart';
import 'package:Foodbox/screens/drawer_widget/main_drawer.dart';
import 'package:Foodbox/screens/user_contact_details/tools/input_formatter.dart';
import 'package:Foodbox/screens/user_contact_details/user_contact_details_component/send_order_email.dart';
import 'package:provider/provider.dart';

import 'snackbar/snackbar_contact.dart';


class UserContact extends StatefulWidget {
  const UserContact({Key? key}) : super(key: key);

  @override
  State<UserContact> createState() => _UserContactState();
}

class _UserContactState extends State<UserContact> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userNumberController = TextEditingController();
  final TextEditingController _userAddressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    final emailProvider =
        Provider.of<EmailControllerProvider>(context, listen: false);
    emailController.text = emailProvider.email;
    super.initState();
  }

  bool isNameValid = true;
  bool isNumberValid = true;
  bool isAddressValid = true;
  bool isEmailValid = true;

  void clear() {
    _userNameController.clear();
    _userNumberController.clear();
    _userAddressController.clear();
    emailController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    _userNameController.dispose();
    _userNumberController.dispose();
    _userAddressController.dispose();
  }



  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final orderTotalProvider =
        Provider.of<OrderTotalProvider>(context, listen: false);
    final userContactDetailsProvider =
        Provider.of<UserContactDetailsProvider>(context);
    final emailControllerProvider =
        Provider.of<EmailControllerProvider>(context);
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    return LayoutBuilder(
      builder: (builder, constraints) {
        double buttonWidth = constraints.maxWidth;
        double buttonHeight = constraints.maxHeight;
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            endDrawer: const MainDrawer(),
            body: Container(
              height: double.infinity,
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
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 0.03 * screenHeight,
                      left: 0.06 * screenWidth,
                      right: 0.06 * screenWidth,
                      bottom: 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildTopBar(context),
                        SizedBox(height: 0.05 * screenHeight),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 230,
                                    child: Text(
                                      "Enter your contact",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Mulish-Regular",
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF32324D),
                                      ),
                                      maxLines: 2,
                                      softWrap: true,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 35),
                              TextFormField(
                                  controller: _userNameController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    labelText: "Name",
                                    labelStyle: TextStyle(
                                      fontSize: 0.017 * screenHeight,
                                      fontFamily: "Mulish-Regular",
                                      fontWeight: FontWeight.w800,
                                      color: Colors.grey,
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      color: Colors.grey,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                            color: Colors.grey, width: 2.0)),
                                  ),
                                  cursorColor: Colors.grey,
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter name";
                                    }
                                    if (value.length <= 3) {
                                      return "Enter a valid name";
                                    }
                                  }),
                              const SizedBox(height: 25),
                              TextFormField(
                                  controller: _userNumberController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      labelText: "Number",
                                      labelStyle: TextStyle(
                                        fontSize: 0.017 * screenHeight,
                                        fontFamily: "Mulish-Regular",
                                        fontWeight: FontWeight.w800,
                                        color: Colors.grey,
                                      ),
                                      prefixIcon: const Icon(
                                        Icons.phone,
                                        color: Colors.grey,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              color: Colors.grey, width: 2.0))),
                                  cursorColor: Colors.grey,
                                  inputFormatters: [PhoneNumberFormatter()],
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter number";
                                    }
                                    if (value.length <= 7) {
                                      return "Enter a valid number";
                                    }
                                  }),
                              const SizedBox(height: 25),
                              TextFormField(
                                controller: _userAddressController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    labelText: "Address",
                                    labelStyle: TextStyle(
                                      fontSize: 0.017 * screenHeight,
                                      fontFamily: "Mulish-Regular",
                                      fontWeight: FontWeight.w800,
                                      color: Colors.grey,
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.home,
                                      color: Colors.grey,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                            color: Colors.grey, width: 2.0))),
                                cursorColor: Colors.grey,
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter address";
                                  }
                                },
                              ),
                              const SizedBox(height: 25),
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    labelText: "Email",
                                    labelStyle: TextStyle(
                                      fontSize: 0.017 * screenHeight,
                                      fontFamily: "Mulish-Regular",
                                      fontWeight: FontWeight.w800,
                                      color: Colors.grey,
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.email,
                                      color: Colors.grey,
                                    ),
                                    helperText: "Optional",
                                    helperStyle: TextStyle(
                                      fontSize: 0.017 * screenHeight,
                                      fontFamily: "Mulish-Regular",
                                      fontWeight: FontWeight.w800,
                                      color: Colors.grey,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                            color: Colors.grey, width: 2.0))),
                                cursorColor: Colors.grey,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.done,
                                validator: (value) {
                                  if(value != null && value.isNotEmpty) {
                                    if(!emailControllerProvider.validateEmail(value)) {
                                      return "Enter valid email";
                                    }
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Container(
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFDCDCE4),
                    offset: Offset(0, -10),
                    blurRadius: 20,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x0C1A4B05),
                    offset: Offset(0, 0),
                    blurRadius: 5,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  final totalWithTips = orderTotalProvider.totalWithTips;
                  if (formKey.currentState!.validate()) {
                    UserContactDetails newContact = UserContactDetails();
                    newContact.name = _userNameController.text;
                    newContact.number = _userNumberController.text;
                    newContact.address = _userAddressController.text;

                    userContactDetailsProvider.addContact(newContact);

                    SendOrderEmail.sendOrderEmail(totalWithTips, context, emailController.text);
                    Navigator.of(context).pushNamedAndRemoveUntil('/payment_confirmation', (route) => false);
                    clear();
                    orderTotalProvider.clear();
                    orderProvider.orderMap.clear();
                    userContactDetailsProvider.clear();
                    emailControllerProvider.setEmail('');
                  } else {
                    SnackBarContact.showSnackBar(context, "All fields must be completed");
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: buttonWidth / 1.3,
                      height: buttonHeight / 14,
                      decoration: BoxDecoration(
                        color: const Color(0xFF615793),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Text(
                          "Complete order",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Mulish-Regular",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildTopBar(BuildContext context) {
    final userContactDetailsProvider =
    Provider.of<UserContactDetailsProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x32324705),
                      offset: Offset(0, 4),
                      blurRadius: 20,
                      spreadRadius: -2,
                    ),
                    BoxShadow(
                      color: Color(0x0C1A4B0D),
                      offset: Offset(0, 0),
                      blurRadius: 2,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: IconButton(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  icon: const Icon(Icons.arrow_back, size: 22),
                  color: const Color(0xFF666687),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/order_status', (route) => false);
                    userContactDetailsProvider.clear();
                    clear();
                    // BackArrowInfo.arrowBackInfo(context);
                  },
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: BlocBuilder<RestaurantCubit, String>(
                        builder: (context, selectedRestaurant) {
                          return Text(
                            selectedRestaurant,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF8E8EA9),
                              fontFamily: "Mulish-Regular",
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      "Checkout",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF32324D),
                        fontFamily: "Mulish-Regular",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildInputField({
    required TextEditingController controller,
    IconData? icon,
    String? prefixIconAsset,
    List<TextInputFormatter>? inputFormatters,
    required String labelText,
    required TextInputType inputType,
    UserContactDetailsProvider? provider,
    EmailControllerProvider? emailControllerProvider,
    required TextInputAction textInputAction,
  }) {
    return Form(
      key: formKey,
      child: Row(
        children: [
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              labelText: labelText,
              prefixIcon: Icon(
                icon,
                color: Colors.grey,
              ),
            ),
            textInputAction: textInputAction,
            inputFormatters: inputFormatters,
            keyboardType: inputType,
            validator: (value) {
              if (labelText.toLowerCase().contains("name")) {
                provider?.updateUserContactName(value!);
                if (value!.isEmpty) {
                  return "Enter name";
                }
                if (value.length! <= 3) {
                  return "Enter a valid name";
                }
              } else if (labelText.toLowerCase().contains("number")) {
                provider?.updateUserContactNumber(value!);
                if (value!.isEmpty) {
                  return "Enter number";
                }
                if (value.length! <= 7) {
                  return "Enter a valid number";
                }
              } else if (labelText.toLowerCase().contains("email")) {
                emailControllerProvider?.setEmail(value!);
                if (value!.isEmpty) {
                  return "Enter email";
                }
                if (!emailControllerProvider!.validateEmail(value)) {
                  return "Enter valid email";
                }
              } else if (labelText.toLowerCase().contains("address")) {
                provider?.updateUserContactAddress(value!);
                if (value!.isEmpty) {
                  return "Enter address";
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
