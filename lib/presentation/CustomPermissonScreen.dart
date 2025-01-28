import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:walkytalky/components/CustomLoader.dart';
import 'package:walkytalky/controller/StateManagementController.dart';
import 'package:walkytalky/global/AppColors.dart';
import 'package:walkytalky/model/StateManagement.dart';
import 'package:walkytalky/presentation/Auth.dart';
import 'package:walkytalky/presentation/screen/CustomPermissionScreen.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({super.key});

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {
  StatemanagementController statemanagementcontroller =
      StatemanagementController(
          state: Statemanagement(
              permissions: AppPermissions(), currentState: 0.obs));

  @override
  void initState() {
    super.initState();
    checkPermissions();
  }

  void checkPermissions() async {
    statemanagementcontroller.state.isLoading.value = true;
    await statemanagementcontroller.checkAndUpdatePermissions();
    if (statemanagementcontroller.state.currentState.value == 2) {
      Navigator.pop(context); 
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Auth()),
      );
    }
    statemanagementcontroller.state.isLoading.value = false;
  }

  Widget _customPermissionPageViewer(int currentScreen) {
    switch (currentScreen) {
      case 0:
        return CustomPermissionScreen(
            imageUrl: 'assets/logo/logo.png',
            text: 'Mircrophone Permission',
            onTap: () async =>
                statemanagementcontroller.microphonePermission(),
            buttonColor: AppColors.primaryVariant);
      case 1:
        return CustomPermissionScreen(
            imageUrl: 'assets/logo/logo.png',
            text: 'Notification Permission',
            onTap: () async =>
                statemanagementcontroller.notificationPermission(),
            buttonColor: AppColors.primaryVariant);
      default:
        return CustomPermissionScreen(
            imageUrl: 'assets/logo/logo.png',
            text: 'mircrophone Permission',
            onTap: () async =>
                statemanagementcontroller.microphonePermission(),
            buttonColor: AppColors.primaryVariant);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: Obx(() {
            return statemanagementcontroller.state.isLoading.value
                ? const Center(child: Customloader(size: 32))
                : Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 64, horizontal: 16),
                    child: _customPermissionPageViewer(
                        statemanagementcontroller.state.currentState.value),
                  );
          })),
    );
  }
}
