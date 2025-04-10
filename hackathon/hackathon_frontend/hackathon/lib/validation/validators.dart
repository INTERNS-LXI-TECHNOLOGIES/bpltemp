// lib/validation/validators.dart

class Validators {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    } else if (value.trim().length < 2) {
      return 'Name must be at least 2 characters long';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    
    final trimmedValue = value.trim();
    
    // Exact match for Java backend pattern: ^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$
    final emailRegex = RegExp(r'^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$');
    
    if (!emailRegex.hasMatch(trimmedValue)) {
      return 'Enter email in format: user@example.com';
    }
    return null;
  }

  static String? validateRequired(String? value, {String fieldName = 'Field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? validateMinLength(String? value, int minLength, {String fieldName = 'Field'}) {
    if (value == null || value.length < minLength) {
      return '$fieldName must be at least $minLength characters';
    }
    return null;
  }

  static String? validatePattern(String? value, Pattern pattern, {String errorMessage = 'Invalid format'}) {
    if (value == null || !RegExp(pattern.toString()).hasMatch(value)) {
      return errorMessage;
    }
    return null;
  }
}