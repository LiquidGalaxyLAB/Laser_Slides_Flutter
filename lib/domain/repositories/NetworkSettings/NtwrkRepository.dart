import 'package:laser_slides_flutter/model/local/NetworkSettings.dart';

abstract class NetworkSettingsRepository{
  Future<void> saveNetworkConfig(NetworkSettings networkEntity);
  Future<void> deleteNetworkConfig(NetworkSettings networkEntity);
  Future<List<NetworkSettings>> getAllNetworkConfig();
}