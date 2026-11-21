class ApiConfig {
  ApiConfig._();

  static const String baseUrl = 'http://192.168.1.11:8000/api/v1/posyandu';

  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
}
