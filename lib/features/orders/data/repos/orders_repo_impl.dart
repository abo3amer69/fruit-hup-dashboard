import 'package:dartz/dartz.dart';
import 'package:fruit_hup_dashboard/core/errors/failure.dart';
import 'package:fruit_hup_dashboard/core/services/database_services.dart';
import 'package:fruit_hup_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruit_hup_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruit_hup_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hup_dashboard/features/orders/domain/repos/order_repo.dart';

class OrderRepoImpl implements OrdersRepo {
  final DatabaseServices _dataServices;

  OrderRepoImpl(this._dataServices);

  @override
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders() async* {
    try {
      await for (var data in _dataServices.streamData(
        path: BackendEndpoint.getOrders,
      )) {
        List<OrderEntity> orders =
            (data as List<dynamic>)
                .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
                .toList();
        yield right(orders);
      }
    } catch (e) {
      yield left(ServerFailure('failed to fetch orders'));
    }
  }
}
