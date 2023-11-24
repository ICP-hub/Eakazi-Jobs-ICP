import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

abstract class NetworkImageCachedAbstract {
  Widget networkImagecache(
      {required String url, required ImageWidgetBuilder child});
  CachedNetworkImageProvider cachedNetworkImageProvider(String url);
}

/// a base fuction to call when dealing with images
mixin NetworkImageCached implements NetworkImageCachedAbstract {
  @override
  Widget networkImagecache(
      {required String url,
      required ImageWidgetBuilder child,
      Widget? placeHolder}) {
    return CachedNetworkImage(
      // fit: BoxFit.contain,
      imageUrl: url,
      imageBuilder: child,
      placeholder: (context, url) =>
          placeHolder ??
          Container(
            color: Colors.grey,
          ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

  @override
  CachedNetworkImageProvider cachedNetworkImageProvider(String url) {
    return CachedNetworkImageProvider(url);
  }
}
