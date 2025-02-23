import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mysteriouscoder/presentation/models/services_utils.dart';
import 'package:mysteriouscoder/core/constants/constants.dart';
import '../../../core/styles.dart';
import '../../pages/responsive_layout.dart';
import '../global_widgets.dart';

class ServiceCard extends StatefulWidget {
  final ServicesUtils service;
  final double? h;
  final bool isSelected;

  const ServiceCard(
      {super.key, required this.service, this.isSelected = false, this.h});

  @override
  State<ServiceCard> createState() => _ServicesCardState();
}

class _ServicesCardState extends State<ServiceCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {},
        onHover: w > Constants.maxTabletWidth
            ? (hovering) {
                if (hovering) {
                  setState(() => isHover = true);
                } else {
                  setState(() => isHover = false);
                }
              }
            : null,
        child: Container(
          width: ResponsiveLayout.isTablet(context) ? 500 : 380,
          height: widget.h,
          // height: ResponsiveLayout.isMobile(context) ? 450 : 400,
          // height: AppDimensions.normalize(100),
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          decoration: BoxDecoration(
            // gradient: isHover ? themeGradient : grayBack,
            gradient:
                (w > Constants.maxTabletWidth ? isHover : widget.isSelected)
                    ? themeGradient
                    : LinearGradient(colors: [
                        Theme.of(context).colorScheme.surface,
                        Theme.of(context).colorScheme.surface
                      ]),
            borderRadius: BorderRadius.circular(15),
            boxShadow:
                (w > Constants.maxTabletWidth ? isHover : widget.isSelected)
                    ? [primaryColorShadow]
                    : [blackColorShadow],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                widget.service.icon,
                height: 60,
              ),
              spacerH(),
              Text(widget.service.name,
                  textAlign: TextAlign.center,
                  style: commonTextStyle(w, isHover)),
              spacerH(),
              Text(
                widget.service.description,
                textAlign: TextAlign.center,
                style: commonTextStyle(w, isHover,
                    fontWeight: FontWeight.w200,
                    fontSize: 13,
                    // color: whiteColor.withValues(alpha: 0.8)
                  ),
              ),
              spacerH(),
              // if (ResponsiveLayout.isDesktop(context))
              //   Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: widget.service.tool
              //           .map((e) => Row(
              //                 children: [
              //                   Text('🛠   ',
              //                       style: commonTextStyle(w, isHover)),
              //                   Text(e, style: commonTextStyle(w, isHover)),
              //                 ],
              //               ))
              //           .toList()),
              // if (ResponsiveLayout.isMobile(context) ||
              //     ResponsiveLayout.isTablet(context))
                Expanded(
                  child: ListView(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: widget.service.tool
                          .map((e) => Row(
                                children: [
                                  Flexible(child: Text('🛠   $e', style: commonTextStyle(w, isHover),
                                  textAlign: TextAlign.start,),),
                                ],
                              ))
                          .toList()),
                )
            ],
          ),
        ));
  }

  TextStyle commonTextStyle(double w, bool isHover,
      { double? fontSize, FontWeight? fontWeight}) {
    return TextStyle(
        color: (w > Constants.maxTabletWidth ? isHover : widget.isSelected)
            ?  Colors.white
            : Theme.of(context).colorScheme.onSurface,
        fontSize: fontSize,
        fontWeight: fontWeight);
  }
}
