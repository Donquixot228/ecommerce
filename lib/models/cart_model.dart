import 'package:equatable/equatable.dart';

import 'product_model.dart';

class Cart extends Equatable{
Cart();

double get subtotal => products.fold(0,(total,current) => total + current.price);

double deliveryFee(subtotal){
  if(subtotal >= 200.0){
    return 0.0;
  }else
    return 10.0;
}

double total(subtotal,deliveryFee){
  return subtotal+deliveryFee(subtotal);
}



String freeDelivery(subtotal){
  if(subtotal >= 200.0){
    return 'You have Free Delivery';
  }else{
    double missing = 200.0 -subtotal;
    return 'Add \$${missing.toStringAsFixed(2)} for FREE delivery';
  }
}
String get subtotalString => subtotal.toStringAsFixed(2);
String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
String get freeDeliveryFeeString =>freeDelivery(subtotal);
String get totalString => total(subtotal,deliveryFee).toStringAsFixed(2);

List<Product> products= [

  const Product(
    name: 'Chino Pant Black',
    category: 'Pants',
    imageUrl: 'https://assets.supremenewyork.com/217412/ma/9wU8Gl-LaRw.jpg',
    price: 148,
    isNew: false,
    isPopular: false,
    isRecommended: true,
  ),
  const Product(
    name: 'Chino Pant Navy',
    category: 'Pants',
    imageUrl: 'https://assets.supremenewyork.com/217415/ma/gUqHVRRJJjI.jpg',
    price: 148,
    isNew: false,
    isPopular: true,
    isRecommended: true,
  ),
  const Product(
    name: 'Chino Pant Navy',
    category: 'Pants',
    imageUrl: 'https://assets.supremenewyork.com/217415/ma/gUqHVRRJJjI.jpg',
    price: 148,
    isNew: false,
    isPopular: true,
    isRecommended: true,
  ),
  const Product(
    name: 'Chino Pant Brown',
    category: 'Pants',
    imageUrl: 'https://assets.supremenewyork.com/217413/ma/Aj2eKVSBb2s.jpg',
    price: 148,
    isNew: false,
    isPopular: false,
    isRecommended: false,

  ),
  const Product(
    name: ' Sweatshirt Yellow',
    category: 'Sweatshirt',
    imageUrl: 'https://assets.supremenewyork.com/219582/ma/NUIBEOiNxUE.jpg',
    price: 178,
    isNew: true,
    isPopular: true,
    isRecommended: true,
  ),
  const Product(
    name: ' Sweatshirt Grey',
    category: 'Sweatshirt',
    imageUrl: 'https://assets.supremenewyork.com/219587/ma/pcs5MO-GySY.jpg',
    price: 178,
    isNew: false,
    isPopular: false,
    isRecommended: false,
  ),
  const Product(
    name: ' Sweatshirt Cayan',
    category: 'Sweatshirt',
    imageUrl: 'https://assets.supremenewyork.com/219593/ma/a9_zz4xr76Y.jpg',
    price: 178,
    isNew: true,
    isPopular: true,
    isRecommended: false,
  ),
] ;













  @override
  List<Object?> get props =>[];
}