// import 'package:chapa_links/locator.dart';
// import 'package:chapa_links/modules/authentication/services/auth_service.dart';
import 'package:flutter/material.dart';
// import 'package:package_info_plus/package_info_plus.dart';

class BaseChangeNotifier extends ChangeNotifier {
  BaseChangeNotifier();
  final bool _loading = false;

  bool get loading => _loading;

  bool _isloading = false;
  bool get isLoading => _isloading;

  set setLoading(bool isloading) {
    _isloading = isloading;
    notifyListeners();
  }

  String _message = "";
  String get message => _message;

  set setMessage(String message) {
    _message = message;
    notifyListeners();
  }

  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  void setNewPage(int val) {
    _pageIndex = val;
    notifyListeners();
  }

  void goToNextPage() {
    _pageIndex++;
    notifyListeners();
  }

  void goToPreviousPage() {
    _pageIndex--;
    notifyListeners();
  }

  void handleError({String? message}) {
    setLoading = false;
    setMessage = message ?? "error";
    notifyListeners();
  }

  void handleSuccess({String message = "Successful}"}) {
    setLoading = false;
    setMessage = message ?? "Successful";
    notifyListeners();
  }

  // Future<String> get appVersionNumber async {
  //   Map<String, dynamic> appVersionDetails = await getVersionNumber();
  //   return appVersionDetails["version"] ?? "";
  // }

  // Future<String> get appVersion async {
  //   // String baseURL = await this.userRepository.getBaseURl();

  //   Map<String, dynamic> appVersionDetails = await getVersionNumber();

  //   String versionNumber = "";

  //   String releaseVersion = "RELEASE";

  //   if (releaseVersion.toUpperCase() == "STAGING") {
  //     versionNumber = "V" + appVersionDetails["version"];
  //     //  +
  //     // " T." +
  //     // appVersionDetails["buildNumber"];
  //   } else {
  //     versionNumber = "V" + appVersionDetails["version"];
  //     //  +
  //     // " b." +
  //     // appVersionDetails["buildNumber"];
  //   }

  //   return versionNumber;
  // }

  // Future<Map<String, dynamic>> getVersionNumber() async {
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();

  //   String appName = packageInfo.appName;
  //   String packageName = packageInfo.packageName;
  //   String version = packageInfo.version;
  //   String buildNumber = packageInfo.buildNumber;

  //   return {
  //     "appName": appName,
  //     "packageName": packageName,
  //     "version": version,
  //     "buildNumber": buildNumber,
  //   };
  // }
}
