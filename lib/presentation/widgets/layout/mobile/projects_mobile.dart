import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants.dart';
import '../../../providers/website_info_provider.dart';
import '../../project_card.dart';

class ProjectsMobile extends StatefulWidget {
  final double w;
  final double h;
  const ProjectsMobile({super.key,required this.h, required this.w});

  @override
  State<ProjectsMobile> createState() => _ProjectsMobileState();
}

class _ProjectsMobileState extends State<ProjectsMobile> {
  int _currentIndex = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var projectList= Provider.of<WebsiteInfoProvider>(context,listen: false).getProjectList;

    return CarouselSlider.builder(
      itemCount:  projectList.length,
      itemBuilder: (BuildContext context, int itemIndex,int i){
         return  ProjectCard(projectInfo: projectList[itemIndex],
           isSelected: itemIndex==_currentIndex,);
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
              _currentIndex = index.clamp(0,projectList.length-1);
            });
          }
        },
      ),
    );
  }
}
