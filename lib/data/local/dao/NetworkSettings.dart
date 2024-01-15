
import 'package:floor/floor.dart';

import '../../../model/local/NetworkSettings.dart';

@dao
abstract class NetworkSettingsDao {
  @Query('SELECT * FROM NetworkSettingsConfig')
  Future<List<NetworkSettings>> findAllNetworkSettings();

  @Query('SELECT * FROM NetworkSettingsConfig WHERE id = :id')
  Stream<NetworkSettings?> findNetworkSettingsById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertNetworkSettings(NetworkSettings networkSettings);

  @Update()
  Future<void> updateNetworkSettings(NetworkSettings networkSettings);

  @delete
  Future<void> deleteNetworkSettings(NetworkSettings networkSettings);
}