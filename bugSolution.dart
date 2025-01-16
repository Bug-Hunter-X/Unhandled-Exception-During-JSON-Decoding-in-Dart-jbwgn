```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      // Handle potential missing keys gracefully
      final userName = jsonData['user']?['name'] ?? 'N/A'; //Null aware operator and default value
      print('Username: $userName');
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } on FormatException catch (e) {
    print('Invalid JSON format: $e');
  } on NoSuchMethodError catch (e) {
    print('Missing JSON key: $e');
  } catch (e) {
    print('An unexpected error occurred: $e');
    rethrow; // Allows higher-level error handling
  }
}
```