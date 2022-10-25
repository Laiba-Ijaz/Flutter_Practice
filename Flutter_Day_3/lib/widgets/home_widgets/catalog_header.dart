import 'package:flutter/material.dart';
import 'package:flutter_day_three/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(context.theme.colorScheme.secondary).make(),
        "Trending Product".text.xl2.make()
      ],
    );
  }
}