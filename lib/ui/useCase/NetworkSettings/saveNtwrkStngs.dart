import 'package:laser_slides_flutter/core/usecase.dart';
import 'package:laser_slides_flutter/model/local/NetworkSettings.dart';

import '../../../domain/repositories/NetworkSettings/NtwrkRepository.dart';

class SaveNetworkSettingsUseCase implements UseCase<void,NetworkSettings>{
  final NetworkSettingsRepository networkSettingsRepository;

  SaveNetworkSettingsUseCase({required this.networkSettingsRepository});

  @override
  Future<void> call({NetworkSettings? params}) {
    return networkSettingsRepository.saveNetworkConfig(params!);
  }

}