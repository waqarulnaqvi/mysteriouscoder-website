import 'package:flutter/cupertino.dart';
import 'package:mysteriouscoder/presentation/widgets/static_image.dart';
import 'package:mysteriouscoder/shared/constants.dart';

class ProjectInfo {
  final String name;
  final String description;
  final String icon;
  final String mainImage;
  final String? playStoreLink;
  final String? appStoreLink;
  final String? githubLink;
  final LinearGradient linearGradient;
  final List<PlatformUsed> platformUsed;
  final PrivacyPolicyData? privacyPolicyData;

  ProjectInfo({
    required this.platformUsed,
    required this.name,
    required this.description,
    required this.icon,
    required this.mainImage,
    required this.linearGradient,
    this.appStoreLink,
    this.playStoreLink,
    this.githubLink,
    this.privacyPolicyData,
  });
}

List<ProjectInfo> projectInfoList = [
  ProjectInfo(
      name: Constants.brainBooster,
      description: Constants.brainBoosterDescription,
      icon: StaticImage.brainBoosterIcon,
      mainImage: StaticImage.brainBoosterMainImage,
      playStoreLink: Constants.brainBoosterPlayStoreLink,
      privacyPolicyData: PrivacyPolicyData(
        title: Constants.brainBooster,
        image: StaticImage.brainBoosterIcon,
      ),
      platformUsed: [
        PlatformUsed(name: 'Kotlin', icon: StaticImage.kotlinIcon),
        PlatformUsed(
            name: 'Jetpack Compose', icon: StaticImage.jetpackComposeIcon),
        PlatformUsed(name: 'Firebase', icon: StaticImage.firebaseIcon),
      ],
      linearGradient: linearGrad(0)),
  ProjectInfo(
      name: Constants.classicWingedBird,
      description: Constants.classicWingedBirdDescription,
      icon: StaticImage.classicWingedBirdIcon,
      mainImage: StaticImage.classicWingedBirdMainImage,
      playStoreLink: Constants.classicWingedBirdPlayStoreLink,
      privacyPolicyData: PrivacyPolicyData(
        title: Constants.classicWingedBird,
        image: StaticImage.classicWingedBirdIcon,
      ),
      platformUsed: [
        PlatformUsed(name: 'Kotlin', icon: StaticImage.kotlinIcon),
        PlatformUsed(
            name: 'Jetpack Compose', icon: StaticImage.jetpackComposeIcon),
        PlatformUsed(name: 'Firebase', icon: StaticImage.firebaseIcon),
      ],
      linearGradient: linearGrad(1)),
  ProjectInfo(
      name: Constants.hindiShayariHub,
      description: Constants.hindiShayariHubDescription,
      icon: StaticImage.hindiShayariHubIcon,
      mainImage: StaticImage.hindiShayariHubMainImage,
      playStoreLink: Constants.hindiShayariHubPlayStoreLink,
      privacyPolicyData: PrivacyPolicyData(
        title: Constants.hindiShayariHub,
        image: StaticImage.hindiShayariHubIcon,
      ),
      platformUsed: [
        PlatformUsed(name: 'Kotlin', icon: StaticImage.kotlinIcon),
        PlatformUsed(
            name: 'Jetpack Compose', icon: StaticImage.jetpackComposeIcon),
        PlatformUsed(name: 'Firebase', icon: StaticImage.firebaseIcon),
      ],
      linearGradient: linearGrad(2)),
  ProjectInfo(
      name: Constants.mazedarHindiJokes,
      description: Constants.mazedarHindiJokesDescription,
      icon: StaticImage.mazedarHindiJokesIcon,
      mainImage: StaticImage.mazedarHindiJokesMainImage,
      playStoreLink: Constants.mazedarHindiJokesPlayStoreLink,
      privacyPolicyData: PrivacyPolicyData(
        title: Constants.mazedarHindiJokes,
        image: StaticImage.mazedarHindiJokesIcon,
      ),
      platformUsed: [
        PlatformUsed(name: 'Kotlin', icon: StaticImage.kotlinIcon),
        PlatformUsed(
            name: 'Jetpack Compose', icon: StaticImage.jetpackComposeIcon),
        PlatformUsed(name: 'Firebase', icon: StaticImage.firebaseIcon),
      ],
      linearGradient: linearGrad(3)),
  ProjectInfo(
      name: Constants.noteMaster,
      description: Constants.noteMasterDescription,
      icon: StaticImage.noteMasterIcon,
      mainImage: StaticImage.noteMasterMainImage,
      playStoreLink: Constants.noteMasterPlayStoreLink,
      privacyPolicyData: PrivacyPolicyData(
        title: Constants.noteMaster,
        image: StaticImage.noteMasterIcon,
      ),
      platformUsed: [
        PlatformUsed(name: 'Kotlin', icon: StaticImage.kotlinIcon),
        PlatformUsed(
            name: 'Jetpack Compose', icon: StaticImage.jetpackComposeIcon),
        PlatformUsed(name: 'Firebase', icon: StaticImage.firebaseIcon),
      ],
      linearGradient: linearGrad(4)),
];

class PrivacyPolicyData {
  final String? title;
  final String? description;
  final String image;
  PrivacyPolicyData({this.title, this.description, required this.image});
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
      colors: color[i],
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
];
