import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final num price;
  final bool isNew;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isNew,
    required this.isRecommended,
    required this.isPopular,
  });

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      name: snap['name'],
      imageUrl: snap['imageUrl'],
      category: snap['category'],
      isNew: snap['isNew'],
      isPopular: snap['isPopular'],
      isRecommended: snap['isRecommended'],
      price: snap['price'],
    );
    return product;
  }

  static List<Product> products = [
    const Product(
      name: 'Chino Pant Butterflies',
      category: 'Pants',
      imageUrl: 'https://assets.supremenewyork.com/217414/ma/GGOI0HGGt2w.jpg',
      price: 148.0,
      isNew: true,
      isPopular: true,
      isRecommended: true,
    ),
    const Product(
      name: 'Chino Pant Black',
      category: 'Pants',
      imageUrl: 'https://assets.supremenewyork.com/217412/ma/9wU8Gl-LaRw.jpg',
      price: 148.0,
      isNew: false,
      isPopular: false,
      isRecommended: true,
    ),
    const Product(
      name: 'Chino Pant Navy',
      category: 'Pants',
      imageUrl: 'https://assets.supremenewyork.com/217415/ma/gUqHVRRJJjI.jpg',
      price: 148.0,
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
    const Product(
      name: ' Sweatshirt Natural',
      category: 'Sweatshirt',
      imageUrl: 'https://assets.supremenewyork.com/219580/ma/1Y5t90YSwFo.jpg',
      price: 178,
      isNew: true,
      isPopular: true,
      isRecommended: false,
    ),
    const Product(
      name: ' Sweatshirt Black',
      category: 'Sweatshirt',
      imageUrl: 'https://assets.supremenewyork.com/219584/ma/rMnb3arJ-kE.jpg',
      price: 178,
      isNew: true,
      isPopular: false,
      isRecommended: false,
    ),
    const Product(
      name: 'Corduroy Jacket Blue',
      category: 'Jacket',
      imageUrl: 'https://assets.supremenewyork.com/216730/ma/BWk4wj_mZec.jpg',
      price: 178,
      isNew: true,
      isPopular: true,
      isRecommended: true,
    ),
    const Product(
      name: 'Corduroy Jacket Black',
      category: 'Jacket',
      imageUrl: 'https://assets.supremenewyork.com/216727/ma/sKko6LMoG4o.jpg',
      price: 178,
      isNew: true,
      isPopular: false,
      isRecommended: false,
    ),
    const Product(
      name: 'Corduroy Jacket Yellow',
      category: 'Jacket',
      imageUrl: 'https://assets.supremenewyork.com/216733/ma/V11EKZGYVKY.jpg',
      price: 178,
      isNew: true,
      isPopular: true,
      isRecommended: false,
    ),
    const Product(
      name: 'Pullover Leaopard',
      category: 'Pullover',
      imageUrl: 'https://assets.supremenewyork.com/216951/ma/FyvHihh0OTg.jpg',
      price: 238,
      isNew: true,
      isPopular: false,
      isRecommended: false,
    ),
    const Product(
      name: 'Pullover Pink',
      category: 'Pullover',
      imageUrl: 'https://assets.supremenewyork.com/216954/ma/nFGh9FzY6Ws.jpg',
      price: 238,
      isNew: true,
      isPopular: false,
      isRecommended: false,
    ),
    const Product(
      name: 'Pullover Teal',
      category: 'Pullover',
      imageUrl: 'https://assets.supremenewyork.com/216957/ma/5QVpI7RTrP0.jpg',
      price: 238,
      isNew: true,
      isPopular: true,
      isRecommended: false,
    ),
    const Product(
      name: 'Pullover Orange',
      category: 'Pullover',
      imageUrl: 'https://assets.supremenewyork.com/216948/ma/Iy_SA5tVocw.jpg',
      price: 238,
      isNew: true,
      isPopular: true,
      isRecommended: false,
    ),
    const Product(
      name: 'Pullover Black',
      category: 'Pullover',
      imageUrl: 'https://assets.supremenewyork.com/216945/ma/JJSoHNffPD4.jpg',
      price: 238,
      isNew: true,
      isPopular: false,
      isRecommended: false,
    ),
  ];

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        category,
        imageUrl,
        price,
        isRecommended,
        isPopular,
      ];
}
