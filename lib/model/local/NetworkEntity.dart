import 'package:floor/floor.dart';

@Entity(tableName: 'NetworkConfigs', primaryKeys: ['id'])
class NetworkEntity {

  final String label;
  final String buttonPressedCommand;
  final String buttonReleasedCommand;
  bool isReleaseChecked;

  @PrimaryKey(autoGenerate: true)
  final int? id;

  NetworkEntity({
    required this.id,
    required this.label,
    required this.buttonPressedCommand,
    required this.buttonReleasedCommand,
    this.isReleaseChecked = false,
  });
}