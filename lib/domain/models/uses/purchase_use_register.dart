import 'dart:convert';

class PurchaseUseRegister {
  PurchaseUseRegister({
    required this.purchaseId,
    required this.useTypeId,
  });

  final int purchaseId;
  final int useTypeId;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "purchase_id": purchaseId,
        "use_type_id": useTypeId,
      };
}
