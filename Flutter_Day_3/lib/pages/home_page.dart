import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_day_three/utils/routes.dart';
import '../models/catalog.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';
import '../widgets/theme.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadJsonData();
  }
  loadJsonData() async{
    await Future.delayed(const Duration(seconds: 2));
    var catalog = await rootBundle.loadString("assets/files/catalog.json");
    var decodedCatalog = jsonDecode(catalog);
    var productsData = decodedCatalog["products"];
    CatalogModel.items = List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {
    });
  }
  loadData() async{
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];

    CatalogModel.items = List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    //CatalogModel.items = List.from(productData).map<Item>((item) =>Item.fromMap(item)).toList();
    //print(productData);
    setState(() {

    });
  }

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Catalog App', style: TextStyle(color: Colors.black),),
  //       centerTitle: true,),
  //     drawer: const MyDrawer(),
  //     body: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)? GridView.builder(
  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: 2,
  //             mainAxisSpacing: 16,
  //             crossAxisSpacing: 16),
  //         itemCount: CatalogModel.items!.length,
  //         itemBuilder: (context,index){
  //           final item = CatalogModel.items![index];
  //           return Card(
  //             clipBehavior: Clip.antiAlias,
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(10)
  //             ),
  //             child: GridTile(
  //               header: Container(
  //                 padding: const EdgeInsets.all(12),
  //                 decoration: const BoxDecoration(
  //                   color: Colors.deepPurple
  //                 ),
  //                 child: Text(item.name, style: const TextStyle(color: Colors.white),),
  //               ),
  //                 child:Image.network(item.image),
  //             footer: Container(
  //               padding: const EdgeInsets.all(12),
  //               decoration: const BoxDecoration(
  //                 color: Colors.black
  //               ),
  //               child: Text('\$${item.price.toString()}',style: TextStyle(color: Colors.white),),
  //             ),),
  //           );
  //         }
  //       ): const Center(
  //         child: CircularProgressIndicator(),
  //       ),
  //     ),
  //     // body: const Center(
  //     //   child: Text('Welcome to practising',
  //     //     style: TextStyle(
  //     //       fontSize: 22.0,
  //     //       color: Colors.deepPurple,
  //     //       fontWeight: FontWeight.w500
  //     //     ),
  //     //   ),
  //     // ),
  //   );
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
        child: const Icon(CupertinoIcons.cart),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                  const CatalogList().py16().expand()
                else
                  const CircularProgressIndicator().centered().expand(),
              ],
          ),
        ),
      ),
    );
  }

}


