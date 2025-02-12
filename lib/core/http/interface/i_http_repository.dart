abstract class IHttpRepository {
  /// Makes a GET request to the specified https://www.jsonkeeper.com/b/+[url] and returns the decoded JSON response.
  ///
  /// The [url] parameter is appended to the base URL to form the full request URL.
  /// Returns a [Future] that completes with the decoded JSON response as a [Map].
  Future<dynamic> get(String url);
}
