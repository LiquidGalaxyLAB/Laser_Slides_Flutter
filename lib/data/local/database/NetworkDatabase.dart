import 'dart:async';
import 'package:floor/floor.dart';
import 'package:laser_slides_flutter/data/local/dao/NetworkDao.dart';
import 'package:laser_slides_flutter/data/local/dao/NetworkSettings.dart';
import 'package:laser_slides_flutter/model/local/NetworkEntity.dart';
import 'package:laser_slides_flutter/model/local/NetworkSettings.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'NetworkDatabase.g.dart';


@Database(version: 2, entities: [NetworkEntity, NetworkSettings])
abstract class NetworkDatabase extends FloorDatabase {
  NetworkDao get networkConfigDao;
  NetworkSettingsDao get networkSettingsConfigDao;
}