import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../domain/data/services_utils.dart';
import '../common/service_card.dart';

class ServicesMobile extends StatefulWidget {
  final double h;
  const ServicesMobile({super.key, this.h =350});

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
    return CarouselSlider.builder(
        itemCount: servicesUtils.length,
        itemBuilder: (BuildContext context, int itemIndex, int i) {
          return ServiceCard(
            service: servicesUtils[itemIndex],
            isSelected: itemIndex == _currentIndex,
          );
        },
        options: CarouselOptions(
          viewportFraction: 0.65,
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
                _currentIndex = index.clamp(0, servicesUtils.length - 1);
              });
            }
          },
        ));
  }
}
