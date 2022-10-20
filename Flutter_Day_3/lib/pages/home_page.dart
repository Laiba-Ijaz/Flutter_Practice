import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/catalog.dart';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';
import 'dart:convert';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog App', style: TextStyle(color: Colors.black),),
        centerTitle: true,),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: CatalogModel.items!.length,
          itemBuilder: (context,index){
            return ItemWidget(
              item: CatalogModel.items![index],
            );
          }
        ),
      ),
      // body: const Center(
      //   child: Text('Welcome to practising',
      //     style: TextStyle(
      //       fontSize: 22.0,
      //       color: Colors.deepPurple,
      //       fontWeight: FontWeight.w500
      //     ),
      //   ),
      // ),
    );
  }


}
