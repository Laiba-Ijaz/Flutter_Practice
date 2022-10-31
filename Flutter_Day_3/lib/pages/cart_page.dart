import 'package:flutter/material.dart';
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

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return _cart.items.isEmpty ?"Nothing to show".text.xl3.make() :ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context,index)=>ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline_rounded),
          onPressed: (){
            _cart.remove(_cart.items[index]);
            setState(() {});
          },
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
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl3.color(context.theme.accentColor).make(),
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
