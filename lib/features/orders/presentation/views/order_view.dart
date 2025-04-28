import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup_dashboard/core/helper_function/get_order_dummy_data.dart';
import 'package:fruit_hup_dashboard/core/services/get_it_services.dart';
import 'package:fruit_hup_dashboard/features/orders/domain/repos/order_repo.dart';
import 'package:fruit_hup_dashboard/features/orders/presentation/manager/fetch_orders_cubit/fetch_orders_cubit.dart';
import 'package:fruit_hup_dashboard/features/orders/presentation/views/widgets/order_view_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  static const routeName = 'order';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchOrdersCubit(getIt.get<OrdersRepo>()),
      child: Scaffold(
        appBar: AppBar(title: Text('Orders')),
        body: OrderViewBodyBuilder(),
      ),
    );
  }
}

class OrderViewBodyBuilder extends StatefulWidget {
  const OrderViewBodyBuilder({super.key});

  @override
  State<OrderViewBodyBuilder> createState() => _OrderViewBodyBuilderState();
}

class _OrderViewBodyBuilderState extends State<OrderViewBodyBuilder> {
  @override
  void initState() {
    context.read<FetchOrdersCubit>().fetchOrders();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOrdersCubit, FetchOrdersState>(
      builder: (context, state) {
        if (state is FetchOrdersSuccess) {
          return OrderViewBody(orders: state.orders);
        } else if (state is FetchOrdersFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return Skeletonizer(
            child: OrderViewBody(orders: [getDummyOrder(), getDummyOrder()]),
          );
        }
      },
    );
  }
}
