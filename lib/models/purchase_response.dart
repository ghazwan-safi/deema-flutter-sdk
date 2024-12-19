import 'package:json_annotation/json_annotation.dart';

part 'purchase_response.g.dart';

@JsonSerializable()
class PurchaseResponse {
  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'data')
  final PurchaseData data;

  PurchaseResponse({required this.message, required this.data});

  factory PurchaseResponse.fromJson(Map<String, dynamic> json) => _$PurchaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseResponseToJson(this);
}

@JsonSerializable()
class PurchaseData {
  @JsonKey(name: 'purchase_id')
  final int purchaseId;

  @JsonKey(name: 'order_reference')
  final String orderReference;

  @JsonKey(name: 'redirect_link')
  final String redirectLink;

  PurchaseData({
    required this.purchaseId,
    required this.orderReference,
    required this.redirectLink,
  });

  factory PurchaseData.fromJson(Map<String, dynamic> json) => _$PurchaseDataFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseDataToJson(this);
}
