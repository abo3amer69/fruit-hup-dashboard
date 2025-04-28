import 'package:fruit_hup_dashboard/features/orders/data/models/order_product_model.dart';
import 'package:fruit_hup_dashboard/features/orders/data/models/shipping_adress_model.dart';
import 'package:fruit_hup_dashboard/features/orders/domain/entities/order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAdressModel shippingAdressModel;
  final List<OrderProductModel> orderProduct;
  final String paymentMethod;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.shippingAdressModel,
    required this.orderProduct,
    required this.paymentMethod,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      totalPrice: json['totalPrice'],
      uId: json['uId'],
      shippingAdressModel: ShippingAdressModel.fromJson(
        json['shippingAdressModel'],
      ),
      orderProduct:
          json['orderProduct']
              .map((e) => OrderProductModel.fromJson(e))
              .toList(),
      paymentMethod: json['paymentMethod'],
    );
  }

  toJson() => {
    'totalPrice': totalPrice,
    'uId': uId,
    'status': 'pending',
    'date': DateTime.now().toString(),
    'shippingAdressModel': shippingAdressModel.toJson(),
    'orderProduct': orderProduct.map((e) => e.toJson()).toList(),
    'paymentMethod': paymentMethod,
  };

  toEntity() => OrderEntity(
    totalPrice: totalPrice,
    uId: uId,
    shippingAdressModel: shippingAdressModel.toEntity(),
    orderProduct: orderProduct.map((e) => e.toEntity()).toList(),
    paymentMethod: paymentMethod,
  );
}
