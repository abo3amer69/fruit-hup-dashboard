import 'package:fruit_hup_dashboard/core/enums/order_enum.dart';
import 'package:fruit_hup_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruit_hup_dashboard/features/orders/data/models/order_product_model.dart';
import 'package:fruit_hup_dashboard/features/orders/data/models/shipping_adress_model.dart';
import 'package:fruit_hup_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hup_dashboard/features/orders/domain/entities/order_product_entity.dart';
import 'package:fruit_hup_dashboard/features/orders/domain/entities/shipping_adress_entity.dart';

OrderEntity getDummyOrder() {
  ShippingAdressEntity shippingAdress = ShippingAdressEntity(
    name: 'John Doe',
    phone: '123-456-7890',
    adress: '123 Main St',
    floor: '5',
    city: 'New York',
    email: '4M6oX@example.com',
  );

  List<OrderProductEntity> orderProducts = [
    OrderProductEntity(
      name: 'Apple',
      code: 'A123',
      imageUrl:
          'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcT90awoHrzBfmnOsQ4zV_vU1kJmgxJsjALKNdHf4NOXeh0GclY1Wwo1LRWYmwt5y8UUDyL5Cpt1CpIiqhCyxZFPVa9nXbnRZnL5fVuiug',
      price: 1.99,
      quantity: 2,
    ),
    OrderProductEntity(
      name: 'Banana',
      code: 'B456',
      imageUrl:
          'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcT90awoHrzBfmnOsQ4zV_vU1kJmgxJsjALKNdHf4NOXeh0GclY1Wwo1LRWYmwt5y8UUDyL5Cpt1CpIiqhCyxZFPVa9nXbnRZnL5fVuiug',
      price: 2.99,
      quantity: 1,
    ),
    OrderProductEntity(
      name: 'Orange',
      code: 'O789',
      imageUrl:
          'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcT90awoHrzBfmnOsQ4zV_vU1kJmgxJsjALKNdHf4NOXeh0GclY1Wwo1LRWYmwt5y8UUDyL5Cpt1CpIiqhCyxZFPVa9nXbnRZnL5fVuiug',
      price: 1.49,
      quantity: 3,
    ),
  ];
  double totalPrice = orderProducts.fold(
    0,
    (sum, product) => sum + (product.price * product.quantity),
  );
  return OrderEntity(
    status: OrderEnum.pending,
    totalPrice: totalPrice,
    uId: 'user123',
    shippingAdressModel: shippingAdress,
    orderProduct: orderProducts,
    paymentMethod: 'cash',
  );
}
