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
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog App', style: TextStyle(color: Colors.black),),
        centerTitle: true,),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context,index){
            return ItemWidget(
              item: dummyList[index],
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

  loadData() async{
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
  }
}
