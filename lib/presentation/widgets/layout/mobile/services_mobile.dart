import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:mysteriouscoder/presentation/providers/website_info_provider.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/constants.dart';
import '../../card/service_card.dart';

class ServicesMobile extends StatefulWidget {
  final double w;
  final double h;

  const ServicesMobile({super.key, this.h = 350, required this.w});

  @override
  State<ServicesMobile> createState() => _ServicesMobileState();
}

class _ServicesMobileState extends State<ServicesMobile> {
  int _currentIndex = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var servicesList =
        Provider.of<WebsiteInfoProvider>(context).getServicesList;

    return CarouselSlider.builder(
        itemCount: servicesList.length,
        itemBuilder: (BuildContext context, int itemIndex, int i) {
          return ServiceCard(
            service: servicesList[itemIndex],
            isSelected: itemIndex == _currentIndex,
          );
        },
        options: CarouselOptions(
          viewportFraction: widget.w < Constants.maxPhoneWidth ? 0.8 : 0.6,
          height: widget.h,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          enlargeCenterPage: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          enableInfiniteScroll: false,
          onPageChanged: (index, reason) {
            if (mounted) {
              setState(() {
                _currentIndex = index.clamp(0, servicesList.length - 1);
              });
            }
          },
        ));
  }
}
