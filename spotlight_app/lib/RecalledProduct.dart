class RecalledProduct {
  String productName = "";
  String productDesc = "";
  String incidents = "";
  String hazType = "";
  String? remedy;
  var recallDate = 0;
  var units = 0;
  int? compPhnum;
  int? compEmail;
  String soldAt = "";
  String importers = "";
  String countryOrigin = "";
  var recallNum = 0;
  String get getProductName => productName;

  set setProductName(String productName) => this.productName = productName;

  get getProductDesc => productDesc;

  set setProductDesc( productDesc) => this.productDesc = productDesc;

  get getIncidents => incidents;

  set setIncidents( incidents) => this.incidents = incidents;

  get getHazType => hazType;

  set setHazType( hazType) => this.hazType = hazType;

  get getRemedy => remedy;

  set setRemedy( remedy) => this.remedy = remedy;

  get getRecallDate => recallDate;

  set setRecallDate( recallDate) => this.recallDate = recallDate;

  get getUnits => units;

  set setUnits( units) => this.units = units;

  get getCompPhnum => compPhnum;

  set setCompPhnum( compPhnum) => this.compPhnum = compPhnum;

  get getCompEmail => compEmail;

  set setCompEmail( compEmail) => this.compEmail = compEmail;

  get getSoldAt => soldAt;

  set setSoldAt( soldAt) => this.soldAt = soldAt;

  get getImporters => importers;

  set setImporters( importers) => this.importers = importers;

  get getCountryOrigin => countryOrigin;

  set setCountryOrigin( countryOrigin) => this.countryOrigin = countryOrigin;

  get getRecallNum => recallNum;

  set setRecallNum( recallNum) => this.recallNum = recallNum;
}
