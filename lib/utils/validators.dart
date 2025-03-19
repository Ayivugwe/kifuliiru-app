class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    // Basic email format validation
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
      caseSensitive: false,
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    // Check for disposable email domains
    final disposableDomains = [
      'tempmail.com',
      'throwawaymail.com',
      'mailinator.com',
      // Add more disposable email domains as needed
    ];
    final domain = value.split('@')[1].toLowerCase();
    if (disposableDomains.contains(domain)) {
      return 'Please use a non-disposable email address';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }

    // Minimum length
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }

    // Check for lowercase letters
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }

    // Check for common passwords
    final commonPasswords = [
      'password123',
      '12345678',
      'qwerty123',
      // Add more common passwords as needed
    ];
    if (commonPasswords.contains(value.toLowerCase())) {
      return 'Please choose a stronger password';
    }

    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }

    // Check for minimum length
    if (value.length < 2) {
      return 'Name must be at least 2 characters long';
    }

    // Check for valid characters
    if (!value.contains(RegExp(r'^[a-zA-Z\s]+$'))) {
      return 'Name can only contain letters and spaces';
    }

    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }
} 