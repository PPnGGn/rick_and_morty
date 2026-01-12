// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Character _$CharacterFromJson(Map<String, dynamic> json) => _Character(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  status: $enumDecode(_$CharacterStatusEnumMap, json['status']),
  species: json['species'] as String,
  type: json['type'] as String,
  gender: $enumDecode(_$CharacterGenderEnumMap, json['gender']),
  origin: json['origin'] == null
      ? null
      : Origin.fromJson(json['origin'] as Map<String, dynamic>),
  location: json['location'] == null
      ? null
      : Location.fromJson(json['location'] as Map<String, dynamic>),
  image: json['image'] as String,
  episode: (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
  url: json['url'] as String,
);

Map<String, dynamic> _$CharacterToJson(_Character instance) =>
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

_Origin _$OriginFromJson(Map<String, dynamic> json) =>
    _Origin(name: json['name'] as String?, url: json['url'] as String?);

Map<String, dynamic> _$OriginToJson(_Origin instance) => <String, dynamic>{
  'name': instance.name,
  'url': instance.url,
};

_Location _$LocationFromJson(Map<String, dynamic> json) =>
    _Location(name: json['name'] as String?, url: json['url'] as String?);

Map<String, dynamic> _$LocationToJson(_Location instance) => <String, dynamic>{
  'name': instance.name,
  'url': instance.url,
};

_CharactersResponse _$CharactersResponseFromJson(Map<String, dynamic> json) =>
    _CharactersResponse(
      info: Info.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharactersResponseToJson(_CharactersResponse instance) =>
    <String, dynamic>{'info': instance.info, 'results': instance.results};

_Info _$InfoFromJson(Map<String, dynamic> json) => _Info(
  count: (json['count'] as num).toInt(),
  pages: (json['pages'] as num).toInt(),
  next: json['next'] as String,
  prev: json['prev'] as String?,
);

Map<String, dynamic> _$InfoToJson(_Info instance) => <String, dynamic>{
  'count': instance.count,
  'pages': instance.pages,
  'next': instance.next,
  'prev': instance.prev,
};

_SonarResponse _$SonarResponseFromJson(Map<String, dynamic> json) =>
    _SonarResponse(
      response: json['response'] as String,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      sources: (json['citations'] as List<dynamic>?)
          ?.map((e) => Citation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SonarResponseToJson(_SonarResponse instance) =>
    <String, dynamic>{
      'response': instance.response,
      'images': instance.images,
      'citations': instance.sources,
    };

_Citation _$CitationFromJson(Map<String, dynamic> json) => _Citation(
  url: json['url'] as String,
  title: json['title'] as String?,
  text: json['text'] as String?,
);

Map<String, dynamic> _$CitationToJson(_Citation instance) => <String, dynamic>{
  'url': instance.url,
  'title': instance.title,
  'text': instance.text,
};
