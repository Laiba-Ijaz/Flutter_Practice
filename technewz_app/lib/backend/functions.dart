import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:technewz_app/utils/key.dart';

import '../components/search_bar.dart';

Future<List> fetchNews() async{
  final response  = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey=' +
      Key.key +
      '&q=' +
      SearchBar.searchController.text),
  );
  Map result  = jsonDecode(response.body);
  print('Fetched');

  //fetching articles from json
  return(result['articles']);
}