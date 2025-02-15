import 'package:flutter/material.dart';

import '../common/contact_us.dart';
import '../common/global_widgets.dart';

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
            ),
            spacerH(15),
            ReusableTextField(
              controller: lastNameController,
              hintText: "Last Name",
            ),
            spacerH(15),
            ReusableTextField(
              controller: emailController,
              hintText: "Email",
            ),
            spacerH(15),
            ReusableTextField(
              controller: phoneNumberController,
              hintText: "Phone Number",
              isRequired: false,
            ),
            spacerH(15),
            ReusableTextField(
              controller: messageController,
              hintText: "Message",
              maxLines: 6,
            ),
            spacerH(15),
          ],
        ),
      ),
    );
  }
}
