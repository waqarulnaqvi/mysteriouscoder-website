import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mysteriouscoder/presentation/pages/responsive_layout.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/common_main_heading.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/global_widgets.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/mobile/contact_us_mobile.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/web/contact_us_web.dart';
import 'package:mysteriouscoder/shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../shared/provider/theme_provider.dart';
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

  void _sendEmail() async {
    final String firstname = firstNameController.text.trim();
    final String mobileNum = phoneNumberController.text.trim();
    final String email = emailController.text.trim();
    final String message = messageController.text.trim();
    final String lastName = lastNameController.text.trim();
    var countryCode =Provider.of<ThemeProvider>(context, listen: false).countryCode;

    if (firstname.isNotEmpty && message.isNotEmpty) {
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'mysteriouscoderofficial@gmail.com',
        query: 'subject=Contact from $firstname $lastName&body=Name: $firstname $lastName\n ${email
            .isNotEmpty ? "Email : $email" : ""}\n ${mobileNum.isNotEmpty
            ? "(Phone Number: $countryCode $mobileNum)"
            : ""} \nMessage: ${messageController.text}',
      );

      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        IconSnackBar.show(context, label: "Could not launch email app!",
            snackBarType: SnackBarType.fail);
      }
    }

    else {
      IconSnackBar.show(context, label: "One or more required fields are empty!",
          snackBarType: SnackBarType.alert);
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
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;

  const ReusableTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.isRequired = true, this.maxLines=1,
      this.keyboardType=TextInputType.text, this.inputFormatters, this.prefixIcon});

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
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon==null ? null : Icon(widget.prefixIcon) ,
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


class ReusablePhoneTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isRequired;
  final int maxLines;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool disableLengthCheck ;

  const ReusablePhoneTextField(
      {super.key,
        required this.controller,
        required this.hintText,
        this.isRequired = true, this.maxLines=1,
        this.keyboardType=TextInputType.text, this.inputFormatters, this.disableLengthCheck=false,});

  @override
  State<ReusablePhoneTextField> createState() => _ReusablePhoneTextFieldState();
}



class _ReusablePhoneTextFieldState extends State<ReusablePhoneTextField> {
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
    var countryCode =Provider.of<ThemeProvider>(context, listen: false);
    double alphaValue = (_isFocused || _isHovering) ? 1 : 0.5;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: IntlPhoneField(
        controller: widget.controller,
        disableLengthCheck: widget.disableLengthCheck, //by default it is false and if you want to disable the length check, you need to make it true
        focusNode: _focusNode,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
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
        initialCountryCode: 'IN',
        onChanged: (phone) {
          // widget.controller.text = phone.completeNumber;
          // widget.controller.selection = TextSelection.fromPosition(
          //   TextPosition(offset: widget.controller.text.length),
          // );
            },
        onCountryChanged: (country) {
           countryCode.countryCode = country.fullCountryCode;


        },
      ),
    );
  }
}