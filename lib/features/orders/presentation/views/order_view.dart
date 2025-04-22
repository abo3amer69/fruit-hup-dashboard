import 'package:flutter/material.dart';
import 'package:fruit_hup_dashboard/features/orders/presentation/views/widgets/order_view_body.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  static const  routeName = 'order';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OrderViewBody());
  }
}
