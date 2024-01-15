

import '../../core/usecase.dart';
import '../../domain/repositories/NetworkRepositories.dart';
import '../../model/local/NetworkEntity.dart';

class GetNetworkConfigUseCase implements UseCase<List<NetworkEntity>, void> {
  final NetworkConfigRepository networkConfigRepository;

  GetNetworkConfigUseCase({required this.networkConfigRepository});

  @override
  Future<List<NetworkEntity>> call({void params})  {
    return  networkConfigRepository.getAllNetworkConfig();
  }
}