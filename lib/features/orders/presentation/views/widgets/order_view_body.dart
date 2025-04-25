import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit_hup_dashboard/core/helper_function/get_order_dummy_data.dart';
import 'package:fruit_hup_dashboard/features/orders/presentation/views/widgets/filter_section.dart';
import 'package:fruit_hup_dashboard/features/orders/presentation/views/widgets/order_item.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 24,),
          FilterSection(),
          SizedBox(height: 16,),
          OrderItemWidget(orderModel: getDummyOrder())
        ],
      ),
    );
  }
}
