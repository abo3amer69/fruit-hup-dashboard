import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup_dashboard/core/services/get_it_services.dart';
import 'package:fruit_hup_dashboard/features/orders/domain/repos/order_repo.dart';
import 'package:fruit_hup_dashboard/features/orders/presentation/manager/fetch_orders_cubit/fetch_orders_cubit.dart';
import 'package:fruit_hup_dashboard/features/orders/presentation/views/widgets/order_view_body.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  static const routeName = 'order';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchOrdersCubit(getIt.get<OrdersRepo>()),
      child: Scaffold(
        appBar: AppBar(title: Text('Orders')),
        body: OrderViewBody(),
      ),
    );
  }
}
