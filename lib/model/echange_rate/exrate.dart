class Exrate {
  final String currencyCode;
  final String currentName;
  final double buy;
  final double transfer;
  final double sell;

  Exrate(
      this.currencyCode, this.currentName, this.buy, this.transfer, this.sell);

  Exrate.fromJson(Map<String, dynamic> json)
      : currencyCode = json["CurrencyCode"],
        currentName = json["CurrentName"],
        buy = double.parse(json["Buy"]),
        transfer = double.parse(json["Transfer"]),
        sell = double.parse(json["Sell"]);
}
