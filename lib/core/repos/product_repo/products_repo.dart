import 'package:dartz/dartz.dart';
import 'package:fruit_hup_dashboard/core/errors/failure.dart';
import 'package:fruit_hup_dashboard/features/add_product/domain/entities/product_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failure,void>> addProduct(ProductEntity addProductInputEntity);
}