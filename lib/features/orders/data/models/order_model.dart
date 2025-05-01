import 'package:fruit_hup_dashboard/core/enums/order_enum.dart';
import 'package:fruit_hup_dashboard/features/orders/data/models/order_product_model.dart';
import 'package:fruit_hup_dashboard/features/orders/data/models/shipping_adress_model.dart';
import 'package:fruit_hup_dashboard/features/orders/domain/entities/order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAdressModel shippingAdressModel;
  final List<OrderProductModel> orderProduct;
  final String paymentMethod;
  final String? status;
  final String orderID;

  OrderModel({
    required this.totalPrice,
    required this.status,
    required this.uId,
   required this.orderID,
    required this.shippingAdressModel,
    required this.orderProduct,
    required this.paymentMethod,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      status: json['status'],
      orderID: json['orderId'],
      totalPrice: json['totalPrice'],
      uId: json['uId'],
      shippingAdressModel: ShippingAdressModel.fromJson(
        json['shippingAdressModel'],
      ),
      orderProduct: List<OrderProductModel>.from(
        json['orderProduct'].map((e) => OrderProductModel.fromJson(e)),
      ),

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
    orderID: orderID!,
    totalPrice: totalPrice,
    status: fetchEnum(),
    uId: uId,
    shippingAdressModel: shippingAdressModel.toEntity(),
    orderProduct: orderProduct.map((e) => e.toEntity()).toList(),
    paymentMethod: paymentMethod,
  );

  OrderStatusEnum fetchEnum() {
    return OrderStatusEnum.values.firstWhere((e) {
      var enumStatus = e.name.toString();
      return enumStatus == (status ?? 'pending');
    });
  }
}
