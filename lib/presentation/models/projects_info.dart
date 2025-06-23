import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mysteriouscoder/core/constants/constants.dart';
import '../../core/constants/static_assets.dart';

class ProjectInfo {
  final String name;
  final String description;
  final String icon;
  final String mainImage;
  final List<AvailableOn> availableOn;
  final String? githubLink;
  final LinearGradient linearGradient;
  final List<PlatformUsed> platformUsed;
  final PrivacyPolicyData? privacyPolicyData;
  final String routeName;

  ProjectInfo({
    required this.routeName,
    required this.platformUsed,
    required this.name,
    required this.description,
    required this.icon,
    required this.mainImage,
    required this.linearGradient,
    required this.availableOn,
    this.githubLink,
    this.privacyPolicyData,
  });
}

List<ProjectInfo> projectInfoList = [
  ProjectInfo(
      routeName: Constants.brainBoosterRoute,
      name: Constants.brainBooster,
      description: Constants.brainBoosterDescription,
      icon: StaticAssets.brainBoosterIcon,
      mainImage: StaticAssets.brainBoosterMainImage,
      privacyPolicyData: PrivacyPolicyData(
        title: Constants.brainBooster,
        color: Color.fromARGB(255, 15, 97, 164),
        image: StaticAssets.brainBoosterIcon,
      ),
      platformUsed: [
        PlatformUsed(name: 'Flutter', icon: StaticAssets.flutterIcon),
        PlatformUsed(name: 'Firebase', icon: StaticAssets.firebaseIcon),
        PlatformUsed(name: 'Dart', icon: StaticAssets.dartIcon),
      ],
      linearGradient: linearGrad(0),
      availableOn: [
        AvailableOn(
            url: Constants.brainBoosterPlayStoreLink,
            icon: FontAwesomeIcons.googlePlay,
            type: IconType.iconData,
            name: 'Google Play'),
        AvailableOn(
            url: Constants.brainBoosterAmazonAppStoreLink,
            icon: FontAwesomeIcons.amazon,
            type: IconType.iconData,
            name: 'Amazon AppStore'),
        // AvailableOn(url: Constants.brainBoosterPlayStoreLink, icon: FontAwesomeIcons.store,type: IconType.iconData,name :'OPPO AppStore'),
      ]),
  ProjectInfo(
      routeName: Constants.budgetFlowRoute,
      name: Constants.budgetFlow,
      description: Constants.budgetFlowDescription,
      icon: StaticAssets.budgetFlowIcon,
      mainImage: StaticAssets.brainBoosterMainImage,
      privacyPolicyData: PrivacyPolicyData(
        title: Constants.budgetFlow,
        color: Color.fromRGBO(37, 146, 166, 1),
        image: StaticAssets.budgetFlowIcon,
      ),
      platformUsed: [
        PlatformUsed(name: 'Flutter', icon: StaticAssets.flutterIcon),
        PlatformUsed(name: 'Firebase', icon: StaticAssets.firebaseIcon),
        PlatformUsed(name: 'Dart', icon: StaticAssets.dartIcon),
      ],
      linearGradient: linearGrad(5),
      availableOn: [
        AvailableOn(
            url: Constants.budgetFlowUrl,
            icon: FontAwesomeIcons.googlePlay,
            type: IconType.iconData,
            name: 'Google Play'),
        // AvailableOn(
        //     url: Constants.brainBoosterAmazonAppStoreLink,
        //     icon: FontAwesomeIcons.amazon,
        //     type: IconType.iconData,
        //     name: 'Amazon AppStore'),
        // AvailableOn(url: Constants.brainBoosterPlayStoreLink, icon: FontAwesomeIcons.store,type: IconType.iconData,name :'OPPO AppStore'),
      ]),
  ProjectInfo(
      routeName: Constants.classicWingedBirdRoute,
      name: Constants.classicWingedBird,
      description: Constants.classicWingedBirdDescription,
      icon: StaticAssets.classicWingedBirdIcon,
      mainImage: StaticAssets.classicWingedBirdMainImage,
      privacyPolicyData: PrivacyPolicyData(
        color: Color.fromARGB(255, 15, 97, 164),
        title: Constants.classicWingedBird,
        image: StaticAssets.classicWingedBirdIcon,
      ),
      platformUsed: [
        PlatformUsed(
            name: 'Jetpack Compose', icon: StaticAssets.jetpackComposeIcon),
        PlatformUsed(name: 'Firebase', icon: StaticAssets.firebaseIcon),
        PlatformUsed(name: 'Kotlin', icon: StaticAssets.kotlinIcon),
      ],
      linearGradient: linearGrad(1),
      availableOn: [
        AvailableOn(
            url: Constants.classicWingedBirdPlayStoreLink,
            icon: FontAwesomeIcons.googlePlay,
            type: IconType.iconData,
            name: 'Google Play'),
        AvailableOn(
            url: Constants.classicWingedBirdAmazonAppStoreLink,
            icon: FontAwesomeIcons.amazon,
            type: IconType.iconData,
            name: 'Amazon AppStore'),
        // AvailableOn(url: Constants.classicWingedBirdPlayStoreLink, icon: FontAwesomeIcons.store,type: IconType.iconData,name :'OPPO AppStore'),
      ]),
  ProjectInfo(
      routeName: Constants.hindiShayariHubRoute,
      name: Constants.hindiShayariHub,
      description: Constants.hindiShayariHubDescription,
      icon: StaticAssets.hindiShayariHubIcon,
      mainImage: StaticAssets.hindiShayariHubMainImage,
      privacyPolicyData: PrivacyPolicyData(
        title: Constants.hindiShayariHub,
        color: Color.fromARGB(219, 183, 71, 203),
        image: StaticAssets.hindiShayariHubIcon,
      ),
      platformUsed: [
        PlatformUsed(
            name: 'Jetpack Compose', icon: StaticAssets.jetpackComposeIcon),
        PlatformUsed(name: 'Firebase', icon: StaticAssets.firebaseIcon),
        PlatformUsed(name: 'Kotlin', icon: StaticAssets.kotlinIcon),
      ],
      linearGradient: linearGrad(2),
      availableOn: [
        AvailableOn(
            url: Constants.hindiShayariHubPlayStoreLink,
            icon: FontAwesomeIcons.googlePlay,
            type: IconType.iconData,
            name: 'Google Play'),
        AvailableOn(
            url: Constants.hindiShayariHubAmazonAppStoreLink,
            icon: FontAwesomeIcons.amazon,
            type: IconType.iconData,
            name: 'Amazon AppStore'),
        // AvailableOn(url: Constants.hindiShayariHubPlayStoreLink, icon: FontAwesomeIcons.store,type: IconType.iconData,name :'OPPO AppStore'),
      ]),
  ProjectInfo(
      routeName: Constants.mazedarHindiJokesRoute,
      name: Constants.mazedarHindiJokes,
      description: Constants.mazedarHindiJokesDescription,
      icon: StaticAssets.mazedarHindiJokesIcon,
      mainImage: StaticAssets.mazedarHindiJokesMainImage,
      privacyPolicyData: PrivacyPolicyData(
        title: Constants.mazedarHindiJokes,
        image: StaticAssets.mazedarHindiJokesIcon,
        color: Color.fromARGB(255, 197, 130, 60),
      ),
      platformUsed: [
        PlatformUsed(
            name: 'Jetpack Compose', icon: StaticAssets.jetpackComposeIcon),
        PlatformUsed(name: 'Firebase', icon: StaticAssets.firebaseIcon),
        PlatformUsed(name: 'Kotlin', icon: StaticAssets.kotlinIcon),
      ],
      linearGradient: linearGrad(3),
      availableOn: [
        AvailableOn(
            url: Constants.mazedarHindiJokesPlayStoreLink,
            icon: FontAwesomeIcons.googlePlay,
            type: IconType.iconData,
            name: 'Google Play'),
        AvailableOn(
            url: Constants.mazedarHindiJokesAmazonAppStoreLink,
            icon: FontAwesomeIcons.amazon,
            type: IconType.iconData,
            name: 'Amazon AppStore'),
        // AvailableOn(url: Constants.mazedarHindiJokesPlayStoreLink, icon: FontAwesomeIcons.store, type: IconType.iconData,name :'OPPO AppStore'),
      ]),
  ProjectInfo(
      routeName: Constants.noteMasterRoute,
      name: Constants.noteMaster,
      description: Constants.noteMasterDescription,
      icon: StaticAssets.noteMasterIcon,
      mainImage: StaticAssets.noteMasterMainImage,
      privacyPolicyData: PrivacyPolicyData(
        color: Color.fromARGB(255, 197, 130, 60),
        title: Constants.noteMaster,
        image: StaticAssets.noteMasterIcon,
      ),
      platformUsed: [
        PlatformUsed(
            name: 'Jetpack Compose', icon: StaticAssets.jetpackComposeIcon),
        PlatformUsed(name: 'Firebase', icon: StaticAssets.firebaseIcon),
        PlatformUsed(name: 'Kotlin', icon: StaticAssets.kotlinIcon),
      ],
      linearGradient: linearGrad(4),
      availableOn: [
        AvailableOn(
            url: Constants.noteMasterPlayStoreLink,
            icon: FontAwesomeIcons.googlePlay,
            type: IconType.iconData,
            name: 'Google Play'),
        AvailableOn(
            url: Constants.noteMasterAmazonAppStoreLink,
            icon: FontAwesomeIcons.amazon,
            type: IconType.iconData,
            name: 'Amazon AppStore'),
        // AvailableOn(url: Constants.noteMasterPlayStoreLink, icon: FontAwesomeIcons.store ,type :IconType.iconData,name :'OPPO AppStore'),
      ])
];

