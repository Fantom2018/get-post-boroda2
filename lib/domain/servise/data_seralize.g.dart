// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_seralize.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JesData _$JesDataFromJson(Map<String, dynamic> json) => JesData(
      userID: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$JesDataToJson(JesData instance) => <String, dynamic>{
      'userId': instance.userID,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
