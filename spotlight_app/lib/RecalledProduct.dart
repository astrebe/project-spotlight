class RecalledProduct {
  String _productName = "";
  String _productDesc = "";
  String _incidents = "";
  String _hazType = "";
  String? _remedy;
  var _recallDate = 0;
  var _units = 0;
  int? _compPhnum;
  int? _compEmail;
  String _soldAt = "";
  String _importers = "";
  String _countryOrigin = "";
  var _recallNum = 0;

  String get getProductName => _productName;

  set setProductName(String productName) => _productName = productName;

  get getProductDesc => _productDesc;

  set setProductDesc(productDesc) => _productDesc = productDesc;

  get getIncidents => _incidents;

  set setIncidents(incidents) => _incidents = incidents;

  get getHazType => _hazType;

  set setHazType(hazType) => _hazType = hazType;

  get getRemedy => _remedy;

  set setRemedy(remedy) => _remedy = remedy;

  get getRecallDate => _recallDate;

  set setRecallDate(recallDate) => _recallDate = recallDate;

  get getUnits => _units;

  set setUnits(units) => _units = units;

  get getCompPhnum => _compPhnum;

  set setCompPhnum(compPhnum) => _compPhnum = compPhnum;

  get getCompEmail => _compEmail;

  set setCompEmail(compEmail) => _compEmail = compEmail;

  get getSoldAt => _soldAt;

  set setSoldAt(soldAt) => _soldAt = soldAt;

  get getImporters => _importers;

  set setImporters(importers) => _importers = importers;

  get getCountryOrigin => _countryOrigin;

  set setCountryOrigin(countryOrigin) => _countryOrigin = countryOrigin;

  get getRecallNum => _recallNum;

  set setRecallNum(recallNum) => _recallNum = recallNum;
}
