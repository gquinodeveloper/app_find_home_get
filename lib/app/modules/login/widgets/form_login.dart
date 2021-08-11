import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:app_find_home/app/global_widgets/input_text.dart';
import 'package:app_find_home/app/global_widgets/primary_button.dart';
/* import 'package:app_find_home/app/core/utils/responsive.dart';
import 'package:app_find_home/app/global_widgets/input_text.dart';
import 'package:app_find_home/app/global_widgets/primary_button.dart'; */
import 'package:app_find_home/app/modules/login/login_controller.dart';
import 'package:app_find_home/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) => LayoutBuilder(
        builder: (context, constraint) {
          return Padding(
            padding: EdgeInsets.only(bottom: constraint.maxHeight * .1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Welcome",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: AppTheme.blueDark,
                        fontWeight: FontWeight.w900,
                      ),
                ),
                Text(
                  "Login form enjoy findhome",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                SizedBox(height: 50.0),
                InputText(
                  iconPrefix: Icons.email_outlined,
                  iconColor: AppTheme.light,
                  border: InputBorder.none,
                  keyboardType: TextInputType.emailAddress,
                  labelText: "Email",
                  filled: false,
                  enabledBorderColor: Colors.black26,
                  focusedBorderColor: AppTheme.cyan,
                  fontSize: 14.0,
                  fontColor: Colors.black45,
                  //onChanged: ,
                ),
                SizedBox(height: 20.0),
                InputText(
                  iconPrefix: Icons.lock,
                  iconColor: AppTheme.light,
                  border: InputBorder.none,
                  keyboardType: TextInputType.text,
                  labelText: "Password",
                  filled: false,
                  enabledBorderColor: Colors.black26,
                  focusedBorderColor: AppTheme.cyan,
                  fontSize: 14.0,
                  fontColor: Colors.black45,
                  suffixIcon: Icon(Icons.visibility, color: AppTheme.light),
                  //onChanged: ,
                ),
                SizedBox(height: 30.0),
                PrimaryButton(
                  texto: "Sign in",
                  onPressed: () {
                    print("object");
                  },
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Forgot password",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(color: Colors.black54),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Create new account",
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: AppTheme.blueDark,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
