import 'package:eakazijobs/models/userModel.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  final isLoading = false.obs;
  Rx<UserModel> userData = UserModel().obs;

  void change(state) => isLoading.value = state;
  void setUserData(state) => userData.value = state;
  void resetUserData() => userData = UserModel().obs;
}
