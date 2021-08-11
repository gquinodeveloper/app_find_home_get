import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:app_find_home/app/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) => Scaffold(
        backgroundColor: AppTheme.cyan,
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/find_home.svg"),
              RichText(
                text: TextSpan(
                  text: "Find",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: AppTheme.blueDark,
                        fontWeight: FontWeight.w900,
                      ),
                  children: [
                    TextSpan(
                      text: "Home",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 40.0,
                child: LinearProgressIndicator(
                  backgroundColor: AppTheme.blueDark,
                  color: AppTheme.cyan,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
