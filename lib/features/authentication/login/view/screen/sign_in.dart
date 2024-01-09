import 'package:agent_dart/agent_dart.dart';
import 'package:agent_dart/bridge/ffi/ffi.dart';
import 'package:eakazijobs/features/authentication/login/view/screen/authentication.dart';
import 'package:eakazijobs/helpers/utils/customLoader.dart';
import 'package:eakazijobs/models/signinModel.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:eakazijobs/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../../constants/assets/images_constants.dart';
import '../../../../../constants/theme/color_selection.dart';
import '../../../../../helpers/routes/app_pages.dart';
import '../../../../../helpers/utils/utils.dart';
import '../../../../../integrations.dart';
import '../../../../shared_widgets/buttons.dart';
import '../../../../shared_widgets/input_text.dart';

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:agent_dart/agent_dart.dart';

import 'package:eakazijobs/helpers/utils/customLoader.dart';
import 'package:eakazijobs/models/signupModel.dart';
import 'package:eakazijobs/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:eakazijobs/interactions.dart';
import 'package:eakazijobs/integrations.dart';
import 'package:eakazijobs/init.dart';
import 'package:eakazijobs/features/authentication/login/view/screen/sign_in.dart' as signIn;
import 'package:get/get.dart';
import 'package:agent_dart/agent_dart.dart';

import '../../../../../constants/assets/images_constants.dart';
import '../../../../../constants/theme/color_selection.dart';
import '../../../../../helpers/routes/app_pages.dart';
import '../../../../../helpers/utils/utils.dart';
import '../../../../shared_widgets/buttons.dart';
import '../../../../shared_widgets/input_text.dart';
import '../../../../shared_widgets/options_drop_down.dart';
import 'dart:convert';

