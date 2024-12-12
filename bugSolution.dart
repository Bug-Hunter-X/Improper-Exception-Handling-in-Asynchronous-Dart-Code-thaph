```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}, Body: ${response.body}');
    }
  } catch (e) {
    print('Error fetching data: $e');
    // Consider returning null to signal failure instead of rethrowing
    return null; // or rethrow;
  }
}

void main() async {
  final data = await fetchData();
  if (data != null) {
    print('Data fetched successfully: $data');
  } else {
    print('Failed to fetch data.');
  }
}
```