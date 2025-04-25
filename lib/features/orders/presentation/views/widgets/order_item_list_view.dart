import 'package:flutter/material.dart';
import 'package:fruit_hup_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruit_hup_dashboard/features/orders/presentation/views/widgets/order_item.dart';

class OrderItemListView extends StatelessWidget {
  const OrderItemListView({super.key, required this.orderModel});

  final List<OrderModel> orderModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderModel.length,
      itemBuilder: (context, index) {
        return OrderItemWidget(orderModel: orderModel[index]);
      },
    );
  }
}
