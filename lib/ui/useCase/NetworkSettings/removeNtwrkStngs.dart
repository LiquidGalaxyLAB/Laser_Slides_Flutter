import '../../../core/usecase.dart';
import '../../../domain/repositories/NetworkSettings/NtwrkRepository.dart';
import '../../../model/local/NetworkSettings.dart';

class RemoveNetworkSettingsUseCase implements UseCase<void, NetworkSettings> {
  final NetworkSettingsRepository networkSettingsRepository;

  RemoveNetworkSettingsUseCase({required this.networkSettingsRepository});

  @override
  Future<void> call({NetworkSettings? params}) async {
    return await networkSettingsRepository.deleteNetworkConfig(params!);
  }
}