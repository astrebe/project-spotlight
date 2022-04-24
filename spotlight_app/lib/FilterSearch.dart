import 'RecalledProduct.dart';

/* This class will behave a bit differently once a database is linked 
as it will be mostly constructing queries to send out rather than parsing.
This is mostly a proof of concept more than anything else for the test data.
*/

class FilterSearch {
  List<RecalledProduct> td;

  String? _keywords;
  String? _startDate;
  String? _endDate;
  String? _hazardType;
  String? _category;
  String? _manufactured;
  String? _distributor;

  get keywords => _keywords;

  set keywords(value) => _keywords = value;

  get startDate => _startDate;

  set startDate(value) => _startDate = value;

  get endDate => _endDate;

  set endDate(value) => _endDate = value;

  get hazardType => _hazardType;

  set hazardType(value) => _hazardType = value;

  get category => _category;

  set category(value) => _category = value;

  get manufactured => _manufactured;

  set manufactured(value) => _manufactured = value;

  get distributor => _distributor;

  set distributor(value) => _distributor = value;

  FilterSearch({required this.td});
}
