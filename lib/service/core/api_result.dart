import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_trackr/service/core/api_error_handler.dart';

part 'api_result.freezed.dart';

/// Represents the result of an API operation.
///
/// The [ApiResult] class is a sealed class that can have two possible states:
/// - [Success]: Represents a successful API operation and contains the returned data.
/// - [Failure]: Represents a failed API operation and contains an [ErrorHandler] object
///   that provides information about the error.
///
/// The [T] type parameter represents the type of data returned by the API operation.
@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(ErrorHandler errorHandler) = Failure<T>;
}
