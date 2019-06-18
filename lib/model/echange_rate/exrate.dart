class Exrate {
  final String currencyCode;
  final String currentName;
  final double buy;
  final double transfer;
  final double sell;

  Exrate(this.currencyCode, this.currentName, this.buy, this.transfer, this.sell);

  Exrate.fromJson(Map<String, dynamic> json)
      : currencyCode = json["CurrencyCode"],
        currentName = json["CurrentName"],
        buy = json["Buy"],
        transfer = json["Transfer"],
        sell = json["Sell"];
}