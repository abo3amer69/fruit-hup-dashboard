import 'package:fruit_hup_dashboard/features/orders/data/models/order_product_model.dart';
import 'package:fruit_hup_dashboard/features/orders/data/models/shipping_adress_model.dart';
import 'package:fruit_hup_dashboard/features/orders/domain/entities/order_product_entity.dart';
import 'package:fruit_hup_dashboard/features/orders/domain/entities/shipping_adress_entity.dart';

class OrderEntity {
  final double totalPrice;
  final String uId;
  final ShippingAdressEntity shippingAdressModel;
  final List<OrderProductEntity> orderProduct;
  final String paymentMethod;

  OrderEntity({
    required this.totalPrice,
    required this.uId,
    required this.shippingAdressModel,
    required this.orderProduct,
    required this.paymentMethod,
  });

}
