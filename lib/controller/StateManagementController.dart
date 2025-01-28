import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:walkytalky/model/StateManagement.dart';



class StatemanagementController extends GetxController {
  Statemanagement state;
  StatemanagementController({required this.state});


Future<void> checkAndUpdatePermissions() async {

  PermissionStatus micPermission = await Permission.microphone.status;
  if(micPermission.isGranted ==false)  {
            state.currentState.value = 0;
            return;
  }
  else{
        PermissionStatus notificationPermission = await Permission.notification.status;
          if(notificationPermission.isGranted ==false)  {
              state.currentState.value = 1;
              return;
          }
          else{
             state.currentState.value = 2;
             return;
          }
  }
}

  Future<void> microphonePermission() async{
      PermissionStatus micPermissRion = await Permission.microphone.request();
      if(micPermissRion.isPermanentlyDenied) openAppSettings();
      checkAndUpdatePermissions(); 
  }

    Future<void> notificationPermission() async{
      PermissionStatus notificationPermission = await Permission.notification.request();
      if(notificationPermission.isPermanentlyDenied) openAppSettings();
      checkAndUpdatePermissions();  
  }
}