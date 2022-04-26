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

List<RecalledProduct> getTestData() {
  List<RecalledProduct> testData = <RecalledProduct>[];
  RecalledProduct t1 = RecalledProduct(
      "Overhead Garage Storage Racks",
      "This recall involves SafeRacks/Monsterrax Overhead Garage Storage Racks. The industrial-strength steel racks, which attach to the ceiling and are height-adjustable, come in  seven sizes including: 4 ft. by 4 ft., 4 ft. by 8 ft., 2 ft. by 6 ft., 3 ft. by 6 ft., 4 ft. by 6 ft., 3 ft. by 8 ft., and 2 ft. by 8 ft. The storage racks also were sold in two colors, hammertone (gray) or  white.",
      "SafeRacks/Monsterrax has received 55 reports of the racks falling, including one report of an injury where the corners of a ceiling mounted rack fell and bruised and cut a consumer’s face.",
      "The hex bolts in the overhead garage storage racks can be defective, causing the rack to collapse from the ceiling, posing an impact injury hazard.",
      "Consumers with the recalled Overhead Garage Storage Racks should immediately unload all items from the racks and contact SafeRacks/Monsterrax to receive free replacement bolts. SafeRacks/Monsterrax has contacted all known purchasers of the Overhead Garage Storage Racks to provide free replacement bolts.",
      "April 21, 2022",
      12800,
      8779272168,
      "consumersupport@saferacks.com",
      "Online at Costco.com, amazon.com, saferacks.com, monsterrax.com and other websites from September 2021 through December 2021 for about \$140.",
      "Eagle Industrial Group Inc., of Rancho Santa Margarita, California",
      "Vietnam",
      22742,
      "images/storagerack.png");

  RecalledProduct t2 = RecalledProduct(
      "Monti Kids Wooden Push Toys",
      "This recall involves Push Toys which are included with the Level 7 of the Monti Kids Program subscription box. The Push Toy consists of a wooden handle attached to a rolling cylinder, which contains wooden balls. The lot numbers 0D41 and 1A41, “Montessori designs, Ethically Made in Vietnam, and ASTM CPSIA Safety Certified,” are printed on the underside of the handle, facing the rolling cylinder.",
      "Monti Kids has received 145 reports of the toy’s rolling cylinder separating.  No injuries have been reported.",
      "The toy’s rolling cylinder can separate, exposing the balls inside, posing a choking hazard to children.",
      "Consumers should immediately take the recalled toy away from children, dispose of the toy by throwing it into the trash, and contact Monti Kids to receive a \$40 refund. The firm is contacting all known purchasers directly.",
      "April 21, 2022",
      1375,
      8006743845,
      "customercare@montikids.com",
      "Online at Montikids.com from April 2021 through January 2022 as one item in the level 7 Monti Kids Program subscription box for about \$300.",
      "Monti Kids Inc., of Orinda, California",
      "Vietnam",
      22741,
      "images/woodenkidtoy.png");

  RecalledProduct t3 = RecalledProduct(
      "Nectar® Premier Mattresses",
      """This recall involves certain Nectar Premier Mattresses manufactured on two specific dates:  
    King size: manufactured on 9/24/2021; and 
    Queen size: manufactured on 9/27/2021.
    The recalled mattresses have a white poly-blend top cover with black side panels and a vertical purple sash, and the foot of the mattresses is marked with the large (13” long, 2” tall) 
    embroidered “nectar” logo and the word “Nectar” imprinted in white, and also have the date of manufacture on the white tag. 
    Elite Comfort Solutions, the date of manufacture in MM/DD/YY format (9/24/21 for king mattresses or 9/27/21 for queen mattresses), the model number, 
    CHILL and “Prototype ID:ECS2003RHCH” can be found on the bottom portion of the white tag which is located at the head of the mattress.""",
      "None reported",
      "The recalled mattresses failed to meet the mandatory federal flammability standard for mattresses, posing a fire hazard.",
      "Consumers should contact Nectar Sleep for a free replacement mattress (including free delivery) or a full refund, to be provided after free removal and disposal of the recalled mattress through Elite Comfort Solutions. Nectar Sleep is contacting all known purchasers directly.",
      "April 21, 2022",
      700,
      8552314633,
      "assistance@nectarsleep.com",
      "www.nectarsleep.com from July 2021 through September 2021 for between \$1,300 and \$1,600.",
      "Elite Comfort Solutions LLC, of Newnan, Georgia",
      "United States",
      22740,
      "images/mattress.png");

  RecalledProduct t4 = RecalledProduct(
      "Overhead Garage Storage Racks",
      "This recall involves SafeRacks/Monsterrax Overhead Garage Storage Racks. The industrial-strength steel racks, which attach to the ceiling and are height-adjustable, come in  seven sizes including: 4 ft. by 4 ft., 4 ft. by 8 ft., 2 ft. by 6 ft., 3 ft. by 6 ft., 4 ft. by 6 ft., 3 ft. by 8 ft., and 2 ft. by 8 ft. The storage racks also were sold in two colors, hammertone (gray) or  white.",
      "SafeRacks/Monsterrax has received 55 reports of the racks falling, including one report of an injury where the corners of a ceiling mounted rack fell and bruised and cut a consumer’s face.",
      "The hex bolts in the overhead garage storage racks can be defective, causing the rack to collapse from the ceiling, posing an impact injury hazard.",
      "Consumers with the recalled Overhead Garage Storage Racks should immediately unload all items from the racks and contact SafeRacks/Monsterrax to receive free replacement bolts. SafeRacks/Monsterrax has contacted all known purchasers of the Overhead Garage Storage Racks to provide free replacement bolts.",
      "April 21, 2022",
      12800,
      8779272168,
      "consumersupport@saferacks.com",
      "Online at Costco.com, amazon.com, saferacks.com, monsterrax.com and other websites from September 2021 through December 2021 for about \$140.",
      "Eagle Industrial Group Inc., of Rancho Santa Margarita, California",
      "Vietnam",
      22742,
      "images/storagerack.png");
  RecalledProduct t5 = RecalledProduct(
      "Overhead Garage Storage Racks",
      "This recall involves SafeRacks/Monsterrax Overhead Garage Storage Racks. The industrial-strength steel racks, which attach to the ceiling and are height-adjustable, come in  seven sizes including: 4 ft. by 4 ft., 4 ft. by 8 ft., 2 ft. by 6 ft., 3 ft. by 6 ft., 4 ft. by 6 ft., 3 ft. by 8 ft., and 2 ft. by 8 ft. The storage racks also were sold in two colors, hammertone (gray) or  white.",
      "SafeRacks/Monsterrax has received 55 reports of the racks falling, including one report of an injury where the corners of a ceiling mounted rack fell and bruised and cut a consumer’s face.",
      "The hex bolts in the overhead garage storage racks can be defective, causing the rack to collapse from the ceiling, posing an impact injury hazard.",
      "Consumers with the recalled Overhead Garage Storage Racks should immediately unload all items from the racks and contact SafeRacks/Monsterrax to receive free replacement bolts. SafeRacks/Monsterrax has contacted all known purchasers of the Overhead Garage Storage Racks to provide free replacement bolts.",
      "April 21, 2022",
      12800,
      8779272168,
      "consumersupport@saferacks.com",
      "Online at Costco.com, amazon.com, saferacks.com, monsterrax.com and other websites from September 2021 through December 2021 for about \$140.",
      "Eagle Industrial Group Inc., of Rancho Santa Margarita, California",
      "Vietnam",
      22742,
      "images/storagerack.png");

  testData.add(t1);
  testData.add(t2);
  testData.add(t3);
  testData.add(t4);
  testData.add(t5);
  testData.add(t1);
  testData.add(t2);
  testData.add(t3);
  testData.add(t4);
  testData.add(t5);

  return testData;
}
