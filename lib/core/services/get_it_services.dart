import 'package:fruit_hup_dashboard/core/services/fire_storage.dart';
import 'package:fruit_hup_dashboard/core/services/storage_services.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<StorageServices>(FireStorage());
}
