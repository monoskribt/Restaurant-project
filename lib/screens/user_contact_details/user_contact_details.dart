import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/features/cubit/cubit_for_restaurant/restaurant_cubit.dart';
import 'package:sushi_shop_project/features/provider/email_controller_provider.dart';
import 'package:sushi_shop_project/features/provider/order_provider.dart';
import 'package:sushi_shop_project/features/provider/order_total_provider.dart';
import 'package:sushi_shop_project/features/provider/user_contact_details_provider.dart';
import 'package:sushi_shop_project/models/user_contact_details.dart';
import 'package:sushi_shop_project/screens/drawer_widget/main_drawer.dart';
import 'package:sushi_shop_project/screens/user_contact_details/tools/input_formatter.dart';
import 'package:sushi_shop_project/screens/user_contact_details/tools/validator.dart';
import 'package:sushi_shop_project/screens/user_contact_details/snackbar/snackbar_contact.dart';
import 'package:sushi_shop_project/services/smtp/send_email.dart';

class UserContact extends StatefulWidget {
  const UserContact({Key? key}) : super(key: key);

  @override
  State<UserContact> createState() => _UserContactState();
}

class _UserContactState extends State<UserContact> {
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
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    final orderTotalProvider =
        Provider.of<OrderTotalProvider>(context, listen: false);
    final userContactDetailsProvider =
        Provider.of<UserContactDetailsProvider>(context);
    final emailControllerProvider =
        Provider.of<EmailControllerProvider>(context);
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
                        Column(
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
                            const SizedBox(height: 30),
                            buildInputField(
                              controller: _userNameController,
                              icon: Icons.person,
                              hintText: "Name",
                              inputType: TextInputType.name,
                              provider: userContactDetailsProvider,
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(height: 30),
                            buildInputField(
                              controller: _userNumberController,
                              icon: Icons.phone_android_outlined,
                              inputFormatters: [PhoneNumberFormatter()],
                              hintText: "Number",
                              inputType: TextInputType.phone,
                              provider: userContactDetailsProvider,
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(height: 30),
                            buildInputField(
                              controller: emailController,
                              icon: Icons.email_rounded,
                              hintText: "Email",
                              inputType: TextInputType.emailAddress,
                              emailControllerProvider: emailControllerProvider,
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(height: 30),
                            buildInputField(
                              controller: _userAddressController,
                              icon: Icons.home,
                              hintText: "Address",
                              inputType: TextInputType.multiline,
                              provider: userContactDetailsProvider,
                              textInputAction: TextInputAction.done,
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            bottomNavigationBar: GestureDetector(
              onTap: () {
                final totalWithTips = orderTotalProvider.totalWithTips;
                if (userContactDetailsProvider.isContactInfoFinish &&
                    emailControllerProvider.email.isNotEmpty &&
                    emailControllerProvider
                        .validateEmail(emailControllerProvider.email)) {
                  final name = _userNameController.text;
                  final number = _userNumberController.text;
                  final address = _userAddressController.text;

                  final nameValidationError = Validator.validateFirstName(name);
                  final numberValidationError =
                      Validator.validatePhoneNumber(number);
                  final addressValidationError =
                      Validator.validateAddress(address);

                  if (nameValidationError == null &&
                      numberValidationError == null &&
                      addressValidationError == null) {
                    UserContactDetails newContact = UserContactDetails();
                    newContact.name = name;
                    newContact.number = number;
                    newContact.address = address;

                    userContactDetailsProvider.addContact(newContact);
                    sendOrderEmail(totalWithTips);
                    orderTotalProvider.clear();
                    orderProvider.orderMap.clear();
                    userContactDetailsProvider.clear();
                    emailControllerProvider.setEmail('');

                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/payment_confirmation', (route) => false);
                  }
                } else if (!emailControllerProvider
                    .validateEmail(emailControllerProvider.email)) {
                  SnackBarContact.showSnackBar(
                      context, "Enter a correct email");
                } else {
                  SnackBarContact.showSnackBar(
                      context, "All fields must be completed");
                }
              },
              child: Padding(
                padding: EdgeInsets.only(bottom: 0.02 * screenHeight),
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
                    arrowBackInfo(context);
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
    required String hintText,
    required TextInputType inputType,
    UserContactDetailsProvider? provider,
    EmailControllerProvider? emailControllerProvider,
    required TextInputAction textInputAction,
  }) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        border: Border.all(
          color: (hintText.toLowerCase().contains("name") && !isNameValid) ||
                  (hintText.toLowerCase().contains("number") &&
                      !isNumberValid) ||
                  (hintText.toLowerCase().contains("email") && !isEmailValid) ||
                  (hintText.toLowerCase().contains("address") &&
                      !isAddressValid)
              ? Colors.red
              : const Color(0xFFEAEAEF),
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
                  provider?.updateUserContactName(value);
                  setState(() {
                    isNameValid = Validator.validateFirstName(value) == null;
                  });
                } else if (hintText.toLowerCase().contains("number")) {
                  provider?.updateUserContactNumber(value);
                  setState(() {
                    isNumberValid =
                        Validator.validatePhoneNumber(value) == null;
                  });
                } else if (hintText.toLowerCase().contains("email")) {
                  emailControllerProvider?.setEmail(value);
                  setState(() {
                    isEmailValid = Validator.validateEmail(value) == null;
                  });
                } else if (hintText.toLowerCase().contains("address")) {
                  provider?.updateUserContactAddress(value);
                  setState(() {
                    isAddressValid = Validator.validateAddress(value) == null;
                  });
                }
              },
              keyboardType: inputType,
              inputFormatters: inputFormatters,
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
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  counterStyle: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFFC0C0CF),
                    fontFamily: "Mulish-Regular",
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: Icon(
                    icon,
                    color: Colors.grey,
                  )),
              textInputAction: textInputAction,
              onSubmitted: (value) {
                if (hintText.toLowerCase().contains("name")) {
                  final validationError = Validator.validateFirstName(value);
                  if (value.isEmpty) {
                    SnackBarContact.showSnackBar(context, validationError!);
                  }
                } else if (hintText.toLowerCase().contains("number")) {
                  final validationError = Validator.validatePhoneNumber(value);
                  if (value.isEmpty) {
                    SnackBarContact.showSnackBar(context, validationError!);
                  }
                } else if (hintText.toLowerCase().contains("email")) {
                  final validationError = Validator.validateEmail(value);
                  if (value.isEmpty) {
                    SnackBarContact.showSnackBar(context, validationError!);
                  }
                } else if (hintText.toLowerCase().contains("address")) {
                  final validationError = Validator.validateAddress(value);
                  if (value.isEmpty) {
                    SnackBarContact.showSnackBar(context, validationError!);
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void arrowBackInfo(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            title: Icon(CupertinoIcons.exclamationmark_circle,
                color: Colors.red, size: 0.05 * screenHeight),
            content: Text(
              "Are you sure you want to abort your data entry? "
              "If you agree, the data already entered will not be saved.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 0.02 * screenHeight,
                fontFamily: "Mulish-Regular",
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 0.02 * screenHeight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        TextButton(
                          child: Text(
                            'No',
                            style: TextStyle(
                              fontSize: 0.02 * screenHeight,
                              fontFamily: "Mulish-Regular",
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFFFF7B2C),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextButton(
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              fontSize: 0.02 * screenHeight,
                              fontFamily: "Mulish-Regular",
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFFFF7B2C),
                            ),
                          ),
                          onPressed: () {
                            final userContactDetailsProvider =
                            Provider.of<UserContactDetailsProvider>(context, listen: false);
                            final emailControllerProvider =
                            Provider.of<EmailControllerProvider>(context, listen: false);
                            userContactDetailsProvider.clear();
                            emailControllerProvider.setEmail('');
                            Navigator.of(context)
                                .pushNamedAndRemoveUntil('/order_status', (route) => false);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }

  void sendOrderEmail(double totalWithTips) {
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    final orderTotalProvider =
        Provider.of<OrderTotalProvider>(context, listen: false);
    final userContactProvider =
        Provider.of<UserContactDetailsProvider>(context, listen: false);
    String emailController =
        Provider.of<EmailControllerProvider>(context, listen: false).email;

    final orderMap = orderProvider.orderMap;

    final contactDetails = userContactProvider.userContactDetails;

    String emailMessage = 'Ordered Dishes:\n';
    for (var order in orderMap.values) {
      emailMessage += 'Dish: ${order.name}\n'
          'Quantity: ${order.quantity}\n'
          'Price: \$${order.price.toStringAsFixed(2)}\n'
          'Comment: ${order.comment}\n'
          '\n';
    }

    String contactInfo = 'Contact Details:\n'
        'Name: ${contactDetails.name}\n'
        'Number: ${contactDetails.number}\n'
        'Address: ${contactDetails.address}\n\n';

    emailMessage = contactInfo + emailMessage;

    EmailService.sendEmail(
      recipientEmail: emailController,
      mailMessage: emailMessage,
      dishTips: orderTotalProvider.tips,
      dishPrice: totalWithTips,
    );
  }
}
