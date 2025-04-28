

import 'package:fruit_hup_dashboard/features/orders/domain/entities/shipping_adress_entity.dart';

class ShippingAdressModel {
  String? name;
  String? phone;
  String? adress;
  String? city;
  String? email;

  String? floor;

  ShippingAdressModel({
    this.name,
    this.phone,
    this.adress,
    this.floor,
    this.city,
    this.email,
  });
 

  @override
  String toString() {
    return '$adress, $floor, $city';
  }

  factory ShippingAdressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAdressModel(
      name: json['name'],
      phone: json['phone'],
      adress: json['adress'],
      floor: json['floor'],
      city: json['city'],
      email: json['email'],
    );
  }
  toJson() {
    return {
      'name': name,
      'phone': phone,
      'adress': adress,
      'floor': floor,
      'city': city,
      'email': email,
    };
  }

  toEntity(){
    return ShippingAdressEntity(
      name: name,
      phone: phone,
      adress: adress,
      floor: floor,
      city: city,
      email: email,
    );
  }
}
