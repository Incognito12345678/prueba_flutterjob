//modelo de datos: se crea una clase que represente los datos
//que se van a recibir de la API.
// serializable para poder mapear los datos de la respuesta de la API.
class Crypto {
  final String symbol;
  final String name;
  final String priceUsd;
  final String percentChange24h;
  final String id;
  final String nameid;
  final int rank;
  final String percentChange1h;
  final String percentChange7d;
  final String priceBtc;
  final String marketCapUsd;
  final double volume24;
  final double volume24a;
  final String csupply;
  final String? tsupply;
  final String? msupply;

  Crypto({
    required this.symbol,
    required this.name,
    required this.priceUsd,
    required this.percentChange24h,
    required this.nameid,
    required this.rank,
    required this.id,
    required this.percentChange1h,
    required this.percentChange7d,
    required this.priceBtc,
    required this.marketCapUsd,
    required this.volume24,
    required this.volume24a,
    required this.csupply,
    required this.tsupply,
    required this.msupply,
  });

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      id: json["id"],
      symbol: json["symbol"],
      name: json["name"],
      nameid: json["nameid"],
      rank: json["rank"],
      priceUsd: json["price_usd"],
      percentChange24h: json["percent_change_24h"],
      percentChange1h: json["percent_change_1h"],
      percentChange7d: json["percent_change_7d"],
      priceBtc: json["price_btc"],
      marketCapUsd: json["market_cap_usd"],
      volume24: json["volume24"]?.toDouble(),
      volume24a: json["volume24a"]?.toDouble(),
      csupply: json["csupply"],
      tsupply: json["tsupply"],
      msupply: json["msupply"],
    );
  }
}
