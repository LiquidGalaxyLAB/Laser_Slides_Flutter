import 'package:get_it/get_it.dart';
import 'package:laser_slides_flutter/domain/repositories/NetworkRepositories.dart';
import 'package:laser_slides_flutter/domain/repositories/NetworkSettings/NtwrkRepository.dart';
import 'package:laser_slides_flutter/ui/bloc/NetworkBloc.dart';
import 'package:laser_slides_flutter/ui/bloc/NetworkConfig_event.dart';
import 'package:laser_slides_flutter/ui/bloc/NetworkSettings/NetworkSettingsBloc.dart';
import 'package:laser_slides_flutter/ui/bloc/osc/OscSenderBloc.dart';
import 'package:laser_slides_flutter/ui/useCase/NetworkSettings/getNtwkStngs.dart';
import 'package:laser_slides_flutter/ui/useCase/NetworkSettings/removeNtwrkStngs.dart';
import 'package:laser_slides_flutter/ui/useCase/NetworkSettings/saveNtwrkStngs.dart';
import 'package:laser_slides_flutter/ui/useCase/getNetworkConfig.dart';
import 'package:laser_slides_flutter/ui/useCase/removeNetworkConfig.dart';
import 'package:laser_slides_flutter/ui/useCase/saveNetworkConfig.dart';

import 'data/local/database/NetworkDatabase.dart';
import 'domain/repositories/NetworkRepositoryImpl.dart';
import 'domain/repositories/NetworkSettings/NtwrkRepositoryImpl.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database = await $FloorNetworkDatabase
      .databaseBuilder('network_database.db')
      .build();

  sl.registerSingleton<NetworkDatabase>(database);

  //repository
  sl.registerSingleton<NetworkConfigRepository>(
      NetworkRepositoryImpl(networkDatabase: sl())
  );

  sl.registerSingleton<NetworkSettingsRepository>(
      NetworkSettingsRepositoryImpl(sl())
  );

  //useCase
  sl.registerSingleton<GetNetworkConfigUseCase>(
      GetNetworkConfigUseCase(networkConfigRepository: sl())
  );

  sl.registerSingleton<SaveNetworkConfigUseCase>(
      SaveNetworkConfigUseCase(networkConfigRepository: sl())
  );

  sl.registerSingleton<RemoveNetworkConfigUseCase>(
      RemoveNetworkConfigUseCase(networkConfigRepository: sl())
  );

  sl.registerSingleton<GetNetworkSettingsUseCase>(
      GetNetworkSettingsUseCase(networkSettingsRepository: sl())
  );

  sl.registerSingleton<SaveNetworkSettingsUseCase>(
      SaveNetworkSettingsUseCase(networkSettingsRepository: sl())
  );

  sl.registerSingleton<RemoveNetworkSettingsUseCase>(
      RemoveNetworkSettingsUseCase(networkSettingsRepository: sl())
  );

  //bloc
  sl.registerFactory<NetworkBloc>(() =>
   NetworkBloc(sl(), sl(), sl())
  );

  sl.registerFactory<NetworkSettingsBloc>(() =>
      NetworkSettingsBloc(sl(), sl(), sl())
  );

  sl.registerFactory<OSCSenderBloc>(() =>
      OSCSenderBloc()
  );

}
