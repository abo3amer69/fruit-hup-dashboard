import 'package:dartz/dartz.dart';
import 'package:fruit_hup_dashboard/core/errors/failure.dart';
import 'package:fruit_hup_dashboard/core/repos/product_repo/products_repo.dart';
import 'package:fruit_hup_dashboard/core/services/database_services.dart';
import 'package:fruit_hup_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruit_hup_dashboard/features/add_product/data/model/add_product_input_model.dart';
import 'package:fruit_hup_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseServices databaseservices;

  ProductsRepoImpl(this.databaseservices);
  @override
  Future<Either<Failure, void>> addProduct(
    AddProductInputEntity addProductInputEntity,
  ) async {
    try {
      await databaseservices.addData(
        path: BackendEndpoint.productsCollection,
        data: AddProductInputModel.fromEntity(addProductInputEntity).tojson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to add product'));
    }
  }
}
