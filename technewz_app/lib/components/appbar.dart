import "package:flutter/material.dart";
import 'package:technewz_app/utils/color.dart';
import 'package:technewz_app/utils/text.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key})
  : preferredSize = Size.fromHeight(50),
  super(key: key);
  @override
  // TODO: implement preferredSize
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [],
      backgroundColor: AppColors.black,
      elevation: 0,
      title: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BoldText(text: "Tech", size: 20, color: AppColors.primary),
            ModifiedText(text: "Newz", size: 20, color: AppColors.lightWhite)
          ],
        ),
      ),
      centerTitle: true,
    );
  }

}
