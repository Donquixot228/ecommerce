import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/checkout_model.dart';
import 'package:ecommerce/repositories/checkout_repository/base_checkout_repository.dart';

class CheckoutRepository extends BaseCheckOutRepository {
  final FirebaseFirestore _firebaseFirestore;

  CheckoutRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> addCheckout(Checkout checkout) {
    return _firebaseFirestore.collection('checkout').add(checkout.toDocument());
  }


}