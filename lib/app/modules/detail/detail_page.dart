import 'package:app_find_home/app/modules/detail/detail_controller.dart';
import 'package:app_find_home/app/modules/detail/widgets/appbar_actions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'widgets/content.dart';
import 'widgets/footer.dart';
import 'widgets/header.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      builder: (_) => Scaffold(
        body: Stack(
          children: [
            Header(path: _.houseModel.photo ?? ""),
            AppBarActions(),
            Content(house: _.houseModel),
            Footer(house: _.houseModel),
          ],
        ),
      ),
    );
  }
}
