import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
@immutable
class UserModel {
  final String email;
  final String name;
  final String uid;
  final List<String> followers;
  final List<String> following;
  final String profilePic;
  final String bannerPic;
  final String bio;
  final bool isTwitterBlue;

  const UserModel({
    required this.email,
    required this.name,
    required this.uid,
    required this.followers,
    required this.following,
    required this.profilePic,
    required this.bannerPic,
    required this.bio,
    required this.isTwitterBlue,
  });

  UserModel copyWith({
    String? email,
    String? name,
    String? uid,
    List<String>? followers,
    List<String>? following,
    String? profilePic,
    String? bannerPic,
    String? bio,
    bool? isTwitterBlue,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      uid: uid ?? this.uid,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      profilePic: profilePic ?? this.profilePic,
      bannerPic: bannerPic ?? this.bannerPic,
      bio: bio ?? this.bio,
      isTwitterBlue: isTwitterBlue ?? this.isTwitterBlue,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'followers': followers,
      'following': following,
      'profilePic': profilePic,
      'bannerPic': bannerPic,
      'bio': bio,
      'isTwitterBlue': isTwitterBlue,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      uid: map['\$id'] ?? '',
      followers: List<String>.from((map['followers'] as List<String>)),
      following: List<String>.from((map['following'] as List<String>)),
      profilePic: map['profilePic'] ?? '',
      bannerPic: map['bannerPic'] ?? '',
      bio: map['bio'] ?? '',
      isTwitterBlue: map['isTwitterBlue'] as bool,
    );
  }

  @override
  String toString() {
    return 'UserModel(email: $email, name: $name, uid: $uid, followers: $followers, following: $following, profilePic: $profilePic, bannerPic: $bannerPic, bio: $bio, isTwitterBlue: $isTwitterBlue)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.email == email &&
        other.name == name &&
        other.uid == uid &&
        listEquals(other.followers, followers) &&
        listEquals(other.following, following) &&
        other.profilePic == profilePic &&
        other.bannerPic == bannerPic &&
        other.bio == bio &&
        other.isTwitterBlue == isTwitterBlue;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        name.hashCode ^
        uid.hashCode ^
        followers.hashCode ^
        following.hashCode ^
        profilePic.hashCode ^
        bannerPic.hashCode ^
        bio.hashCode ^
        isTwitterBlue.hashCode;
  }
}
