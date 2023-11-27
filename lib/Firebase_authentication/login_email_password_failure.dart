
class LogInWithEmailAndPasswordFailure {
  final String message;

  const LogInWithEmailAndPasswordFailure(
      [this.message = 'Invalid email or password.']);

  factory LogInWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'invalid_credentials':
        return LogInWithEmailAndPasswordFailure('Invalid email or password.');
      case 'network_error':
        return LogInWithEmailAndPasswordFailure('Network error occurred.');
      case 'user_not_found':
        return LogInWithEmailAndPasswordFailure('User not found.');
      default:
        return LogInWithEmailAndPasswordFailure();
    }
  }
}