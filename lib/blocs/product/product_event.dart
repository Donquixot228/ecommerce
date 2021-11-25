part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class LoadCProducts extends ProductEvent {
  @override
  List<Object?> get props => [];
}

class UpdateProducts extends ProductEvent {
  final List<Product> products;

  UpdateProducts({required this.products});

  @override
  List<Object?> get props => [products];
}
