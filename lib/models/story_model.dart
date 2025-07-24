import 'package:meta/meta_meta.dart';
import 'package:facebook_responsive_ui/models/models.dart';


class Story{
  final User user;
  final String imageUrl;
  final bool isViewed;

  const Story({
    required this.user,
    required this.imageUrl,
    this.isViewed = false
});
}
