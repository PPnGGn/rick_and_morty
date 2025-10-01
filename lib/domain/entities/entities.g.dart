// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterEntity _$CharacterEntityFromJson(Map<String, dynamic> json) =>
    _CharacterEntity(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      status: $enumDecode(_$CharacterStatusEnumMap, json['status']),
      species: json['species'] as String,
      type: json['type'] as String,
      gender: $enumDecode(_$CharacterGenderEnumMap, json['gender']),
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

Map<String, dynamic> _$CharacterEntityToJson(_CharacterEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': _$CharacterStatusEnumMap[instance.status]!,
      'species': instance.species,
      'type': instance.type,
      'gender': _$CharacterGenderEnumMap[instance.gender]!,
      'origin': instance.origin,
      'location': instance.location,
      'image': instance.image,
      'episode': instance.episode,
      'url': instance.url,
    };

const _$CharacterStatusEnumMap = {
  CharacterStatus.alive: 'Alive',
  CharacterStatus.dead: 'Dead',
  CharacterStatus.unknown: 'unknown',
};

const _$CharacterGenderEnumMap = {
  CharacterGender.female: 'Female',
  CharacterGender.male: 'Male',
  CharacterGender.genderless: 'Genderless',
  CharacterGender.unknown: 'unknown',
};

_OriginEntity _$OriginEntityFromJson(Map<String, dynamic> json) =>
    _OriginEntity(name: json['name'] as String?, url: json['url'] as String?);

Map<String, dynamic> _$OriginEntityToJson(_OriginEntity instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};

_LocationEntity _$LocationEntityFromJson(Map<String, dynamic> json) =>
    _LocationEntity(name: json['name'] as String?, url: json['url'] as String?);

Map<String, dynamic> _$LocationEntityToJson(_LocationEntity instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};
