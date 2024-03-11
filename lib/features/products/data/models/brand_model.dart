import 'dart:convert';

import 'package:slash_internship/features/products/domain/entities/brand.dart';

class BrandModel extends Brand {
  BrandModel({
    required int id,
    required String brandName,
    required String brandType,
    required String brandFacebookPageLink,
    required String brandMobileNumber,
    required String brandLogoImagePath,
    required String brandInstagramPageLink,
    required String brandWebsiteLink,
    required String brandEmailAddress,
    required String taxIdNumber,
    required String brandDescription,
  }) : super(
            id,
            brandType,
            brandName,
            brandFacebookPageLink,
            brandInstagramPageLink,
            brandWebsiteLink,
            brandMobileNumber,
            brandEmailAddress,
            taxIdNumber,
            brandDescription,
            brandLogoImagePath);

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'],
      brandType: json['brandType'],
      brandName: json['brandName'],
      brandFacebookPageLink: json['brandFacebookPageLink'],
      brandWebsiteLink: json['brandWebsiteLink'],
      brandInstagramPageLink: json['brandInstagramPageLink'],
      brandMobileNumber: json['brandMobileNumber'],
      brandEmailAddress: json['brandEmailAddress'],
      taxIdNumber: json['taxIdNumber'],
      brandDescription: json['brandDescription'],
      brandLogoImagePath: json['brandLogoImagePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'brandType': brandType,
      'brandName': brandName,
      'brandFacebookPageLink': brandFacebookPageLink,
      'brandWebsiteLink': brandWebsiteLink,
      'brandInstagramPageLink': brandInstagramPageLink,
      'brandMobileNumber': brandMobileNumber,
      'brandEmailAddress': brandEmailAddress,
      'taxIdNumber': taxIdNumber,
      'brandDescription': brandDescription,
      'brandLogoImagePath': brandLogoImagePath,
    };
  }

  static List<BrandModel> jsonToList(dynamic json) {
    final List<dynamic> jsonArray = json;
    return jsonArray.map((json) => BrandModel.fromJson(json)).toList();
  }

  static String listToJson(List<BrandModel> Brands) {
    final List<Map<String, dynamic>> brandJsonList =
        Brands.map((brand) => brand.toJson()).toList();
    return jsonEncode(brandJsonList);
  }
}
