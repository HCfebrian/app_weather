class NotFoundException implements Exception{}
class TooMuchTrafficException implements Exception{}
class UndefineException implements Exception{}
class GetDataException implements Exception{
  final int code;
  final String message;

  GetDataException(this.code, this.message);

  @override
  String toString() {
    return 'HTTPException {code: $code, message: $message}';
  }
}