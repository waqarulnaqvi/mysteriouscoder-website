
import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:mysteriouscoder/presentation/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants.dart';
import '../../../pages/responsive_layout.dart';
import '../../color_change_button.dart';
import '../../common_main_heading.dart';
import '../../common_sub_heading.dart';
import '../../global_widgets.dart';
import '../mobile/contact_us_mobile.dart';
import '../web/contact_us_web.dart';

class ContactUs extends StatefulWidget {
  final double w;
  final double h;

  const ContactUs({super.key, required this.w, required this.h});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  void _sendEmail() async {
    final String firstname = firstNameController.text.trim();
    final String mobileNum = phoneNumberController.text.trim();
    final String email = emailController.text.trim();
    final String message = messageController.text.trim();
    final String lastName = lastNameController.text.trim();
    var countryCode =
        Provider.of<ThemeProvider>(context, listen: false).countryCode;

    if (firstname.isNotEmpty && message.isNotEmpty) {
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'mysteriouscoderofficial@gmail.com',
        query:
            'subject=Contact from $firstname $lastName&body=Name: $firstname $lastName ${email.isNotEmpty ? "\nEmail : $email" : ""} ${mobileNum.isNotEmpty ? "\nPhone Number: $countryCode $mobileNum" : ""} \nMessage: ${messageController.text}',
      );

      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        IconSnackBar.show(context,
            label: "Could not launch email app!",
            snackBarType: SnackBarType.fail,
        labelTextStyle: TextStyle(color: Colors.white));
      }
    } else {
      IconSnackBar.show(context,
          label: "One or more required fields are empty!",
          snackBarType: SnackBarType.alert,
          labelTextStyle: TextStyle(color: Colors.white));
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        spacerH(),
        CommonMainHeading(title: "Contact Us"),
        spacerH(),
        CommonSubHeading(
          title: Constants.contactUsDescription,
          w: widget.w,
        ),
        spacerH(),
        ResponsiveLayout(
          mobile: ContactUsMobile(
              firstNameController: firstNameController,
              lastNameController: lastNameController,
              emailController: emailController,
              phoneNumberController: phoneNumberController,
              messageController: messageController),
          tablet: ContactUsWeb(
              firstNameController: firstNameController,
              lastNameController: lastNameController,
              emailController: emailController,
              phoneNumberController: phoneNumberController,
              messageController: messageController),
          desktop: ContactUsWeb(
              firstNameController: firstNameController,
              lastNameController: lastNameController,
              emailController: emailController,
              phoneNumberController: phoneNumberController,
              messageController: messageController),
        ),
        spacerH(),
        ResponsiveLayout(
            mobile: ColorChangeButton(
              onTap: _sendEmail,
              text: "Send Mail",
              w: 160,
              h: 45,
            ),
            tablet: ColorChangeButton(
              onTap: _sendEmail,
              text: "Send Mail",
              w: 170,
              h: 45,
            ),
            desktop: ColorChangeButton(
              onTap: _sendEmail,
              text: "Send Mail",
              w: 180,
              h: 45,
            )),
        spacerH(40),
      ],
    );
  }
}