enum IconType { iconData, custom }

class AvailableOn {
  final String url;
  final String name;
  final IconType type;
  final dynamic icon;

  AvailableOn({
    required this.name,
    required this.type,
    required this.url,
    required this.icon,
  });
}

class PrivacyPolicyData {
  final String? title;
  final String? description;
  final String image;
  final Color? color;

  PrivacyPolicyData(
      {this.title, this.description, required this.image, this.color});
}

class PlatformUsed {
  final String name;
  final String icon;

  PlatformUsed({
    required this.name,
    required this.icon,
  });
}

LinearGradient linearGrad(int i) => LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: color[i.clamp(0, color.length - 1)],
    );

final List<List<Color>> color = [
  const [
    Color.fromARGB(255, 15, 97, 164),
    Color.fromARGB(206, 36, 129, 195),
    Color.fromARGB(184, 5, 145, 226),
  ],
  const [
    Color.fromARGB(255, 15, 97, 164),
    Color.fromARGB(206, 36, 129, 195),
    Color.fromARGB(184, 5, 145, 226),
  ],
  const [
    Color.fromARGB(255, 181, 126, 220),
    Color.fromARGB(219, 183, 71, 203),
    Color.fromARGB(209, 115, 47, 155)
  ],
  const [
    Color.fromARGB(255, 197, 130, 60),
    Color.fromARGB(255, 204, 147, 95),
    Color.fromARGB(255, 197, 130, 60),
  ],
  const [
    Color.fromARGB(255, 197, 130, 60),
    Color.fromARGB(255, 204, 147, 95),
    Color.fromARGB(255, 197, 130, 60),
  ],
  const [
    Color.fromRGBO(37, 146, 166, 1),
    Color.fromRGBO(92, 182, 197, 1),
    Color.fromRGBO(37, 146, 166, 1),
  ],
];
