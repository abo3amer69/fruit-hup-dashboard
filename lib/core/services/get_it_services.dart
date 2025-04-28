import 'package:fruit_hup_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hup_dashboard/core/repos/images_repo/images_repo_impl.dart';
import 'package:fruit_hup_dashboard/core/repos/product_repo/products_repo.dart';
import 'package:fruit_hup_dashboard/core/repos/product_repo/products_repo_impl.dart';
import 'package:fruit_hup_dashboard/core/services/database_services.dart';
import 'package:fruit_hup_dashboard/core/services/fire_storage.dart';
import 'package:fruit_hup_dashboard/core/services/firestore_services.dart';
import 'package:fruit_hup_dashboard/core/services/storage_services.dart';
import 'package:fruit_hup_dashboard/core/services/supabase_storage_services.dart';
import 'package:fruit_hup_dashboard/features/orders/data/repos/orders_repo_impl.dart';
import 'package:fruit_hup_dashboard/features/orders/domain/repos/order_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<StorageServices>(SupabaseStorageServices());
  getIt.registerSingleton<DatabaseServices>(FirestoreServices());

  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImpl(getIt.get<StorageServices>()),

  );
  getIt.registerSingleton<ProductsRepo>(ProductsRepoImpl(
    getIt.get<DatabaseServices>(),
  ));

   getIt.registerSingleton<OrdersRepo>(OrderRepoImpl(
    getIt.get<FirestoreServices>(),
  ));
}
