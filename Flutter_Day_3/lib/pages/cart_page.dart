import 'package:flutter/material.dart';
import 'package:flutter_day_three/core/store.dart';
import '../models/cart.dart';
import '../widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';
class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(backgroundColor: Colors.transparent,title: "Cart".text.make(),centerTitle: true,),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal()
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  const _CartList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty ?"Nothing to show".text.xl3.makeCentered() :ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context,index)=>ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline_rounded),
          onPressed: ()=> RemoveMutation(_cart.items[index])
          // setState(() {});
        ),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         VxBuilder(
           // notifications: {}, used for VxConsumer and we changed it to VxBuilder
           mutations: {RemoveMutation},
           builder: (context,_, status) {
             return "\$${_cart.totalPrice}"
                 .text
                 .xl5
                 .color(context.theme.accentColor)
                 .make();
           },
           // builder: (context, _){
           //   "\$${_cart.totalPrice}".text.xl3.color(context.theme.accentColor).make();
           // },
         ),
          30.widthBox,
          ElevatedButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Buying is not supported yet".text.white.make()));
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                MyTheme.darkBluishColor
            ),
            shape: MaterialStateProperty.all(
              const StadiumBorder()
            )
          ),
            child: "Buy".text.make(),
          ).w32(context)

        ],
      ),
    );
  }
}
