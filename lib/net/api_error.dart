import 'package:flutter/material.dart';
part 'api_error.freezed.dart';

// @freezed
class APIError with _$APIError {
  const factory APIError.invalidApiKey() = _InvalidApiKey;
  const factory APIError.noInternetConnection() = _NoInternetConnection;
  const factory APIError.notFound() = _NotFound;
  const factory APIError.unknown() = _Unknown;
}


