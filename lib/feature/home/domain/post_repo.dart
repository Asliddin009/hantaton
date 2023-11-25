abstract class PostRepo {
  Future fetchPosts(int fetchLimit, int offset);
  Future fetchPost(String id);
  Future deletePost(String id);
  Future createPost(Map args);
}
