import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.signature,
    required this.avatar,
  });

/*  factory User.empty() => User(
        id: 0,
        name: '',
        email: '',
        signature: '',
        avatar: '',
      );*/

  factory User.empty() => User(
        id: 0,
        name: 'Sangili',
        email: 'ss@gmail.com',
        signature: '',
        avatar:
            'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/yzvorwwd042nwikbs0xb',
      );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
  final int id;
  final String name;
  final String email;
  final String signature;
  final String avatar;
}
