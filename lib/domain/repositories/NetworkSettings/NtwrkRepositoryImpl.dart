import '../../../data/local/dao/NetworkSettings.dart';
import '../../../data/local/database/NetworkDatabase.dart';
import '../../../model/local/NetworkSettings.dart';
import 'NtwrkRepository.dart';

class NetworkSettingsRepositoryImpl implements NetworkSettingsRepository {
  final NetworkDatabase _networkDatabase;

  NetworkSettingsRepositoryImpl(this._networkDatabase);

  @override
  Future<void> deleteNetworkConfig(NetworkSettings networkEntity) async {
    await _networkDatabase.networkSettingsConfigDao.deleteNetworkSettings(networkEntity);
  }

  @override
  Future<List<NetworkSettings>> getAllNetworkConfig() async {
    return await _networkDatabase.networkSettingsConfigDao.findAllNetworkSettings();
  }

  @override
  Future<void> saveNetworkConfig(NetworkSettings networkEntity) async {
    await _networkDatabase.networkSettingsConfigDao.insertNetworkSettings(networkEntity);
  }
}