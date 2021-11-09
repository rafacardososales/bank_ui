class TransactionModel {
  String? name;
  String? photo;
  String? date;
  String? amount;

  TransactionModel(this.name, this.photo, this.date, this.amount);
}

List<TransactionModel> transactions = transactionData
    .map((item) => TransactionModel(
    item['name'], item['photo'], item['date'], item['amount']))
    .toList();

var transactionData = [
  {
    'name': 'Uber Ride',
    'photo': 'assets/images/uberLogo.png',
    'date': '1st OCT 2021',
    'amount': '-\$35.214'
  },
  {
    'name': 'Adidas Outlet',
    'photo': 'assets/images/adidasLogo.png',
    'date': '25th SEP 2021',
    'amount': '-\$100.00'
  },
  {
    'name': 'Payment Received',
    'photo': 'assets/images/userPhotoo.png',
    'date': '15th AUG 2021',
    'amount': '+\$250.00'
  }
];