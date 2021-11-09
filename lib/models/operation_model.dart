class OperationModel {
  String? name;
  String? selectedIcon;
  String? unselectedIcon;

  OperationModel(this.name, this.selectedIcon, this.unselectedIcon);
}

List<OperationModel> datas = operationsData.map((item) =>
    OperationModel(item['name'], item['selectedIcon'], item['unselectedIcon'])).toList();

var operationsData = [
  {
    'name': 'Money\nTransfer',
    'selectedIcon': 'assets/images/transferBlack.png',
    'unselectedIcon': 'assets/images/transferBlack.png'
  },
  {
    'name': 'Bank\nWithdraw',
    'selectedIcon': 'assets/images/withdrawblack.png',
    'unselectedIcon': 'assets/images/withdrawblack.png'
  },
  {
    'name': 'Insight\nTracking',
    'selectedIcon': 'assets/images/trackingBlack.png',
    'unselectedIcon': 'assets/images/trackingBlack.png'
  },
];