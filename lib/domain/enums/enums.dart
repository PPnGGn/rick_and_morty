import 'package:json_annotation/json_annotation.dart';

// Статусы персонажей
@JsonEnum(valueField: 'value')
enum CharacterStatus {
  @JsonValue('Alive')
  alive('Alive'),
  @JsonValue('Dead')
  dead('Dead'),
  @JsonValue('unknown')
  unknown('unknown');

  final String value;
  const CharacterStatus(this.value);
}

// Пол персонажей
@JsonEnum(valueField: 'value')
enum CharacterGender {
  @JsonValue('Female')
  female('Female'),
  @JsonValue('Male')
  male('Male'),
  @JsonValue('Genderless')
  genderless('Genderless'),
  @JsonValue('unknown')
  unknown('unknown');

  final String value;
  const CharacterGender(this.value);
}
