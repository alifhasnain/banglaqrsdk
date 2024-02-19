class BanglaQrSuccessResponse {
  String? amount;
  String? currentDate;
  String? mcc;
  String? merchantCity;
  String? merchantId;
  String? merchantName;
  String? payload;
  String? storeId;
  String? terminalId;
  String? totalAmount;

  BanglaQrSuccessResponse({
    this.amount,
    this.currentDate,
    this.mcc,
    this.merchantCity,
    this.merchantId,
    this.merchantName,
    this.payload,
    this.storeId,
    this.terminalId,
    this.totalAmount,
  });

  factory BanglaQrSuccessResponse.fromJson(Map<String, dynamic> json) =>
      BanglaQrSuccessResponse(
        amount: json["amount"],
        currentDate: json["currentDate"],
        mcc: json["mcc"],
        merchantCity: json["merchantCity"],
        merchantId: json["merchantID"],
        merchantName: json["merchantName"],
        payload: json["payload"],
        storeId: json["storeId"],
        terminalId: json["terminalId"],
        totalAmount: json["totalAmount"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "currentDate": currentDate,
        "mcc": mcc,
        "merchantCity": merchantCity,
        "merchantID": merchantId,
        "merchantName": merchantName,
        "payload": payload,
        "storeId": storeId,
        "terminalId": terminalId,
        "totalAmount": totalAmount,
      };
}
