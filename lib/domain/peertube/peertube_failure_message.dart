import 'package:vyplay/domain/core/failure/main_failure.dart';

/// User-facing text for a PeerTube failure. Kept in the domain layer so the
/// application layer does not need to know about Dio or API implementation
/// exceptions.
String peerTubeFailureMessage(MainFailure failure) {
  return failure.when(
    networkError: (message) =>
        'Cannot reach this PeerTube instance. Check your connection.',
    serverError: (statusCode, message) {
      if (statusCode == 401 || statusCode == 403) {
        return 'This instance does not allow anonymous browsing.';
      }
      return message != null && message.trim().isNotEmpty
          ? message
          : 'The instance returned an error${statusCode == null ? '' : ' ($statusCode)'}.';
    },
    notFound: (_) => 'This instance or video could not be found.',
    parseError: (_) =>
        'The server did not return a valid PeerTube response. Check the instance URL.',
    rateLimited: (_) =>
        'This instance is rate limiting requests. Try again in a moment.',
    timeout: (_) => 'The PeerTube instance timed out. Try again.',
    unknown: (message) => message != null && message.trim().isNotEmpty
        ? message
        : 'Something went wrong while contacting PeerTube.',
    clientFailure: () => 'The PeerTube request failed.',
    serverFailure: () => 'The PeerTube instance returned an error.',
  );
}
