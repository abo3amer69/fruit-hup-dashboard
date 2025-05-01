import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup_dashboard/core/helper_function/build_error_bar.dart';
import 'package:fruit_hup_dashboard/features/orders/presentation/manager/update_order_cubit/update_order_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateOrderBuilder extends StatelessWidget {
  const UpdateOrderBuilder({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateOrderCubit, UpdateOrderState>(
      listener: (context, state) {
        if(state is UpdateOrderSuccess){
          buildBar(context, 'Order updated successfully');
        }
        if(state is UpdateOrderFailure){
          buildBar(context, state.errMessage);
        }
        
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is UpdateOrderLoading,
          child: child,
        );
      },
    );
  }
}
