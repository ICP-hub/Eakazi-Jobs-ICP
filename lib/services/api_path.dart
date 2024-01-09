import 'package:eakazijobs/services/config.dart';

class APIPath {
  static String userSignUp() => '${Config.baseUrl}/auth/register';
  static String userSignIn() => '${Config.baseUrl}/auth/login';
  static String profile() => '${Config.baseUrl}/user';
}
