import 'package:deema_sdk/services/purchase_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/purchase_request.dart';
import 'purchase_state.dart';

class PurchaseCubit extends Cubit<PurchaseState> {

  PurchaseCubit(this.purchaseService) : super(PurchaseInitial());

  final PurchaseService purchaseService;

  Future<void> createPurchase(PurchaseRequest request) async {
    emit(PurchaseLoading());
    try {
      final response = await purchaseService.createPurchase(request);
      emit(PurchaseSuccess(response));
    } catch (e) {
      emit(PurchaseFailure(e.toString()));
    }
  }
}
