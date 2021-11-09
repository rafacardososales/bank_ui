
class CardModel {
  String? user;
  String? cardNumber;
  String? cardExpired;
  String? cardType;
  int? cardBackground;
  String? cardElementTop;
  String? cardElementBottom;

  CardModel(this.user, this.cardNumber, this.cardExpired, this.cardType,
      this.cardBackground, this.cardElementTop, this.cardElementBottom);
}

List<CardModel> cards = cardData.map(
      (item) => CardModel(
    item['user'] as String,
    item['cardNumber'] as String,
    item['cardExpired'] as String,
    item['cardType'] as String,
    item['cardBackground'] as int,
    item['cardElementTop'] as String,
    item['cardElementBottom'] as String,
  ),
).toList();

var cardData = [
  {
    'user': 'Rafael Sales',
    'cardNumber': '**** **** **** 1720',
    'cardExpired': '03-01-2023',
    'cardType': 'assets/images/visa.png',
    'cardBackground': 0xFFd1f0ff,
    'cardElementTop': 'assets/images/ellipseRosa.png',
    'cardElementBottom': 'assets/images/ellipseRosa.png'
  },
  {
    'user': 'Rafael Sales',
    'cardNumber': '**** **** **** 7542',
    'cardExpired': '03-01-2025',
    'cardType': 'assets/images/visa.png',
    'cardBackground': 0xFFada397,
    'cardElementTop': 'assets/images/ellipseAzul.png',
    'cardElementBottom': 'assets/images/ellipseAzul.png'
  }
];