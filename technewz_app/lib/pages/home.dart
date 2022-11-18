import 'package:flutter/material.dart';
import 'package:technewz_app/backend/functions.dart';
import 'package:technewz_app/components/news_box.dart';
import 'package:technewz_app/utils/constants.dart';

import '../components/appbar.dart';
import '../components/search_bar.dart';
import '../utils/color.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;

  @override
  void initState() {
    super.initState();
    news = fetchNews();
  }
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          const SearchBar(),
          Expanded(
              child: Container(
                width: w,
                child: FutureBuilder<List>(
                  future: fetchNews(),
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      return ListView.builder(
                        itemCount : snapshot.data!.length,
                        itemBuilder : (context, index){
                          return NewsBox(
                              imageurl: snapshot.data![index]['urlToImage'] ?? Constants.imageUrl,
                              title: snapshot.data![index]['title'],
                              time: snapshot.data![index]['publishedAt'],
                              description: snapshot.data![index]['description'].toString(),
                              url: snapshot.data![index]['url']);
                        }
                      );
                    }
                    else if (snapshot.hasError){
                      return Text("${snapshot.error}");
                    }
                    //By default loading spinner
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  },
                ),
            )
          )
        ],
      ),
    );
  }
}
