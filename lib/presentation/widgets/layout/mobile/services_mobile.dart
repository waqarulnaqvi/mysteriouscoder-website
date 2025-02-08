import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../domain/data/services_utils.dart';
import '../common/service_card.dart';

class ServicesMobile extends StatelessWidget {
  const ServicesMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: servicesUtils.length,
      itemBuilder: (BuildContext context,int itemIndex, int i){
        return ServiceCard(service: servicesUtils[itemIndex]);
      },
      options: CarouselOptions(
        viewportFraction: 0.6,
        height: 350,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        enlargeCenterPage: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        enableInfiniteScroll: false,
      ),
    );
  }
}
