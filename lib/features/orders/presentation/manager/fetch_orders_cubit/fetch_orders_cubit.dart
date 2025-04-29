import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fruit_hup_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hup_dashboard/features/orders/domain/repos/order_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_orders_state.dart';

class FetchOrdersCubit extends Cubit<FetchOrdersState> {
  FetchOrdersCubit(this.ordersRepo) : super(FetchOrdersInitial());
  final OrdersRepo ordersRepo;

  StreamSubscription? _streamsubscription;

  void fetchOrders() async {
    emit(FetchOrdersLoading());
    _streamsubscription = ordersRepo.fetchOrders().listen((result) {
      result.fold(
        (f) {
          emit(FetchOrdersFailure(f.message));
        },
        (r) {
          emit(FetchOrdersSuccess(orders: r));
        },
      );
    });
  }

  @override
  Future<void> close() {
    _streamsubscription?.cancel();
    return super.close();
  }
}
