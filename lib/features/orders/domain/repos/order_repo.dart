import 'package:dartz/dartz.dart';
import 'package:fruit_hup_dashboard/core/errors/failure.dart';
import 'package:fruit_hup_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruit_hup_dashboard/features/orders/domain/entities/order_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failure, List<OrderEntity>>> fetchOrders();
}
