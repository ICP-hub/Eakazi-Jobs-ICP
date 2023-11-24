import 'package:eakazijobs/models/signinModel.dart';
import 'package:eakazijobs/models/signupModel.dart';
import 'package:eakazijobs/models/userModel.dart';
import 'package:eakazijobs/services/api_path.dart';
import 'package:eakazijobs/services/getStates.dart';
import 'package:eakazijobs/services/http_instance.dart';
import 'package:eakazijobs/services/localStorage.dart';
import 'package:get/get.dart';

LocalStorage localStorage = LocalStorage();

class AuthService {
  final _service = HttpInstance.instance;

  Future signUp(SignupModel payload) async {
    try {
      await _service.postData(APIPath.userSignUp(), payload);
    } catch (e) {
      rethrow;
    }
  }

  Future signIn(SigninModel payload) async {
    try {
      final authResult = await _service.postData(APIPath.userSignIn(), payload);
      await localStorage.setData(name: 'token', data: authResult['token']);
      await fetchProfile();
    } catch (e) {
      rethrow;
    }
  }

  Future fetchProfile() async {
    Controller c = Get.put(Controller());
    try {
      c.change(true);
      final result = await _service.getData(path: APIPath.profile());
      final decodedData = UserModel.fromJson(result['data']);
      c.setUserData(decodedData);
      c.change(false);
      return decodedData;
    } catch (e) {
      c.change(false);
      rethrow;
    }
  }
}
