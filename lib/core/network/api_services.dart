import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<String> fetchReceiverMessage() async {
    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/comments?postId=1'),
    );

    final data = jsonDecode(res.body);
    return data.first['body'];
  }
}

/////////////////////////
// class ApiService {
//   static Future<String> fetchReceiverMessage() async {
//     final response = await http.get(
//       Uri.parse('https://api.quotable.io/random'),
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       return data['content'];
//     } else {
//       throw Exception('Failed to fetch message');
//     }
//   }
// }
