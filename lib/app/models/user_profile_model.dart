class UserProfileModel {
  final int statusCode;
  final UserData data;
  final CustomerData customerData;

  UserProfileModel({
    required this.statusCode,
    required this.data,
    required this.customerData,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      statusCode: json['StatusCode'],
      data: UserData.fromJson(json['data']),
      customerData: CustomerData.fromJson(json['customer_data']),
    );
  }
}

class UserData {
  final String firstName;
  final String lastName;
  final String username;
  final String email;

  UserData({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
    );
  }
}

class CustomerData {
  final String dateOfBirth;
  final String country;
  final int phone;
  final String state;
  final String? city;
  final String address;
  final String photo;
  final String countryName;
  final String stateName;

  CustomerData({
    required this.dateOfBirth,
    required this.country,
    required this.phone,
    required this.state,
    required this.city,
    required this.address,
    required this.photo,
    required this.countryName,
    required this.stateName,
  });

  factory CustomerData.fromJson(Map<String, dynamic> json) {
    return CustomerData(
      dateOfBirth: json['DateOfBirth'] ?? '',
      country: json['Country'] ?? '',
      phone: json['Phone'] ?? 0,
      state: json['State'] ?? '',
      city: json['City'],
      address: json['Address'] ?? '',
      photo: json['photo'] ?? '',
      countryName: json['CountryName'] ?? '',
      stateName: json['StateName'] ?? '',
    );
  }
}
