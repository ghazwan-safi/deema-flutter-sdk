import '../models/purchase_response.dart';

abstract class PurchaseState {}

class PurchaseInitial extends PurchaseState {}

class PurchaseLoading extends PurchaseState {}

class PurchaseSuccess extends PurchaseState {
  final PurchaseResponse response;
  PurchaseSuccess(this.response);
}

class PurchaseFailure extends PurchaseState {
  final String error;
  PurchaseFailure(this.error);
}
