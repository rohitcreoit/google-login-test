// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginSignup _$UserLoginSignupFromJson(Map<String, dynamic> json) =>
    UserLoginSignup(
      email: json['email'] as String?,
      password: json['password'] as String?,
      authToken: json['auth_token'] as String?,
      firstName: json['first_name'] as String?,
      profilePicture: json['profile_picture'] as String?,
      gender: json['gender'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      phoneNumber: json['phone_number'] as String?,
      shortBio: json['short_bio'] as String?,
      instagram: json['instagram'] as String?,
      city: json['city'] as String?,
      idToken: json['id_token'] as String?,
      placeId: json['city_place_id'] as String?,
      preferredCityId: json['preferred_city'] as int?,
      preferredCityData: json['preferred_city_data'] == null
          ? null
          : City.fromJson(json['preferred_city_data'] as Map<String, dynamic>),
      code: json['code'] as String?,
      newPassword: json['new_password'] as String?,
    )
      ..id = json['id'] as int?
      ..userType = json['user_type'] as String?;

Map<String, dynamic> _$UserLoginSignupToJson(UserLoginSignup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('email', instance.email);
  writeNotNull('code', instance.code);
  writeNotNull('password', instance.password);
  writeNotNull('new_password', instance.newPassword);
  writeNotNull('auth_token', instance.authToken);
  writeNotNull('first_name', instance.firstName);
  writeNotNull('profile_picture', instance.profilePicture);
  writeNotNull('gender', instance.gender);
  writeNotNull('date_of_birth', instance.dateOfBirth);
  writeNotNull('phone_number', instance.phoneNumber);
  writeNotNull('user_type', instance.userType);
  writeNotNull('instagram', instance.instagram);
  writeNotNull('short_bio', instance.shortBio);
  writeNotNull('city', instance.city);
  writeNotNull('city_place_id', instance.placeId);
  writeNotNull('id_token', instance.idToken);
  writeNotNull('preferred_city', instance.preferredCityId);
  writeNotNull('preferred_city_data', instance.preferredCityData?.toJson());
  return val;
}

City _$CityFromJson(Map<String, dynamic> json) => City(
      id: json['id'] as int?,
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      order: json['order'] as int?,
      name: json['name'] as String?,
      placeId: json['place_id'] as String?,
      isPublic: json['is_public'] as bool?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$CityToJson(City instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('country', instance.country?.toJson());
  writeNotNull('order', instance.order);
  writeNotNull('name', instance.name);
  writeNotNull('place_id', instance.placeId);
  writeNotNull('is_public', instance.isPublic);
  writeNotNull('lat', instance.lat);
  writeNotNull('lng', instance.lng);
  writeNotNull('location', instance.location);
  return val;
}

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$CountryToJson(Country instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('code', instance.code);
  return val;
}
