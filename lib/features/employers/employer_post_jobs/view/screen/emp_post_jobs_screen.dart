import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../../../../../services/getStates.dart';
import '../../../../../helpers/routes/app_pages.dart';
import '../../../../shared_widgets/buttons.dart';
import '../../../../shared_widgets/input_text.dart';
import 'package:eakazijobs/integrations.dart';
import 'package:eakazijobs/features/authentication/login/view/screen/sign_in.dart'
as SignIn;

class EmployePostJobsScreen extends StatelessWidget {
  EmployePostJobsScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? jobTitle = " ";

  submit() async {
    Controller c = Get.put(Controller());
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    var createJob = await SignIn.newActor
        ?.getFunc(FieldsMethod.createJob)
        ?.call([jobTitle]);
    print(createJob);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Post Jobs"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "What is the job designation?",
                  style: textTheme(context).bodyText1?.copyWith(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 29,
                ),
                InputTextNormal2(
                    // controller: signUpCtrl.usernameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onSave: (value) {
                      jobTitle = value;
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter job title';
                      }
                      return null;
                    },
                    hintText: "e.g create graphics  designer",
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name),
                Spacer(),
                SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: AuthBtn(
                        text: "Next",
                        isComplete: false,
                        onPressed: () {
                          submit();
                          Get.toNamed(Routes.empPostJoBScreen2, arguments: jobTitle);
                        }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
