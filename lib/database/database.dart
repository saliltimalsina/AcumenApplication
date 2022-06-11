import 'package:floor/floor.dart';
import 'package:my_app/dao/CartDAO.dart';
import 'package:my_app/entity/cart.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;


part 'database.g.dart'; //generate


@Database(version: 1, entities: [Cart])
abstract class AppDatabase extends FloorDatabase {
  CartDAO get cartDAO;
  
}