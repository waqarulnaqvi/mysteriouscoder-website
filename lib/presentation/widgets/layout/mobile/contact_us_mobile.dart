

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mysteriouscoder/presentation/widgets/text_field/reusable_text_field.dart';

import '../../global_widgets.dart';

class ContactUsMobile extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController messageController;

  const ContactUsMobile(
      {super.key,
      required this.firstNameController,
      required this.lastNameController,
      required this.emailController,
      required this.phoneNumberController,
      required this.messageController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ReusableTextField(
              controller: firstNameController,
              hintText: "First Name",
              prefixIcon: Icons.person,
            ),
            spacerH(15),
            ReusableTextField(
              controller: lastNameController,
              hintText: "Last Name",
              isRequired: false,
              prefixIcon: Icons.person,
            ),
            spacerH(15),
            ReusableTextField(
              controller: emailController,
              hintText: "Email",
              keyboardType: TextInputType.emailAddress,
              isRequired: false,
              prefixIcon: Icons.email,
            ),
            spacerH(15),
            ReusablePhoneTextField(
              controller: phoneNumberController,
              hintText: "Phone Number",
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              isRequired: false,
            ),
            spacerH(5),
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
