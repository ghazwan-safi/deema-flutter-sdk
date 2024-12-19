// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseRequest _$PurchaseRequestFromJson(Map<String, dynamic> json) =>
    PurchaseRequest(
      merchantOrderId: json['merchant_order_id'] as String,
      amount: (json['amount'] as num).toDouble(),
      currencyCode: json['currency_code'] as String,
      subMerchantDetails: json['sub_merchant_details'] == null
          ? null
          : SubMerchantDetails.fromJson(
              json['sub_merchant_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PurchaseRequestToJson(PurchaseRequest instance) =>
    <String, dynamic>{
      'merchant_order_id': instance.merchantOrderId,
      'amount': instance.amount,
      'currency_code': instance.currencyCode,
      'sub_merchant_details': instance.subMerchantDetails,
    };

SubMerchantDetails _$SubMerchantDetailsFromJson(Map<String, dynamic> json) =>
    SubMerchantDetails(
      identifier: json['identifier'] as String,
    );

Map<String, dynamic> _$SubMerchantDetailsToJson(SubMerchantDetails instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
    };
