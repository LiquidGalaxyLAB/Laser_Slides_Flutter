

import 'package:laser_slides_flutter/data/local/database/NetworkDatabase.dart';
import 'package:laser_slides_flutter/domain/repositories/NetworkRepositories.dart';
import 'package:laser_slides_flutter/model/local/NetworkEntity.dart';

class NetworkRepositoryImpl implements NetworkConfigRepository {
  final NetworkDatabase networkDatabase;

  NetworkRepositoryImpl({required this.networkDatabase});

  @override
  Future<void> deleteNetworkConfig(NetworkEntity networkEntity) {
    return networkDatabase.networkConfigDao.deleteNetwork(networkEntity);
  }

  @override
  Future<List<NetworkEntity>> getAllNetworkConfig() {
    return networkDatabase.networkConfigDao.findAllNetworks();
  }

  @override
  Future<void> saveNetworkConfig(NetworkEntity networkEntity) {
    return networkDatabase.networkConfigDao.insertNetwork(networkEntity);
  }

}