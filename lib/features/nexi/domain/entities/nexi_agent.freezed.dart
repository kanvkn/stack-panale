// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nexi_agent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NexiConfig {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  String get gradient => throw _privateConstructorUsedError;
  NexiCategory get category => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String? get author => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NexiConfigCopyWith<NexiConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NexiConfigCopyWith<$Res> {
  factory $NexiConfigCopyWith(
          NexiConfig value, $Res Function(NexiConfig) then) =
      _$NexiConfigCopyWithImpl<$Res, NexiConfig>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String icon,
      String color,
      String gradient,
      NexiCategory category,
      String version,
      String? author});
}

/// @nodoc
class _$NexiConfigCopyWithImpl<$Res, $Val extends NexiConfig>
    implements $NexiConfigCopyWith<$Res> {
  _$NexiConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? icon = null,
    Object? color = null,
    Object? gradient = null,
    Object? category = null,
    Object? version = null,
    Object? author = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      gradient: null == gradient
          ? _value.gradient
          : gradient // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as NexiCategory,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NexiConfigImplCopyWith<$Res>
    implements $NexiConfigCopyWith<$Res> {
  factory _$$NexiConfigImplCopyWith(
          _$NexiConfigImpl value, $Res Function(_$NexiConfigImpl) then) =
      __$$NexiConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String icon,
      String color,
      String gradient,
      NexiCategory category,
      String version,
      String? author});
}

/// @nodoc
class __$$NexiConfigImplCopyWithImpl<$Res>
    extends _$NexiConfigCopyWithImpl<$Res, _$NexiConfigImpl>
    implements _$$NexiConfigImplCopyWith<$Res> {
  __$$NexiConfigImplCopyWithImpl(
      _$NexiConfigImpl _value, $Res Function(_$NexiConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? icon = null,
    Object? color = null,
    Object? gradient = null,
    Object? category = null,
    Object? version = null,
    Object? author = freezed,
  }) {
    return _then(_$NexiConfigImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      gradient: null == gradient
          ? _value.gradient
          : gradient // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as NexiCategory,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NexiConfigImpl implements _NexiConfig {
  const _$NexiConfigImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.icon,
      required this.color,
      required this.gradient,
      required this.category,
      required this.version,
      this.author});

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String icon;
  @override
  final String color;
  @override
  final String gradient;
  @override
  final NexiCategory category;
  @override
  final String version;
  @override
  final String? author;

  @override
  String toString() {
    return 'NexiConfig(id: $id, name: $name, description: $description, icon: $icon, color: $color, gradient: $gradient, category: $category, version: $version, author: $author)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NexiConfigImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.gradient, gradient) ||
                other.gradient == gradient) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.author, author) || other.author == author));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, icon,
      color, gradient, category, version, author);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NexiConfigImplCopyWith<_$NexiConfigImpl> get copyWith =>
      __$$NexiConfigImplCopyWithImpl<_$NexiConfigImpl>(this, _$identity);
}

