part of 'post_cubit.dart';

@freezed
class PostEvent with _$PostEvent {
  const PostEvent._();

  factory PostEvent.fetch() = _PostEventFetch;
  factory PostEvent.createPost(Map<String, dynamic> args) = _PostEventCreate;
  factory PostEvent.logout() = _PostEventLogout;
}
