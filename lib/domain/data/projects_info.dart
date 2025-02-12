import 'dart:ui';

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
  final List<PlatformUsed> platformUsed;
  final PrivacyPolicyData? privacyPolicyData;

  ProjectInfo({
    required this.platformUsed,
    required this.name,
    required this.description,
    required this.icon,
    required this.mainImage,
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
        title: Constants.brainBooster, image: StaticImage.brainBoosterIcon,
      ),
      platformUsed: [
        PlatformUsed(name: 'Kotlin', icon: StaticImage.kotlinIcon),
        PlatformUsed(name: 'Jetpack Compose', icon: StaticImage.jetpackComposeIcon),
        PlatformUsed(name: 'Firebase', icon: StaticImage.firebaseIcon),
      ]),
  ProjectInfo(
      name: Constants.classicWingedBird,
      description: Constants.classicWingedBirdDescription,
      icon: StaticImage.classicWingedBirdIcon,
      mainImage: StaticImage.classicWingedBirdMainImage,
      playStoreLink: Constants.classicWingedBirdPlayStoreLink,
      privacyPolicyData: PrivacyPolicyData(
        title: Constants.classicWingedBird, image: StaticImage.classicWingedBirdIcon,
      ),
      platformUsed: [
        PlatformUsed(name: 'Kotlin', icon: StaticImage.kotlinIcon),
        PlatformUsed(name: 'Jetpack Compose', icon: StaticImage.jetpackComposeIcon),
        PlatformUsed(name: 'Firebase', icon: StaticImage.firebaseIcon),
]),
  ProjectInfo(
      name: Constants.hindiShayariHub,
      description: Constants.hindiShayariHubDescription,
      icon: StaticImage.hindiShayariHubIcon,
      mainImage: StaticImage.hindiShayariHubMainImage,
      playStoreLink: Constants.hindiShayariHubPlayStoreLink,
      privacyPolicyData: PrivacyPolicyData(
        title: Constants.hindiShayariHub, image: StaticImage.hindiShayariHubIcon,
      ),
      platformUsed: [
        PlatformUsed(name: 'Kotlin', icon: StaticImage.kotlinIcon),
        PlatformUsed(name: 'Jetpack Compose', icon: StaticImage.jetpackComposeIcon),
        PlatformUsed(name: 'Firebase', icon: StaticImage.firebaseIcon),
      ]),
  ProjectInfo(
      name: Constants.mazedarHindiJokes,
      description: Constants.mazedarHindiJokesDescription,
      icon: StaticImage.mazedarHindiJokesIcon,
      mainImage: StaticImage.mazedarHindiJokesMainImage,
      playStoreLink: Constants.mazedarHindiJokesPlayStoreLink,
      privacyPolicyData: PrivacyPolicyData(
        title: Constants.mazedarHindiJokes, image: StaticImage.mazedarHindiJokesIcon,
      ),
      platformUsed: [
        PlatformUsed(name: 'Kotlin', icon: StaticImage.kotlinIcon),
        PlatformUsed(name: 'Jetpack Compose', icon: StaticImage.jetpackComposeIcon),
        PlatformUsed(name: 'Firebase', icon: StaticImage.firebaseIcon),
      ]),
  ProjectInfo(
      name: Constants.noteMaster,
      description: Constants.noteMasterDescription,
      icon: StaticImage.noteMasterIcon,
      mainImage: StaticImage.noteMasterMainImage,
      playStoreLink: Constants.noteMasterPlayStoreLink,
      privacyPolicyData: PrivacyPolicyData(
        title: Constants.noteMaster, image: StaticImage.noteMasterIcon,
      ),
      platformUsed: [
        PlatformUsed(name: 'Kotlin', icon: StaticImage.kotlinIcon),
        PlatformUsed(name: 'Jetpack Compose', icon: StaticImage.jetpackComposeIcon),
        PlatformUsed(name: 'Firebase', icon: StaticImage.firebaseIcon),
      ]),
];

class PrivacyPolicyData {
  final String? title;
  final String? description;
  final String image;
  PrivacyPolicyData( {this.title, this.description,required this.image});
}

class PlatformUsed {
  final String name;
  final String icon;
  PlatformUsed({
    required this.name,
    required this.icon,
  });
}
