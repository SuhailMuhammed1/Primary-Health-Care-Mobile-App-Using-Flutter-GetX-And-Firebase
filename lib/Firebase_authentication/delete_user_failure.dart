
class DeleteUserFailure implements Exception {
  final String message;

  DeleteUserFailure({this.message = 'Failed to delete user'});

  factory DeleteUserFailure.code(String code) {
    String errorMessage = 'Failed to delete user';

    // Add specific error messages based on the error code if needed
    if (code == 'user-not-found') {
      errorMessage = 'No user found for this email.';
    } else if (code == 'user-disabled') {
      errorMessage = 'The user account has been disabled.';
    } else if (code == 'invalid-email') {
      errorMessage = 'The email address is badly formatted.';
    } else if (code == 'too-many-requests') {
      errorMessage = 'Too many unsuccessful login attempts. Please try again later.';
    }

    return DeleteUserFailure(message: errorMessage);
  }

  @override
  String toString() => 'DeleteUserFailure: $message';
}
