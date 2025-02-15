import 'package:flutter/material.dart';
import 'package:mysteriouscoder/presentation/pages/responsive_layout.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/common_main_heading.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/global_widgets.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/mobile/contact_us_mobile.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/web/contact_us_web.dart';
import 'package:mysteriouscoder/shared/constants.dart';

import '../../color_change_button.dart';
import 'common_sub_heading.dart';

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

  void sendMail() {
    print("First Name: ${firstNameController.text}");
    print("Last Name: ${lastNameController.text}");
    print("Email: ${emailController.text}");
    print("Phone Number: ${phoneNumberController.text}");
    print("Message: ${messageController.text}");
  }

  @override
  void initState() {
    super.initState();
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
              onTap: sendMail,
              text: "Send Mail",
              w: 160,
              h: 45,
            ),
            tablet: ColorChangeButton(
              onTap: sendMail,
              text: "Send Mail",
              w: 170,
              h: 45,
            ),
            desktop: ColorChangeButton(
              onTap: sendMail,
              text: "Send Mail",
              w: 180,
              h: 45,
            ))
      ],
    );
  }
}

class ReusableTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isRequired;
  final int maxLines;

  const ReusableTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.isRequired = true, this.maxLines=1});

  @override
  State<ReusableTextField> createState() => _ReusableTextFieldState();
}

class _ReusableTextFieldState extends State<ReusableTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isHovering = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }


  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double alphaValue = (_isFocused || _isHovering) ? 1 : 0.5;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: TextField(
        maxLines: widget.maxLines,
        controller: widget.controller,
        focusNode: _focusNode,
        decoration: InputDecoration(
          hintText: "${widget.hintText}${widget.isRequired ? "*" : ""}",
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onSurface, width: 1.5),
          ),
          fillColor: Theme.of(context)
              .colorScheme
              .surface
              .withValues(alpha: alphaValue),
          filled: true,
        ),
      ),
    );
  }
}
