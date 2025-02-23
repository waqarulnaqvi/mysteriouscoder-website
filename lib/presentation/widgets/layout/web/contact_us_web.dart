

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants/constants.dart';
import '../../global_widgets.dart';
import '../../text_field/reusable_text_field.dart';

class ContactUsWeb extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController messageController;

  const ContactUsWeb(
      {super.key,
      required this.firstNameController,
      required this.lastNameController,
      required this.emailController,
      required this.phoneNumberController,
      required this.messageController});

  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width:w < Constants.maxTabletWidth
      ? w * 0.9
        : w * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ReusableTextField(
                    controller: firstNameController,
                    hintText: "First Name",
                    prefixIcon: Icons.person,
                  ),
                ),
                spacerW(15),
                Expanded(
                  child: ReusableTextField(
                    controller: lastNameController,
                    hintText: "Last Name",
                    isRequired: false,
                    prefixIcon: Icons.person,
                  ),
                ),
              ],
            ),
            spacerH(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ReusableTextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: "Email",
                    isRequired: false,
                    prefixIcon: Icons.email,
                  ),
                ),
                spacerW(15),
                Expanded(
                  child: ReusablePhoneTextField(
                    controller: phoneNumberController,
                    hintText: "Phone Number",
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    isRequired: false,
                  ),
                ),
              ],
            ),
            spacerH(10),

            ReusableTextField(
              controller: messageController,
              hintText: "Message",
              maxLines: 8,
            ),
            spacerH(10),
          ],
        ),
      ),
    );
  }
}
