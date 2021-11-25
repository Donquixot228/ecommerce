import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/repositories/product/product_repository.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductInitial()) {
    on<LoadCProducts>(_LoadProductsToState);
    on<UpdateProducts>(_UpdateProductsToState);
  }

  Future<void> _LoadProductsToState(
      LoadCProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      await _productRepository.getAllProducts().listen(
            (products) => add(
              UpdateProducts(products: products),
            ),
          );
      //emit(CategoryLoaded());
    } catch (_) {}
  }

  Future<void> _UpdateProductsToState(
      UpdateProducts event, Emitter<ProductState> emit) async {
    // emit(CategoryLoaded());
    try {
      emit(ProductLoaded(products: event.products));
    } catch (_) {}
  }
}
