# Unhandled Exception During JSON Decoding in Dart

This example demonstrates a common error in Dart applications when handling JSON responses from APIs:  failure to gracefully handle cases where expected JSON properties are missing.  The code attempts to access nested properties ('user['name']) without checking for their existence, leading to a runtime exception if the structure of the JSON response is different than anticipated.

The solution demonstrates best practices for handling potential JSON structure variations and using appropriate exception handling to prevent crashes.