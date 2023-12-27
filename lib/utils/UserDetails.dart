class UserDetails {
  final int id;
  final String firstName, lastName, profileUrl, email;

  UserDetails(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      this.profileUrl =
          'https://i.amz.mshcdn.com/3NbrfEiECotKyhcUhgPJHbrL7zM=/950x534/filters:quality(90)/2014%2F06%2F02%2Fc0%2Fzuckheadsho.a33d0.jpg'});

  factory UserDetails.empty() => UserDetails(
      id: 0, firstName: '', lastName: '', profileUrl: '', email: '');

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return new UserDetails(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        profileUrl: json['avatar']);
  }
}
