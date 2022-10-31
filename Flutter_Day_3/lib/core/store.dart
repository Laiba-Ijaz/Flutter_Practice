import 'package:flutter_day_three/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';
class MyStore extends VxStore{
  late CartModel cart;
  late CatalogModel catalog;

  MyStore(){
    catalog=CatalogModel();
    cart = CartModel();
    cart.catalog=catalog;
  }
}