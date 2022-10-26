import 'package:flutter/material.dart';
import 'package:flutter_day_three/models/catalog.dart';
import 'package:flutter_day_three/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailsPage({Key? key, required this.catalog}) :assert(catalog!=null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl3.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    MyTheme.darkBluishColor
                  ),
                  shape: MaterialStateProperty.all(
                    const StadiumBorder(),
                  )),
              child: "Add to Cart".text.xl.make(),
            ).wh(150, 50)
          ],
        ).p24(),
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        bottom: false,
      child: Column(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
          ).h32(context),
          Expanded(
              child:VxArc(
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                height: 30.0,
                child: Container(
                  width: context.screenWidth,
                  color: context.cardColor,
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(context.accentColor)
                          .bold
                          .make(),
                      catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                      10.heightBox,
                      "Dolor sea takimata ipsum sea eirmod aliquyam est. Eos ipsum voluptua eirmod elitr, no dolor dolor amet eirmod dolor labore dolores magna. Amet vero vero vero kasd, dolore sea sed sit invidunt nonumy est sit clita. Diam aliquyam amet tempor diam no aliquyam invidunt. Elitr lorem eirmod dolore clita. Rebum."
                          .text.textStyle(context.captionStyle).make().p16()
                    ],
                  ).py64(),
                ),
              )
          )
        ],
      ),
      )
    );
  }
}
