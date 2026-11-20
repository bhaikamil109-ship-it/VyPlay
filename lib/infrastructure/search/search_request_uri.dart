/// Builds a backend search URL without allowing reserved query characters
/// (such as &, #, +, or %) in the user's search text to alter its parameters.
String buildSearchRequestUri(
  String endpoint,
  Map<String, String> parameters,
) {
  final uri = Uri.parse(endpoint);
  final queryParameters = <String, String>{
    ...uri.queryParameters,
    ...parameters,
  };
  return uri.replace(queryParameters: queryParameters).toString();
}
