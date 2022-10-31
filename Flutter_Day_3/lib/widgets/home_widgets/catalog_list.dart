import 'package:flutter/material.dart';
import 'package:flutter_day_three/models/catalog.dart';
import 'package:flutter_day_three/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../pages/home_detail_page.dart';
import '../../widgets/theme.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index){
        //final catalog = CatalogModel.items![index];
        final catalog = CatalogModel.items![index];
        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                HomeDetailsPage(
                    catalog: catalog
                  //catalog: CatalogModel.getById(3)
                ),
            ),);
          },
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            ),
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  catalog.name.text.lg
                      .color(MyTheme.darkBluishColor)
                      .bold
                      .make(),
                  catalog.desc.text.textStyle(context.captionStyle).make(),
                  10.heightBox,
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      "\$${catalog.price}".text.bold.xl.make(),
                      AddToCart(catalog: catalog)
                    ],
                  ).pOnly(right: 5.0)
                ],
              ))
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py8();
  }
}