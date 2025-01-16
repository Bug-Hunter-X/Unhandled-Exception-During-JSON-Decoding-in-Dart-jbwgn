```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Here's where the bug might occur.  Assuming JSON response
      final jsonData = jsonDecode(response.body);
      // Accessing a property that might not exist leads to an error.
      final String userName = jsonData['user']['name']; // potential error here
      print('Username: $userName');
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    // Re-throw to be handled by a higher-level error handler if needed
    rethrow;
  }
}
```