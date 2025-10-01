// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharactersEntity _$CharactersEntityFromJson(Map<String, dynamic> json) =>
    _CharactersEntity(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      type: json['type'] as String,
      gender: json['gender'] as String,
      origin: json['origin'] == null
          ? null
          : OriginEntity.fromJson(json['origin'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : LocationEntity.fromJson(json['location'] as Map<String, dynamic>),
      image: json['image'] as String,
      episode: (json['episode'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      url: json['url'] as String,
    );

Map<String, dynamic> _$CharactersEntityToJson(_CharactersEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'origin': instance.origin,
      'location': instance.location,
      'image': instance.image,
      'episode': instance.episode,
      'url': instance.url,
    };

_OriginEntity _$OriginEntityFromJson(Map<String, dynamic> json) =>
    _OriginEntity(name: json['name'] as String?, url: json['url'] as String?);

Map<String, dynamic> _$OriginEntityToJson(_OriginEntity instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};

_LocationEntity _$LocationEntityFromJson(Map<String, dynamic> json) =>
    _LocationEntity(name: json['name'] as String?, url: json['url'] as String?);

Map<String, dynamic> _$LocationEntityToJson(_LocationEntity instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};
