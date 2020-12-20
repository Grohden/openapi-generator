//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApiClient {
  ApiClient({this.basePath = 'http://petstore.swagger.io:80/v2'}) {
    // Setup authentications (key: authentication name, value: authentication).
    _authentications[r'api_key'] = ApiKeyAuth('header', 'api_key');
    _authentications[r'api_key_query'] = ApiKeyAuth('query', 'api_key_query');
    _authentications[r'bearer_test'] = HttpBearerAuth();
    _authentications[r'http_basic_test'] = HttpBasicAuth();
    _authentications[r'petstore_auth'] = OAuth();
  }

  final String basePath;

  var _client = Client();

  /// Returns the current HTTP [Client] instance to use in this class.
  ///
  /// The return value is guaranteed to never be null.
  Client get client => _client;

  /// Requests to use a new HTTP [Client] in this class.
  ///
  /// If the [newClient] is null, an [ArgumentError] is thrown.
  set client(Client newClient) {
    if (newClient == null) {
      throw ArgumentError('New client instance cannot be null.');
    }
    _client = newClient;
  }

  final _defaultHeaderMap = <String, String>{};
  final _authentications = <String, Authentication>{};

  void addDefaultHeader(String key, String value) {
     _defaultHeaderMap[key] = value;
  }

  dynamic deserialize(String json, String targetType, {bool growable}) {
    // Remove all spaces.  Necessary for reg expressions as well.
    targetType = targetType.replaceAll(' ', '');

    return targetType == 'String'
      ? json
      : _deserialize(jsonDecode(json), targetType, growable: true == growable);
  }

  String serialize(Object obj) => obj == null ? '' : json.encode(obj);

  T getAuthentication<T extends Authentication>(String name) {
    final authentication = _authentications[name];
    return authentication is T ? authentication : null;
  }

  // We don’t use a Map<String, String> for queryParams.
  // If collectionFormat is 'multi', a key might appear multiple times.
  Future<Response> invokeAPI(
    String path,
    String method,
    List<QueryParam> queryParams,
    Object body,
    Map<String, String> headerParams,
    Map<String, String> formParams,
    String nullableContentType,
    List<String> authNames,
  ) async {
    _updateParamsForAuth(authNames, queryParams, headerParams);

    headerParams.addAll(_defaultHeaderMap);

    final urlEncodedQueryParams = queryParams
      .where((param) => param.value != null)
      .map((param) => '$param');

    final queryString = urlEncodedQueryParams.isNotEmpty
      ? '?${urlEncodedQueryParams.join('&')}'
      : '';

    final url = '$basePath$path$queryString';

    if (nullableContentType != null) {
      headerParams['Content-Type'] = nullableContentType;
    }

    try {
      // Special case for uploading a single file which isn’t a 'multipart/form-data'.
      if (
        body is MultipartFile && (nullableContentType == null ||
        !nullableContentType.toLowerCase().startsWith('multipart/form-data'))
      ) {
        final request = StreamedRequest(method, Uri.parse(url));
        request.headers.addAll(headerParams);
        request.contentLength = body.length;
        body.finalize().listen(
          request.sink.add,
          onDone: request.sink.close,
          onError: (error, trace) => request.sink.close(),
          cancelOnError: true,
        );
        final response = await _client.send(request);
        return Response.fromStream(response);
      }

      if (body is MultipartRequest) {
        final request = MultipartRequest(method, Uri.parse(url));
        request.fields.addAll(body.fields);
        request.files.addAll(body.files);
        request.headers.addAll(body.headers);
        request.headers.addAll(headerParams);
        final response = await _client.send(request);
        return Response.fromStream(response);
      }

      final msgBody = nullableContentType == 'application/x-www-form-urlencoded'
        ? formParams
        : serialize(body);
      final nullableHeaderParams = headerParams.isEmpty ? null : headerParams;

      switch(method) {
        case 'POST': return await _client.post(url, headers: nullableHeaderParams, body: msgBody,);
        case 'PUT': return await _client.put(url, headers: nullableHeaderParams, body: msgBody,);
        case 'DELETE': return await _client.delete(url, headers: nullableHeaderParams,);
        case 'PATCH': return await _client.patch(url, headers: nullableHeaderParams, body: msgBody,);
        case 'HEAD': return await _client.head(url, headers: nullableHeaderParams,);
        case 'GET': return await _client.get(url, headers: nullableHeaderParams,);
      }
    } on SocketException catch (e, trace) {
      throw ApiException.withInner(HttpStatus.badRequest, 'Socket operation failed: $method $path', e, trace,);
    } on TlsException catch (e, trace) {
      throw ApiException.withInner(HttpStatus.badRequest, 'TLS/SSL communication failed: $method $path', e, trace,);
    } on IOException catch (e, trace) {
      throw ApiException.withInner(HttpStatus.badRequest, 'I/O operation failed: $method $path', e, trace,);
    } on ClientException catch (e, trace) {
      throw ApiException.withInner(HttpStatus.badRequest, 'HTTP connection failed: $method $path', e, trace,);
    } on Exception catch (e, trace) {
      throw ApiException.withInner(HttpStatus.badRequest, 'Exception occurred: $method $path', e, trace,);
    }

    throw ApiException(HttpStatus.badRequest, 'Invalid HTTP operation: $method $path',);
  }

  dynamic _deserialize(dynamic value, String targetType, {bool growable}) {
    try {
      switch (targetType) {
        case 'String':
          return '$value';
        case 'int':
          return value is int ? value : int.parse('$value');
        case 'bool':
          if (value is bool) {
            return value;
          }
          final valueString = '$value'.toLowerCase();
          return valueString == 'true' || valueString == '1';
          break;
        case 'double':
          return value is double ? value : double.parse('$value');
        case 'AdditionalPropertiesClass':
          return AdditionalPropertiesClass.fromJson(value as Map<String, dynamic>);
        case 'Animal':
          return Animal.fromJson(value as Map<String, dynamic>);
        case 'ApiResponse':
          return ApiResponse.fromJson(value as Map<String, dynamic>);
        case 'ArrayOfArrayOfNumberOnly':
          return ArrayOfArrayOfNumberOnly.fromJson(value as Map<String, dynamic>);
        case 'ArrayOfNumberOnly':
          return ArrayOfNumberOnly.fromJson(value as Map<String, dynamic>);
        case 'ArrayTest':
          return ArrayTest.fromJson(value as Map<String, dynamic>);
        case 'Capitalization':
          return Capitalization.fromJson(value as Map<String, dynamic>);
        case 'Cat':
          return Cat.fromJson(value as Map<String, dynamic>);
        case 'CatAllOf':
          return CatAllOf.fromJson(value as Map<String, dynamic>);
        case 'Category':
          return Category.fromJson(value as Map<String, dynamic>);
        case 'ClassModel':
          return ClassModel.fromJson(value as Map<String, dynamic>);
        case 'Dog':
          return Dog.fromJson(value as Map<String, dynamic>);
        case 'DogAllOf':
          return DogAllOf.fromJson(value as Map<String, dynamic>);
        case 'EnumArrays':
          return EnumArrays.fromJson(value as Map<String, dynamic>);
        case 'EnumClass':
          return EnumClassTypeTransformer().decode(value);
        case 'EnumTest':
          return EnumTest.fromJson(value as Map<String, dynamic>);
        case 'FileSchemaTestClass':
          return FileSchemaTestClass.fromJson(value as Map<String, dynamic>);
        case 'Foo':
          return Foo.fromJson(value as Map<String, dynamic>);
        case 'FormatTest':
          return FormatTest.fromJson(value as Map<String, dynamic>);
        case 'HasOnlyReadOnly':
          return HasOnlyReadOnly.fromJson(value as Map<String, dynamic>);
        case 'HealthCheckResult':
          return HealthCheckResult.fromJson(value as Map<String, dynamic>);
        case 'InlineResponseDefault':
          return InlineResponseDefault.fromJson(value as Map<String, dynamic>);
        case 'MapTest':
          return MapTest.fromJson(value as Map<String, dynamic>);
        case 'MixedPropertiesAndAdditionalPropertiesClass':
          return MixedPropertiesAndAdditionalPropertiesClass.fromJson(value as Map<String, dynamic>);
        case 'Model200Response':
          return Model200Response.fromJson(value as Map<String, dynamic>);
        case 'ModelClient':
          return ModelClient.fromJson(value as Map<String, dynamic>);
        case 'ModelFile':
          return ModelFile.fromJson(value as Map<String, dynamic>);
        case 'ModelList':
          return ModelList.fromJson(value as Map<String, dynamic>);
        case 'ModelReturn':
          return ModelReturn.fromJson(value as Map<String, dynamic>);
        case 'Name':
          return Name.fromJson(value as Map<String, dynamic>);
        case 'NullableClass':
          return NullableClass.fromJson(value as Map<String, dynamic>);
        case 'NumberOnly':
          return NumberOnly.fromJson(value as Map<String, dynamic>);
        case 'Order':
          return Order.fromJson(value as Map<String, dynamic>);
        case 'OuterComposite':
          return OuterComposite.fromJson(value as Map<String, dynamic>);
        case 'OuterEnum':
          return OuterEnumTypeTransformer().decode(value);
        case 'OuterEnumDefaultValue':
          return OuterEnumDefaultValueTypeTransformer().decode(value);
        case 'OuterEnumInteger':
          return OuterEnumIntegerTypeTransformer().decode(value);
        case 'OuterEnumIntegerDefaultValue':
          return OuterEnumIntegerDefaultValueTypeTransformer().decode(value);
        case 'Pet':
          return Pet.fromJson(value as Map<String, dynamic>);
        case 'ReadOnlyFirst':
          return ReadOnlyFirst.fromJson(value as Map<String, dynamic>);
        case 'SpecialModelName':
          return SpecialModelName.fromJson(value as Map<String, dynamic>);
        case 'Tag':
          return Tag.fromJson(value as Map<String, dynamic>);
        case 'User':
          return User.fromJson(value as Map<String, dynamic>);
        default:
          Match match;
          if (value is List && (match = _regList.firstMatch(targetType)) != null) {
            final newTargetType = match[1];
            return value
              .map((v) => _deserialize(v, newTargetType, growable: growable))
              .toList(growable: true == growable);
          }
          if (value is Map && (match = _regMap.firstMatch(targetType)) != null) {
            final newTargetType = match[1];
            return Map.fromIterables(
              value.keys,
              value.values.map((v) => _deserialize(v, newTargetType, growable: growable)),
            );
          }
          break;
      }
    } on Exception catch (e, stack) {
      throw ApiException.withInner(HttpStatus.internalServerError, 'Exception during deserialization.', e, stack,);
    }
    throw ApiException(HttpStatus.internalServerError, 'Could not find a suitable class for deserialization',);
  }

  /// Update query and header parameters based on authentication settings.
  /// @param authNames The authentications to apply
  void _updateParamsForAuth(
    List<String> authNames,
    List<QueryParam> queryParams,
    Map<String, String> headerParams,
  ) {
    for(final authName in authNames) {
      final auth = _authentications[authName];
      if (auth == null) {
        throw ArgumentError('Authentication undefined: $authName');
      }
      auth.applyToParams(queryParams, headerParams);
    }
  }
}
