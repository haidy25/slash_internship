import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Brand extends Equatable {
  final int id;
  final String brandType;
  final String brandName;
  final String brandFacebookPageLink;
  final String brandInstagramPageLink;
  final String brandWebsiteLink;
  final String brandMobileNumber;
  final String brandEmailAddress;
  final String? taxIdNumber;
  final String brandDescription;
  final String brandLogoImagePath;

  Brand(
      this.id,
      this.brandType,
      this.brandName,
      this.brandFacebookPageLink,
      this.brandInstagramPageLink,
      this.brandWebsiteLink,
      this.brandMobileNumber,
      this.brandEmailAddress,
      this.taxIdNumber,
      this.brandDescription,
      this.brandLogoImagePath);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        brandDescription,
        brandEmailAddress,
        brandFacebookPageLink,
        brandInstagramPageLink,
        brandLogoImagePath,
        brandMobileNumber,
        brandName,
        brandType,
        brandWebsiteLink,
        taxIdNumber
      ];
}
