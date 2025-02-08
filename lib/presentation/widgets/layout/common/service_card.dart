import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mysteriouscoder/domain/data/services_utils.dart';
import '../../../../shared/styles.dart';
import '../../../pages/responsive_layout.dart';
import 'global_widgets.dart';

class ServiceCard extends StatefulWidget {
  final ServicesUtils service;

  const ServiceCard({super.key, required this.service});

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
        onHover: (hovering) {
          if (hovering) {
            setState(() => isHover = true);
          } else {
            setState(() => isHover = false);
          }
        },
        child: Container(
          width: ResponsiveLayout.isTablet(context) ? 500 : 350,
          height: 350,
          // height: ResponsiveLayout.isMobile(context) ? 450 : 400,
          // height: AppDimensions.normalize(100),
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          decoration: BoxDecoration(
            // gradient: isHover ? pinkpurple : grayBack,
            gradient: isHover
                ? pinkpurple
                : LinearGradient(colors: [
                    Theme.of(context).colorScheme.surface,
                    Theme.of(context).colorScheme.surface
                  ]),
            borderRadius: BorderRadius.circular(15),
            boxShadow: isHover ? [primaryColorShadow] : [blackColorShadow],
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
                  style: TextStyle(
                    color: isHover
                        ? whiteColor
                        : Theme.of(context).colorScheme.onSurface,
                  )),
              spacerH(),
              Text(
                widget.service.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isHover
                      ? whiteColor.withOpacity(0.8)
                      : Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w200,
                  fontSize: 13,
                ),
              ),
              spacerH(),
              if (ResponsiveLayout.isDesktop(context))
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.service.tool
                        .map((e) => Row(
                              children: [
                                const Text('🛠   '),
                                Text(e,
                                    style: TextStyle(
                                      color: isHover
                                          ? whiteColor
                                          : Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                    )),
                              ],
                            ))
                        .toList()),
              if (ResponsiveLayout.isMobile(context) ||
                  ResponsiveLayout.isTablet(context))
                Expanded(
                  child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      children: widget.service.tool
                          .map((e) => Row(
                                children: [
                                  const Text('🛠   '),
                                  Text(e,
                                      style: TextStyle(
                                        color: isHover
                                            ? whiteColor
                                            : Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                      )),
                                ],
                              ))
                          .toList()),
                )
            ],
          ),
        ));
  }
}
