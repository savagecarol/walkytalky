import 'package:get/state_manager.dart';

class Statemanagement {
  AppPermissions permissions;
  RxInt currentState;
  RxBool isLoading = false.obs;
  Statemanagement({required this.permissions ,required this.currentState});
}

class AppPermissions {
  RxBool isMicPermission = false.obs;
  RxBool isBackGroundPermission = false.obs;

  AppPermissions({
    bool isMicPermission = false,
    bool isBackGroundPermission = false,
  }) {
    this.isMicPermission.value = isMicPermission;
    this.isBackGroundPermission.value = isBackGroundPermission;
  }
}
