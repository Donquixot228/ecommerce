import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/repositories/category/category_repository.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryInitial()) {
    on<LoadCategories>(_LoadCategoriesToState);
    on<UpdateCategories>(_UpdateCategoriesToState);

  }

  Future<void> _LoadCategoriesToState(
      LoadCategories event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    try {
      await _categoryRepository.getAllCategories().listen(
            (categories) => add(
             UpdateCategories(categories: categories),
            ),
          );
      //emit(CategoryLoaded());
    } catch (_) {}
  }

  Future<void> _UpdateCategoriesToState(
      UpdateCategories event, Emitter<CategoryState> emit) async{
   // emit(CategoryLoaded());
    try{
      emit( CategoryLoaded(categories: event.categories));
    }catch(_){}
  }


}
