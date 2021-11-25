
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

//EQUATABLE Если 2 объекта одного класса  и нужно их стравнить (==)
// props проверяет по определенным параметрам
//позволяет делать конструктор const

class Category extends Equatable {
  final String name;
  final String imaheUrl;

  const Category({
    required this.name,
    required this.imaheUrl,
  });



  @override
  List<Object?> get props => [
        name,
        imaheUrl,
      ];


  static Category fromSnapshot(DocumentSnapshot snap){
    Category category= Category(name: snap['name'], imaheUrl: snap['imageUrl']);
    return category;
  }



  static List<Category> categories = [
    Category(
      name: 'Pullover',
      imaheUrl: 'https://assets.supremenewyork.com/216951/ma/FyvHihh0OTg.jpg',
    ),
    Category(
      name: 'Sweatshirt',
      imaheUrl: 'https://assets.supremenewyork.com/219582/ma/NUIBEOiNxUE.jpg',
    ),
    Category(
      name: 'Jacket',
      imaheUrl: 'https://assets.supremenewyork.com/216730/ma/BWk4wj_mZec.jpg',
    ),
    Category(
      name: 'Pants',
      imaheUrl: 'https://assets.supremenewyork.com/217414/ma/GGOI0HGGt2w.jpg',
    ),
  ];
}
