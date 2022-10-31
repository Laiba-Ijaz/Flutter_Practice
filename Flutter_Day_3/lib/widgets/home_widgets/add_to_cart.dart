import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_day_three/core/store.dart';
import '../../models/cart.dart';
import '../../models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import '../theme.dart';
class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   VxState.watch(context, on: [VxMutation]);
    final CartModel _cart= (VxState.store as MyStore).cart;
    // final CatalogModel _catalog= (VxState.store as MyStore).catalog;
    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if(!isInCart){
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              MyTheme.darkBluishColor
          ),
          shape: MaterialStateProperty.all(
            const StadiumBorder(),
          )),
      child:isInCart? const Icon(Icons.done): const Icon(CupertinoIcons.cart_badge_plus)
    );
  }
}
