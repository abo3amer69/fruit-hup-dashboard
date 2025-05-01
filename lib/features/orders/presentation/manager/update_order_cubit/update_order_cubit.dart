import 'package:bloc/bloc.dart';
import 'package:fruit_hup_dashboard/core/enums/order_enum.dart';
import 'package:fruit_hup_dashboard/features/orders/domain/repos/order_repo.dart';
import 'package:meta/meta.dart';

part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit(this.ordersRepo) : super(UpdateOrderInitial());

  final OrdersRepo ordersRepo;

  Future<void> updateOrder({
    required OrderStatusEnum status,
    required String orderId,
  }) async {
    emit(UpdateOrderLoading());
    final result = await ordersRepo.updateOrder(status: status, orderId: orderId);
    result.fold(
      (f) {
        emit(UpdateOrderFailure(f.message));
      },
      (r) {
        emit(UpdateOrderSuccess());
      },
    );
  }
}
