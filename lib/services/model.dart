
import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

class Resource<T> {}

class Success<T> extends Resource {
  T data;

  Success(this.data);
}

class Failure extends Resource<Object> {
  String? errorMessage;
  Exception? exception;
  Error? error;

  Failure({this.errorMessage, this.exception, this.error});

  @override
  String toString() {
    return "errormessage: $errorMessage, exception: $exception, error: $error";
  }
}

@JsonSerializable(
  includeIfNull: false,
  explicitToJson: true,
)
class UserLoginSignup {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "new_password")
  String? newPassword;
  @JsonKey(name: "auth_token")
  String? authToken;
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "profile_picture")
  String? profilePicture;
  @JsonKey(name: "gender")
  String? gender;
  @JsonKey(name: "date_of_birth")
  String? dateOfBirth;
  @JsonKey(name: "phone_number")
  String? phoneNumber;
  @JsonKey(name: "user_type")
  String? userType;
  @JsonKey(name: "instagram")
  String? instagram;
  @JsonKey(name: "short_bio")
  String? shortBio;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "city_place_id")
  String? placeId;
  @JsonKey(name: "id_token")
  String? idToken;
  @JsonKey(name: "preferred_city")
  int? preferredCityId;
  @JsonKey(name: "preferred_city_data")
  City? preferredCityData;

  UserLoginSignup(
      {this.email,
        this.password,
        this.authToken,
        this.firstName,
        this.profilePicture,
        this.gender,
        this.dateOfBirth,
        this.phoneNumber,
        this.shortBio,
        this.instagram,
        this.city,
        this.idToken,
        this.placeId,
        this.preferredCityId,
        this.preferredCityData,
        this.code,
        this.newPassword});

  factory UserLoginSignup.fromJson(Map<String, dynamic> json) =>
      _$UserLoginSignupFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginSignupToJson(this);
}

@JsonSerializable(
  includeIfNull: false,
  explicitToJson: true,
)
class City {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "country")
  Country? country;
  @JsonKey(name: "order")
  int? order;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "place_id")
  String? placeId;
  @JsonKey(name: "is_public")
  bool? isPublic;
  @JsonKey(name: "lat")
  String? lat;
  @JsonKey(name: "lng")
  String? lng;
  @JsonKey(name: "location")
  String? location;

  City({
    this.id,
    this.country,
    this.order,
    this.name,
    this.placeId,
    this.isPublic,
    this.lat,
    this.lng,
    this.location,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable(
  includeIfNull: false,
  explicitToJson: true,
)
class Country {
  Country({
    this.id,
    this.name,
    this.code,
  });

  int? id;
  String? name;
  String? code;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}