import 'package:flutter/material.dart';

import '../../../../shared/constants.dart';
import '../common/contact_us.dart';
import '../common/global_widgets.dart';

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
                  ),
                ),
                spacerW(15),
                Expanded(
                  child: ReusableTextField(
                    controller: lastNameController,
                    hintText: "Last Name",
                  ),
                ),
              ],
            ),
            spacerH(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ReusableTextField(
                    controller: emailController,
                    hintText: "Email",
                  ),
                ),
                spacerW(15),
                Expanded(
                  child: ReusableTextField(
                    controller: phoneNumberController,
                    hintText: "Phone Number",
                    isRequired: false,
                  ),
                ),
              ],
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
