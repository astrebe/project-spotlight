//Mostly autogenned code courtesy of https://app.quicktype.io/ (Quickly converts JSON -> classes and back, but we only need one way)

// To parse this JSON data, do
//
//     final recalledProduct = recalledProductFromJson(jsonString);

import 'dart:convert';

List<RecalledProduct> recalledProductFromJson(String str) =>
    List<RecalledProduct>.from(
        json.decode(str).map((x) => RecalledProduct.fromJson(x)));

String recalledProductToJson(List<RecalledProduct> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecalledProduct {
  RecalledProduct({
    this.recallId,
    this.recallNumber,
    this.recallDate,
    this.description,
    this.url,
    this.title,
    this.consumerContact,
    this.lastPublishDate,
    this.products,
    this.inconjunctions,
    this.images,
    this.injuries,
    this.manufacturers,
    this.retailers,
    this.importers,
    this.distributors,
    this.soldAtLabel,
    this.manufacturerCountries,
    this.productUpCs,
    this.hazards,
    this.remedies,
    this.remedyOptions,
  });

  int? recallId;
  String? recallNumber;
  DateTime? recallDate;
  String? description;
  String? url;
  String? title;
  String? consumerContact;
  DateTime? lastPublishDate;
  List<Product>? products;
  List<Inconjunction>? inconjunctions;
  List<Image>? images;
  List<Injury>? injuries;
  List<Distributor>? manufacturers;
  List<Distributor>? retailers;
  List<Distributor>? importers;
  List<Distributor>? distributors;
  dynamic soldAtLabel;
  List<ManufacturerCountry>? manufacturerCountries;
  List<dynamic>? productUpCs;
  List<Hazard>? hazards;
  List<Injury>? remedies;
  List<RemedyOption>? remedyOptions;

  factory RecalledProduct.fromJson(Map<String, dynamic> json) =>
      RecalledProduct(
        recallId: json["RecallID"],
        recallNumber: json["RecallNumber"],
        recallDate: json["RecallDate"] == null
            ? null
            : DateTime.parse(json["RecallDate"]),
        description: json["Description"],
        url: json["URL"],
        title: json["Title"],
        consumerContact: json["ConsumerContact"],
        lastPublishDate: json["LastPublishDate"] == null
            ? null
            : DateTime.parse(json["LastPublishDate"]),
        products: json["Products"] == null
            ? null
            : List<Product>.from(
                json["Products"].map((x) => Product.fromJson(x))),
        inconjunctions: json["Inconjunctions"] == null
            ? null
            : List<Inconjunction>.from(
                json["Inconjunctions"].map((x) => Inconjunction.fromJson(x))),
        images: json["Images"] == null
            ? null
            : List<Image>.from(json["Images"].map((x) => Image.fromJson(x))),
        injuries: json["Injuries"] == null
            ? null
            : List<Injury>.from(
                json["Injuries"].map((x) => Injury.fromJson(x))),
        manufacturers: json["Manufacturers"] == null
            ? null
            : List<Distributor>.from(
                json["Manufacturers"].map((x) => Distributor.fromJson(x))),
        retailers: json["Retailers"] == null
            ? null
            : List<Distributor>.from(
                json["Retailers"].map((x) => Distributor.fromJson(x))),
        importers: json["Importers"] == null
            ? null
            : List<Distributor>.from(
                json["Importers"].map((x) => Distributor.fromJson(x))),
        distributors: json["Distributors"] == null
            ? null
            : List<Distributor>.from(
                json["Distributors"].map((x) => Distributor.fromJson(x))),
        soldAtLabel: json["SoldAtLabel"],
        manufacturerCountries: json["ManufacturerCountries"] == null
            ? null
            : List<ManufacturerCountry>.from(json["ManufacturerCountries"]
                .map((x) => ManufacturerCountry.fromJson(x))),
        productUpCs: json["ProductUPCs"] == null
            ? null
            : List<dynamic>.from(json["ProductUPCs"].map((x) => x)),
        hazards: json["Hazards"] == null
            ? null
            : List<Hazard>.from(json["Hazards"].map((x) => Hazard.fromJson(x))),
        remedies: json["Remedies"] == null
            ? null
            : List<Injury>.from(
                json["Remedies"].map((x) => Injury.fromJson(x))),
        remedyOptions: json["RemedyOptions"] == null
            ? null
            : List<RemedyOption>.from(
                json["RemedyOptions"].map((x) => RemedyOption.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "RecallID": recallId,
        "RecallNumber": recallNumber,
        "RecallDate": recallDate == null ? null : recallDate!.toIso8601String(),
        "Description": description,
        "URL": url,
        "Title": title,
        "ConsumerContact": consumerContact,
        "LastPublishDate":
            lastPublishDate == null ? null : lastPublishDate!.toIso8601String(),
        "Products": products == null
            ? null
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "Inconjunctions": inconjunctions == null
            ? null
            : List<dynamic>.from(inconjunctions!.map((x) => x.toJson())),
        "Images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "Injuries": injuries == null
            ? null
            : List<dynamic>.from(injuries!.map((x) => x.toJson())),
        "Manufacturers": manufacturers == null
            ? null
            : List<dynamic>.from(manufacturers!.map((x) => x.toJson())),
        "Retailers": retailers == null
            ? null
            : List<dynamic>.from(retailers!.map((x) => x.toJson())),
        "Importers": importers == null
            ? null
            : List<dynamic>.from(importers!.map((x) => x.toJson())),
        "Distributors": distributors == null
            ? null
            : List<dynamic>.from(distributors!.map((x) => x.toJson())),
        "SoldAtLabel": soldAtLabel,
        "ManufacturerCountries": manufacturerCountries == null
            ? null
            : List<dynamic>.from(manufacturerCountries!.map((x) => x.toJson())),
        "ProductUPCs": productUpCs == null
            ? null
            : List<dynamic>.from(productUpCs!.map((x) => x)),
        "Hazards": hazards == null
            ? null
            : List<dynamic>.from(hazards!.map((x) => x.toJson())),
        "Remedies": remedies == null
            ? null
            : List<dynamic>.from(remedies!.map((x) => x.toJson())),
        "RemedyOptions": remedyOptions == null
            ? null
            : List<dynamic>.from(remedyOptions!.map((x) => x.toJson())),
      };
}

class Distributor {
  Distributor({
    this.name,
    this.companyId,
  });

  String? name;
  String? companyId;

  factory Distributor.fromJson(Map<String, dynamic> json) => Distributor(
        name: json["Name"],
        companyId: json["CompanyID"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "CompanyID": companyId,
      };
}

class Hazard {
  Hazard({
    this.name,
    this.hazardType,
    this.hazardTypeId,
  });

  String? name;
  String? hazardType;
  String? hazardTypeId;

  factory Hazard.fromJson(Map<String, dynamic> json) => Hazard(
        name: json["Name"],
        hazardType: json["HazardType"],
        hazardTypeId: json["HazardTypeID"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "HazardType": hazardType,
        "HazardTypeID": hazardTypeId,
      };
}

class Image {
  Image({
    this.url,
    this.caption,
  });

  String? url;
  String? caption;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["URL"],
        caption: json["Caption"],
      );

  Map<String, dynamic> toJson() => {
        "URL": url,
        "Caption": caption,
      };
}

class Inconjunction {
  Inconjunction({
    this.url,
  });

  String? url;

  factory Inconjunction.fromJson(Map<String, dynamic> json) => Inconjunction(
        url: json["URL"],
      );

  Map<String, dynamic> toJson() => {
        "URL": url,
      };
}

class Injury {
  Injury({
    this.name,
  });

  String? name;

  factory Injury.fromJson(Map<String, dynamic> json) => Injury(
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
      };
}

class ManufacturerCountry {
  ManufacturerCountry({
    this.country,
  });

  String? country;

  factory ManufacturerCountry.fromJson(Map<String, dynamic> json) =>
      ManufacturerCountry(
        country: json["Country"],
      );

  Map<String, dynamic> toJson() => {
        "Country": country,
      };
}

class Product {
  Product({
    this.name,
    this.description,
    this.model,
    this.type,
    this.categoryId,
    this.numberOfUnits,
  });

  String? name;
  String? description;
  String? model;
  String? type;
  String? categoryId;
  String? numberOfUnits;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["Name"],
        description: json["Description"],
        model: json["Model"],
        type: json["Type"],
        categoryId: json["CategoryID"],
        numberOfUnits: json["NumberOfUnits"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Description": description,
        "Model": model,
        "Type": type,
        "CategoryID": categoryId,
        "NumberOfUnits": numberOfUnits,
      };
}

class RemedyOption {
  RemedyOption({
    this.option,
  });

  String? option;

  factory RemedyOption.fromJson(Map<String, dynamic> json) => RemedyOption(
        option: json["Option"],
      );

  Map<String, dynamic> toJson() => {
        "Option": option,
      };
}
