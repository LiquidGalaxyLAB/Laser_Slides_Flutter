import 'package:laser_slides_flutter/core/usecase.dart';
import 'package:laser_slides_flutter/model/local/NetworkSettings.dart';

import '../../../domain/repositories/NetworkSettings/NtwrkRepository.dart';

class GetNetworkSettingsUseCase implements UseCase<List<NetworkSettings>,void> {
  final NetworkSettingsRepository networkSettingsRepository;

  GetNetworkSettingsUseCase({required this.networkSettingsRepository});

  @override
  Future<List<NetworkSettings>> call({void params}) {
    return networkSettingsRepository.getAllNetworkConfig();
  }

}