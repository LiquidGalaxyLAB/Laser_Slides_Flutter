

import 'package:laser_slides_flutter/model/local/NetworkEntity.dart';

import '../../core/usecase.dart';
import '../../domain/repositories/NetworkRepositories.dart';

class SaveNetworkConfigUseCase implements UseCase<void, NetworkEntity> {
  final NetworkConfigRepository networkConfigRepository;

  SaveNetworkConfigUseCase({required this.networkConfigRepository});

  @override
  Future<void> call({ NetworkEntity ? params}) async {
    return await networkConfigRepository.saveNetworkConfig(params!);
  }
}