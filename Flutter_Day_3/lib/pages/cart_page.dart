import 'package:flutter/material.dart';
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
    return ListView.builder(
      itemBuilder: (context,index)=>ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline_rounded),
          onPressed: (){},
        ),
        title: "Item 1".text.make(),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$9999".text.xl3.color(context.theme.accentColor).make(),
          30.widthBox,
          ElevatedButton(onPressed: (){},
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
