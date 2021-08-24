import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:app_find_home/app/global_widgets/button_navigator.dart';
import 'package:app_find_home/app/modules/home/home_controller.dart';
import 'package:app_find_home/app/modules/home/widgets/category.dart';
import 'package:app_find_home/app/modules/home/widgets/houses.dart';
import 'package:app_find_home/app/modules/home/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        backgroundColor: AppTheme.background,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomScrollView(
                  slivers: [
                    Header(),
                    Search(),
                    Category(),
                    Houses(),
                  ],
                ),
              ),
              ButtonNavigator()
            ],
          ),
        ),
      ),
    );
  }
}
