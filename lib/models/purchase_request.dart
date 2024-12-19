import 'package:json_annotation/json_annotation.dart';

part 'purchase_request.g.dart';

@JsonSerializable()
class PurchaseRequest {
  @JsonKey(name: 'merchant_order_id')
  final String merchantOrderId;

  @JsonKey(name: 'amount')
  final double amount;

  @JsonKey(name: 'currency_code')
  final String currencyCode;

  @JsonKey(name: 'sub_merchant_details')
  final SubMerchantDetails? subMerchantDetails;

  PurchaseRequest({
    required this.merchantOrderId,
    required this.amount,
    required this.currencyCode,
    this.subMerchantDetails,
  });

  factory PurchaseRequest.fromJson(Map<String, dynamic> json) => _$PurchaseRequestFromJson(json);
  Map<String, dynamic> toJson() => _$PurchaseRequestToJson(this);
}


@JsonSerializable()
class SubMerchantDetails {
  @JsonKey(name: 'identifier')
  final String identifier;

  SubMerchantDetails({required this.identifier});

  factory SubMerchantDetails.fromJson(Map<String, dynamic> json) => _$SubMerchantDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$SubMerchantDetailsToJson(this);
}
