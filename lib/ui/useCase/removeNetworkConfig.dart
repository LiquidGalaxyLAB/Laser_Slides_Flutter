import '../../core/usecase.dart';
import '../../domain/repositories/NetworkRepositories.dart';
import '../../model/local/NetworkEntity.dart';

class RemoveNetworkConfigUseCase implements UseCase<void, NetworkEntity> {
  final NetworkConfigRepository networkConfigRepository;

  RemoveNetworkConfigUseCase({required this.networkConfigRepository});

  @override
  Future<void> call({NetworkEntity? params}) async {
    return await networkConfigRepository.deleteNetworkConfig(params!);
  }
}