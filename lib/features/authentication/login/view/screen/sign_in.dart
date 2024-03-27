import 'package:agent_dart/agent_dart.dart';
import 'package:eakazijobs/helpers/utils/customLoader.dart';
import 'package:eakazijobs/models/signinModel.dart';
import 'package:eakazijobs/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../../constants/assets/images_constants.dart';
import '../../../../../constants/theme/color_selection.dart';
import '../../../../../helpers/routes/app_pages.dart';
import '../../../../../helpers/utils/utils.dart';
import '../../../../../integrations.dart';

import 'dart:async';
import 'package:uni_links/uni_links.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

// Global variables --------------------------
CanisterActor? newActor;
String? principal_id;

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? _error;
  StreamSubscription? _sub;
  var publicKeyString;
  Ed25519KeyIdentity? newIdentity;

  @override
  void initState() {
    super.initState();
    initUniLinks();
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  Future<bool> checkDetails() async {
    var fullName = await newActor!.getFunc(FieldsMethod.getFullName)?.call([]);
    var role = await newActor!.getFunc(FieldsMethod.getRole)?.call([]);

    if (fullName == "" && role == "") {
      return false;
    } else if (fullName != "" && role != "") {
      return true;
    } else {
      return false;
    }
  }

  // ---------------- Receiving Query Params ----------------

  Future<void> initUniLinks() async {
    _sub = uriLinkStream.listen((Uri? uri) async {
      if (uri != null && uri.scheme == 'auth' && uri.host == 'callback') {
        var queryParams = uri.queryParameters;

        String delegationString = queryParams['del'].toString();

        String _decodedDelegation = Uri.decodeComponent(delegationString);

        DelegationChain _delegationChain =
            DelegationChain.fromJSON(jsonDecode(_decodedDelegation));

        DelegationIdentity _delegationIdentity =
            DelegationIdentity(newIdentity!, _delegationChain);

        principal_id = _delegationIdentity.getPrincipal().toHex();

        HttpAgent newAgent = HttpAgent(
          options: HttpAgentOptions(
            identity: _delegationIdentity,
            // ---- Uncomment the following line to use main-net replica ----
            host: 'icp-api.io',
          ),
          // ---- Uncomment the following 3 lines to use a local replica ----
          // defaultHost: 'localhost',
          // defaultPort: 4943,
          // defaultProtocol: 'http',
        );

        // Creating Canister Actor -----------------------
        newActor = CanisterActor(
            ActorConfig(
              // ---- Main-net replica ----
              canisterId: Principal.fromText('c7oiy-yqaaa-aaaag-qc6sa-cai'),
              // ---- Local replica ----
              // canisterId: Principal.fromText('bw4dl-smaaa-aaaaa-qaacq-cai'),
              agent: newAgent,
            ),
            FieldsMethod.idl);

        var checkUser;

        // To confirm if there is any error at the time of backend call
        try {
          checkUser = await newActor!.getFunc(FieldsMethod.checkUser)?.call([]);
        } catch (e) {
          print(e);
          Fluttertoast.showToast(
              msg: "An error occurred: $e",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 2,
              textColor: Colors.white,
              fontSize: 16.0);
        }

        if (checkUser == true && await checkDetails()) {
          customLoader.showLoader('Welcome back, please wait...');
          Future.delayed(Duration(seconds: 1), () {
            customLoader.dismissLoader();
            Get.toNamed(Routes.home);
          });
        } else {
          customLoader
              .showLoader('Hey you are new here, please enter your details');
          Future.delayed(Duration(seconds: 1), () {
            customLoader.dismissLoader();
            Get.toNamed(Routes.signup);
          });
        }
      }
    });
  }

  // ---------------- Authentication ----------------
  Future<void> authenticate() async {
    try {
      newIdentity = await Ed25519KeyIdentity.generate(null);
      Ed25519PublicKey publicKey = newIdentity!.getPublicKey();
      var publicKeyDer = publicKey.toDer();
      publicKeyString = bytesToHex(publicKeyDer);
      // ---- Local replica ----
      // const baseUrl = 'http://localhost:4943';
      // final url =
      //     '$baseUrl?sessionkey=$publicKeyString&canisterId=asrmz-lmaaa-aaaaa-qaaeq-cai';
      // ---- Main-net replica ----
      const baseUrl = 'https://ckjzv-zyaaa-aaaag-qc6rq-cai.icp0.io';
      final url = '$baseUrl?sessionkey=$publicKeyString';
      await launch(
        url,
        customTabsOption: CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
        ),
        safariVCOption: SafariViewControllerOption(
          preferredBarTintColor: Theme.of(context).primaryColor,
          preferredControlTintColor: Colors.white,
          barCollapsingEnabled: true,
        ),
      );
    } catch (e) {
      setState(() {
        _error = 'Failed to open URL: $e';
      });
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SigninModel signinModel = SigninModel();
  AuthService authService = AuthService();
  CustomLoader customLoader = CustomLoader();

  validateFields(c) {
    print('validating fields');
    if (!_formKey.currentState!.validate()) {
      c.updateValidateStatus(false);
      return;
    } else {
      c.updateValidateStatus(true);
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    SignInValidateInputController c = Get.put(SignInValidateInputController());

    // AuthClient client = AuthClient(scheme: scheme, authFunction: authunction);
    return Obx(() => Scaffold(
          // appBar: App,

          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 50.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageAssets.backGroundImage),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: SafeArea(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: ColorsConst.white,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "Sign in",
                            style: textTheme(context).headline2,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              "Welcome back to EA Kazi complete courses , Get trained and certified by experts on the platform",
                              style: textTheme(context).subtitle2,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      key: _formKey,
                      onChanged: () {
                        validateFields(c);
                      },
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Column(
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                const SizedBox(
                                  width: 200,
                                  height: 100,
                                  child: Image(
                                      image: AssetImage(ImageAssets.icpLogo)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24, right: 24),
                                  child: AuthBtn(
                                    isComplete: c.isValidated.value,
                                    onPressed: authenticate,
                                    text: "Sign in with Internet Identity",
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF522785),
                                        Color(0xFFED1E79)
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}

class SignInValidateInputController extends GetxController {
  RxBool isValidated = false.obs;

  void updateValidateStatus(state) => isValidated.value = state;
}

class AuthBtn extends StatelessWidget {
  final bool isComplete;
  final VoidCallback onPressed; // Change here: Keep it as a reference
  final String text;
  final BorderRadius borderRadius;
  final Gradient gradient;
  final TextStyle textStyle;

  const AuthBtn({
    Key? key,
    required this.isComplete,
    required this.onPressed, // Change here: Pass the function reference
    required this.text,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.gradient = const LinearGradient(
      colors: [Color(0xFF522785), Color(0xFFED1E79)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
    this.textStyle = const TextStyle(
      color: Color(0xFFFFFFFF),
      fontWeight: FontWeight.bold,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed, // Change here: Use the function reference
        child: Text(
          text,
          style: textStyle,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          padding: const EdgeInsets.all(16),
        ),
      ),
    );
  }
}
