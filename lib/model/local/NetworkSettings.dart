import 'package:floor/floor.dart';

@Entity(tableName: 'NetworkSettingsConfig', primaryKeys: ['id'])
class NetworkSettings {
  final String receiveIpAddress;
  final String port;
  final String startPath;
  final String incomingIp;
  final String incomingPort;
  final String incomingStartPath;

  @PrimaryKey(autoGenerate: true)
  final int? id;

  NetworkSettings(
  {
    this.id,
    required this.receiveIpAddress,
    required this.port,
    required this.startPath,
    required this.incomingIp,
    required this.incomingPort,
    required this.incomingStartPath,
  });
}
