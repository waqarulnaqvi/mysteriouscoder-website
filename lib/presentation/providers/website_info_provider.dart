import 'package:flutter/widgets.dart';
import 'package:mysteriouscoder/presentation/models/projects_info.dart';

import '../models/services_utils.dart';

class WebsiteInfoProvider extends ChangeNotifier {
  final List<ProjectInfo> _projectList = projectInfoList;
  final List<ServicesUtils> _servicesList = servicesUtils;

  //Getter
  List<ProjectInfo> get getProjectList => _projectList;
  List<ServicesUtils> get getServicesList => _servicesList;

  PrivacyPolicyData? fetchPrivacyData(String routeName) {
    for (var element in _projectList) {
      if (element.routeName == routeName) {
        return element.privacyPolicyData;
      }
    }
    return null;
  }
}