abstract class _NexiConfig implements NexiConfig {
  const factory _NexiConfig(
      {required final String id,
      required final String name,
      required final String description,
      required final String icon,
      required final String color,
      required final String gradient,
      required final NexiCategory category,
      required final String version,
      final String? author}) = _$NexiConfigImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get icon;
  @override
  String get color;
  @override
  String get gradient;
  @override
  NexiCategory get category;
  @override
  String get version;
  @override
  String? get author;
  @override
  @JsonKey(ignore: true)
  _$$NexiConfigImplCopyWith<_$NexiConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NexiAgent {
  NexiConfig get config => throw _privateConstructorUsedError;
  List<String> get tools => throw _privateConstructorUsedError;
  String get systemPrompt => throw _privateConstructorUsedError;
  String? get welcomeMessage => throw _privateConstructorUsedError;
  String? get placeholderText => throw _privateConstructorUsedError;
  List<String>? get capabilities => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NexiAgentCopyWith<NexiAgent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NexiAgentCopyWith<$Res> {
  factory $NexiAgentCopyWith(NexiAgent value, $Res Function(NexiAgent) then) =
      _$NexiAgentCopyWithImpl<$Res, NexiAgent>;
  @useResult
  $Res call(
      {NexiConfig config,
      List<String> tools,
      String systemPrompt,
      String? welcomeMessage,
      String? placeholderText,
      List<String>? capabilities});

  $NexiConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$NexiAgentCopyWithImpl<$Res, $Val extends NexiAgent>
    implements $NexiAgentCopyWith<$Res> {
  _$NexiAgentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? tools = null,
    Object? systemPrompt = null,
    Object? welcomeMessage = freezed,
    Object? placeholderText = freezed,
    Object? capabilities = freezed,
  }) {
    return _then(_value.copyWith(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as NexiConfig,
      tools: null == tools
          ? _value.tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<String>,
      systemPrompt: null == systemPrompt
          ? _value.systemPrompt
          : systemPrompt // ignore: cast_nullable_to_non_nullable
              as String,
      welcomeMessage: freezed == welcomeMessage
          ? _value.welcomeMessage
          : welcomeMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      placeholderText: freezed == placeholderText
          ? _value.placeholderText
          : placeholderText // ignore: cast_nullable_to_non_nullable
              as String?,
      capabilities: freezed == capabilities
          ? _value.capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NexiConfigCopyWith<$Res> get config {
    return $NexiConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NexiAgentImplCopyWith<$Res>
    implements $NexiAgentCopyWith<$Res> {
  factory _$$NexiAgentImplCopyWith(
          _$NexiAgentImpl value, $Res Function(_$NexiAgentImpl) then) =
      __$$NexiAgentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {NexiConfig config,
      List<String> tools,
      String systemPrompt,
      String? welcomeMessage,
      String? placeholderText,
      List<String>? capabilities});

  @override
  $NexiConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$NexiAgentImplCopyWithImpl<$Res>
    extends _$NexiAgentCopyWithImpl<$Res, _$NexiAgentImpl>
    implements _$$NexiAgentImplCopyWith<$Res> {
  __$$NexiAgentImplCopyWithImpl(
      _$NexiAgentImpl _value, $Res Function(_$NexiAgentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? tools = null,
    Object? systemPrompt = null,
    Object? welcomeMessage = freezed,
    Object? placeholderText = freezed,
    Object? capabilities = freezed,
  }) {
    return _then(_$NexiAgentImpl(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as NexiConfig,
      tools: null == tools
          ? _value._tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<String>,
      systemPrompt: null == systemPrompt
          ? _value.systemPrompt
          : systemPrompt // ignore: cast_nullable_to_non_nullable
              as String,
      welcomeMessage: freezed == welcomeMessage
          ? _value.welcomeMessage
          : welcomeMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      placeholderText: freezed == placeholderText
          ? _value.placeholderText
          : placeholderText // ignore: cast_nullable_to_non_nullable
              as String?,
      capabilities: freezed == capabilities
          ? _value._capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$NexiAgentImpl implements _NexiAgent {
  const _$NexiAgentImpl(
      {required this.config,
      required final List<String> tools,
      required this.systemPrompt,
      this.welcomeMessage,
      this.placeholderText,
      final List<String>? capabilities})
      : _tools = tools,
        _capabilities = capabilities;

  @override
  final NexiConfig config;
  final List<String> _tools;
  @override
  List<String> get tools {
    if (_tools is EqualUnmodifiableListView) return _tools;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tools);
  }

  @override
  final String systemPrompt;
  @override
  final String? welcomeMessage;
  @override
  final String? placeholderText;
  final List<String>? _capabilities;
  @override
  List<String>? get capabilities {
    final value = _capabilities;
    if (value == null) return null;
    if (_capabilities is EqualUnmodifiableListView) return _capabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'NexiAgent(config: $config, tools: $tools, systemPrompt: $systemPrompt, welcomeMessage: $welcomeMessage, placeholderText: $placeholderText, capabilities: $capabilities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NexiAgentImpl &&
            (identical(other.config, config) || other.config == config) &&
            const DeepCollectionEquality().equals(other._tools, _tools) &&
            (identical(other.systemPrompt, systemPrompt) ||
                other.systemPrompt == systemPrompt) &&
            (identical(other.welcomeMessage, welcomeMessage) ||
                other.welcomeMessage == welcomeMessage) &&
            (identical(other.placeholderText, placeholderText) ||
                other.placeholderText == placeholderText) &&
            const DeepCollectionEquality()
                .equals(other._capabilities, _capabilities));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      config,
      const DeepCollectionEquality().hash(_tools),
      systemPrompt,
      welcomeMessage,
      placeholderText,
      const DeepCollectionEquality().hash(_capabilities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NexiAgentImplCopyWith<_$NexiAgentImpl> get copyWith =>
      __$$NexiAgentImplCopyWithImpl<_$NexiAgentImpl>(this, _$identity);
}

abstract class _NexiAgent implements NexiAgent {
  const factory _NexiAgent(
      {required final NexiConfig config,
      required final List<String> tools,
      required final String systemPrompt,
      final String? welcomeMessage,
      final String? placeholderText,
      final List<String>? capabilities}) = _$NexiAgentImpl;

  @override
  NexiConfig get config;
  @override
  List<String> get tools;
  @override
  String get systemPrompt;
  @override
  String? get welcomeMessage;
  @override
  String? get placeholderText;
  @override
  List<String>? get capabilities;
  @override
  @JsonKey(ignore: true)
  _$$NexiAgentImplCopyWith<_$NexiAgentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
