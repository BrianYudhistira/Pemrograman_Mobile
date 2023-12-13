import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:unit_testing/post.dart';
import 'package:unit_testing/post_service.dart';

import 'post_test.mocks.dart';

@GenerateMocks([http.Client])
void main(){
  const _baseurl ='https://jsonplaceholder.typicode.com/';
  late PostService fetchPost;
  late MockClient mockClient;


  setUp(() {
    fetchPost = PostService();
    mockClient = MockClient();
  });

  test('Fetch post when response is successfull',() async{
    when(mockClient.get(Uri.parse('${_baseurl}posts/1'))).thenAnswer((_) async => http.Response('{"post":[]}',200));

    final post = await fetchPost.fetchPosts(http.Client());

    expect(post, isA<Posts>());
  });
}
