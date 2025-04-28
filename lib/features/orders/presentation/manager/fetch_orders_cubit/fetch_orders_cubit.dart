import 'package:bloc/bloc.dart';
import 'package:fruit_hup_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hup_dashboard/features/orders/domain/repos/order_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_orders_state.dart';

class FetchOrdersCubit extends Cubit<FetchOrdersState> {
  FetchOrdersCubit(this.ordersRepo) : super(FetchOrdersInitial());
  final OrdersRepo ordersRepo;

  Future<void> fetchOrders() async {
    emit(FetchOrdersLoading());
    final failureOrders = await ordersRepo.fetchOrders();
    failureOrders.fold(
      (failure) => emit(FetchOrdersFailure(failure.message)),
      (orders) => emit(FetchOrdersSuccess(orders: orders)),
    );
  }
}
