import 'package:fruit_hup_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruit_hup_dashboard/features/orders/data/models/order_product_model.dart';
import 'package:fruit_hup_dashboard/features/orders/data/models/shipping_adress_model.dart';

OrderModel getDummyOrder() {
  ShippingAdressModel shippingAdress = ShippingAdressModel(
    name: 'John Doe',
    phone: '123-456-7890',
    adress: '123 Main St',
    floor: '5',
    city: 'New York',
    email: '4M6oX@example.com',
  );

  List<OrderProductModel> orderProducts = [
    OrderProductModel(
      name: 'Apple',
      code: 'A123',
      imageUrl: 'https://example.com/apple.jpg',
      price: 1.99,
      quantity: 2,
    ),
    OrderProductModel(
      name: 'Banana',
      code: 'B456',
      imageUrl: 'https://example.com/banana.jpg',
      price: 2.99,
      quantity: 1,
    ),
    OrderProductModel(
      name: 'Orange',
      code: 'O789',
      imageUrl: 'https://example.com/orange.jpg',
      price: 1.49,
      quantity: 3,
    ),
  ];
  double totalPrice = orderProducts.fold(
    0,
    (sum, product) => sum + (product.price * product.quantity),
  );
  return OrderModel(
    totalPrice: totalPrice,
    uId: 'user123',
    shippingAdressModel: shippingAdress,
    orderProduct: orderProducts,
    paymentMethod: 'cash',
  );
}
