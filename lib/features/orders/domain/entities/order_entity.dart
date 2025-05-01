import 'package:fruit_hup_dashboard/core/enums/order_enum.dart';
import 'package:fruit_hup_dashboard/features/orders/domain/entities/order_product_entity.dart';
import 'package:fruit_hup_dashboard/features/orders/domain/entities/shipping_adress_entity.dart';

class OrderEntity {
  final double totalPrice;
  final String uId;
  final ShippingAdressEntity shippingAdressModel;
  final List<OrderProductEntity> orderProduct;
  final String paymentMethod;
  final OrderStatusEnum status;
  final String orderID;

  OrderEntity({
    required this.totalPrice,
    required this.orderID,
    required this.status,
    required this.uId,
    required this.shippingAdressModel,
    required this.orderProduct,
    required this.paymentMethod,
  });
}
