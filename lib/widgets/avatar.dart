import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Avatar extends StatelessWidget {
  final double radius;
  final String url;

  const Avatar({
    Key? key,
    required this.url,
    required this.radius,
  }) : super(key: key);

  // 命名构造函数
  const Avatar.small({
    Key? key,
    required this.url,
  })  : radius = 16,
        super(key: key);

  const Avatar.medium({
    Key? key,
    required this.url,
  })  : radius = 22,
        super(key: key);

  const Avatar.large({
    Key? key,
    required this.url,
  })  : radius = 44,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      //引用了一个外部库，可以在本地存储图片， 下次load会比较快
      backgroundImage: CachedNetworkImageProvider(url),
      backgroundColor: Theme.of(context).cardColor,
    );
  }
}