CanisterActor? newActor;
var fullName;

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? _error;
  StreamSubscription? _sub;
  String? _principalIdentity;
  bool _isLoggedIn = false;
  var publicKeyString;
  // Counter? counter;
  String _decodedDelegation = '';
  CanisterActor? get actor => newActor;


  @override
  void initState() {
    super.initState();
    ed25519();
    initUniLinks();
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  // ---------------- Handling Login ----------------
  void handleLogin() async {
    await authenticate();
  }

  // ---------------- Handling Logout ----------------
  void handleLogout() {
    setState(() {
      _isLoggedIn = false;
      _principalIdentity = null;
    });
  }

  // ---------------- Receiving Query Params ----------------

  void printWrapped(String text) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  Future<void> initUniLinks() async {
    _sub = uriLinkStream.listen((Uri? uri) async {
      if (uri != null && uri.scheme == 'auth' && uri.host == 'callback') {
        var queryParams = uri.queryParameters;

        String delegationString = queryParams['del'].toString();
        printWrapped("DelegationString: $delegationString");

        _decodedDelegation = Uri.decodeComponent(delegationString);
        printWrapped("Decoded DelegationString: $_decodedDelegation");

        DelegationChain _delegationChain =
            DelegationChain.fromJSON(jsonDecode(_decodedDelegation));

        DelegationIdentity _delegationIdentity =
            DelegationIdentity(newIdentity!, _delegationChain);

        HttpAgent newAgent = HttpAgent(
          options: HttpAgentOptions(
            identity: _delegationIdentity,
          ),
          defaultHost: 'localhost',
          defaultPort: 4943,
          defaultProtocol: 'http',
        );

        // Creating Canister Actor -----------------------
        newActor = CanisterActor(
            ActorConfig(
              canisterId: Principal.fromText('a4tbr-q4aaa-aaaaa-qaafq-cai'),
              agent: newAgent,
            ),
            FieldsMethod.idl);

        // var createUser = await newActor?.getFunc(FieldsMethod.createUser)?.call([
        //   'John Doe',
        //   'abc@gmail.com',
        //   'freelancer',
        // ]);
        //
        // print("Create User: $createUser");

        // final actorController = Get.find<ActorController>();
        // actorController.setActor(newActor!);

        // var res = await newActor?.getFunc(CounterMethod.whoamI)?.call([]);
        // print("WhoAmI : $res");

        // var checkUser = await newActor?.getFunc(CounterMethod.checkUser)?.call([]);
        // Get.toNamed(Routes.signup);
        // var path = queryParams['path'];
        //
        // if ( path != null && path.isNotEmpty ) {
        //   Get.toNamed(path);
        // }
        //
        var checkUser = false;

        if (checkUser == true) {
          Get.toNamed(Routes.home);
        } else {
          Get.toNamed(Routes.signup);
        }

        // var checkUser = await newActor?.getFunc(CounterMethod.checkUser)?.call([]);

        // bool loginStatus = true;

        // bool loginStatus = queryParams['status'] == 'true';
        //
        // if (loginStatus) {
        //   processDelegation(queryParams);
        // }

        //     setState(() {
        //       _isLoggedIn = loginStatus;
        //       if (loginStatus) {
        //         _principalIdentity = queryParams['principal'] ?? 'Not available';
        //         _error = queryParams['error'] ?? '';
        //       } else {
        //         _principalIdentity = null;
        //       }
        //     });
        //   }
        // }, onError: (err) {
        //   print('Error processing incoming URI: $err');
      }
    });
  }

  // ---------------- Generating ED25519 Key ----------------
  Ed25519KeyIdentity? newIdentity;
  Future<void> ed25519() async {
    newIdentity = await Ed25519KeyIdentity.generate(null);
    Ed25519PublicKey publicKey = newIdentity!.getPublicKey();
    var publicKeyDer = publicKey.toDer();
    publicKeyString = bytesToHex(publicKeyDer);

    print("Public Key: $publicKeyString");
  }

  // ---------------- Authentication ----------------
  Future<void> authenticate() async {
    try {
      // ----- Port : 4943 -----
      const baseUrl = 'http://localhost:4943';
      final url =
          '$baseUrl?sessionkey=$publicKeyString&canisterId=bd3sg-teaaa-aaaaa-qaaba-cai';
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
  //  var authClientCreateOptions = AuthClientLoginOptions()
  // var createUrlOptions = CreateUrlOptions(
  //   redirectUri: Uri(
  //     scheme: "https",
  //     path: "login.html",
  //     host: "https://identity.ic0.app/#authorize",
  //   )
  //   publicKey: publicKey, // of session key
  //    scope: scope
  //    )

  //   var authClient = AuthClient(
  //   scheme: "rubaru",
  //   path: "auth",
  //   authFunction: (AuthPayload payload) async {
  //     Uri uri = Uri(
  //       scheme: "https",
  //       path: "login.html",
  //       host: "https://identity.ic0.app/#authorize",
  //       queryParameters: {
  //         "authUrl": payload.url,
  //       },
  //     );
  //     String result = await FlutterWebAuth.authenticate(
  //       url: uri.toString(),
  //       callbackUrlScheme: "rubaru",
  //     );
  //     return result;
  //   },
  // );

  // @override
  // submitSecond(context) async {}
  //
  // @override
  // submit(context) async {
  //   try {
  //     if (!_formKey.currentState!.validate()) {
  //       return;
  //     }
  //     _formKey.currentState!.save();
  //     customLoader.showLoader('Login you in...');
  //
  //     final result = await authService.signIn(signinModel);
  //     print('result $result');
  //     customLoader.dismissLoader();
  //
  //     Get.toNamed(Routes.home);
  //     // if (signupModel.role == 'freelancer') {
  //     //   Get.toNamed(Routes.freeLancerHome);
  //     // }
  //
  //     // Get.to((CompleteRegistration()));
  //     // Navigator.pushNamed(context, CompleteRegistrationRoute);
  //
  //     // Get.to(Tabs());
  //   } catch (e) {
  //     customLoader.showError(e);
  //   }
  // }

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
                            // InputTextNormal(
                            //     // controller: signUpCtrl.usernameController,
                            //     autovalidateMode:
                            //         AutovalidateMode.onUserInteraction,
                            //     // validator: signUpCtrl.usernameValidator,
                            //     hintText: "Email address",
                            //     textInputAction: TextInputAction.next,
                            //     onSave: (String? value) {
                            //       signinModel.email = value;
                            //     },
                            //     validator: (String? value) {
                            //       if (value == '') {
                            //         return '';
                            //       }
                            //     },
                            //     keyboardType: TextInputType.emailAddress),
                            // const SizedBox(
                            //   height: 24,
                            // ),
                            // InputPasswordText(
                            //     // controller: signUpCtrl.passwordController,
                            //     autovalidateMode:
                            //         AutovalidateMode.onUserInteraction,
                            //     // validator: signUpCtrl.passwordValidtor,
                            //     hintText: "Password",
                            //     textInputAction: TextInputAction.next,
                            //     onSave: (String? value) {
                            //       signinModel.password = value;
                            //     },
                            //     validator: (String? value) {
                            //       if (value == '' || value!.length < 6) {
                            //         return 'Password must be minimum of 6 characters';
                            //       }
                            //     },
                            //     keyboardType: TextInputType.visiblePassword),
                            // Align(
                            //   alignment: Alignment.topRight,
                            //   child: Text(
                            //     "Forgot your password?",
                            //     style: textTheme(context).subtitle1?.copyWith(
                            //         color: colorScheme(context).secondary.withOpacity(0.5)),
                            //   ),
                            // ),

                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // Align(
                            //   alignment: Alignment.topRight,
                            //   child: Text(
                            //     "Forgot your password?",
                            //     style: textTheme(context).subtitle1?.copyWith(
                            //         color: colorScheme(context)
                            //             .secondary
                            //             .withOpacity(0.5)),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 50,
                            // ),
                            Column(
                              children: [
                                // Padding(
                                //   padding: const EdgeInsets.only(
                                //       left: 16, right: 16),
                                //   child: AuthBtn(
                                //     isComplete: c.isValidated.value == true
                                //         ? true
                                //         : false,
                                //     onPressed: () {
                                //       submit(context);
                                //       // Get.toNamed(Routes.freeLancerHome);
                                //       // Loader<void>(context)
                                //       //     .simpleLoader(() => signUpCtrl.signUp());
                                //     },
                                //     text: "Sign In",
                                //   ),
                                // ),

                                // add internet identity signin
                                // customDropDown, themes, buttons,badges, messagelistcontiner
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
                                  padding: const EdgeInsets.only(left: 24, right: 24),
                                  child: AuthBtn(
                                    isComplete: c.isValidated.value,
                                    onPressed: handleLogin, // Change here: Pass the handleLogin function
                                    text: "Sign in with Internet Identity",
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: LinearGradient(
                                      colors: [Color(0xFF522785), Color(0xFFED1E79)],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),

                                // const SizedBox(
                                //   height: 6,
                                // ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.signup);
                                  },
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Dont have an account',
                                      style: textTheme(context)
                                          .subtitle1
                                          ?.copyWith(
                                              color: Colors.black
                                                  .withOpacity(0.3)),
                                      children: [
                                        TextSpan(
                                          text: "  Signup",
                                          style: textTheme(context)
                                              .subtitle1
                                              ?.copyWith(
                                                  color: colorScheme(context)
                                                      .primary),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
                // const Spacer(),
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
          primary: Colors.transparent,
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