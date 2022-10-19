import 'package:flutter/material.dart';

import '../models/catalog.dart';
import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog App', style: TextStyle(color: Colors.black),),
        centerTitle: true,),
      drawer: const MyDrawer(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context,index){
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
