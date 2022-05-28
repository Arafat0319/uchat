// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

//@immutable一旦一个实例按照下面的类创建了，这个实例就是不可更改的
@immutable
class StoryData {
  const StoryData({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;
}