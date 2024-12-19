// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseResponse _$PurchaseResponseFromJson(Map<String, dynamic> json) =>
    PurchaseResponse(
      message: json['message'] as String,
      data: PurchaseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PurchaseResponseToJson(PurchaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

PurchaseData _$PurchaseDataFromJson(Map<String, dynamic> json) => PurchaseData(
      purchaseId: (json['purchase_id'] as num).toInt(),
      orderReference: json['order_reference'] as String,
      redirectLink: json['redirect_link'] as String,
    );

Map<String, dynamic> _$PurchaseDataToJson(PurchaseData instance) =>
    <String, dynamic>{
      'purchase_id': instance.purchaseId,
      'order_reference': instance.orderReference,
      'redirect_link': instance.redirectLink,
    };
