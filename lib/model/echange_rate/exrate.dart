class Exrate {
  final String currencyCode;
  final String currentName;
  final String buy;
  final String transfer;
  final String sell;

  Exrate(
      this.currencyCode, this.currentName, this.buy, this.transfer, this.sell);

  Exrate.fromJson(Map<String, dynamic> json)
      : currencyCode = json["CurrencyCode"],
        currentName = json["CurrentName"],
        buy = json["Buy"],
        transfer = json["Transfer"],
        sell = json["Sell"];
}
