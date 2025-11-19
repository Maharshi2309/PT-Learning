import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:myapp/router.dart';

class DeepLink extends StatefulWidget {
  final Widget child;
  const DeepLink({required this.child, super.key});
  @override
  State<DeepLink> createState() => _DeepLinkState();
}

class _DeepLinkState extends State<DeepLink> {
  final AppLinks _appLinks = AppLinks();

  @override
  void initState() {
    super.initState();

    _appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null) _handleLink(uri);
    });

    _appLinks.getInitialLink().then((Uri? uri) {
      if (uri != null) {
        _handleLink(uri);
      }
    });
  }

// Link from mail that receives for app


  void _handleLink(Uri uri) {
    print(
      'deep link ->->->->->->->->Receiving Full URI  -: $uri-<-<-<-<-<-<-<-<-<-<-<-<-<-',
    );
    print('path: ->->->->->->->->-${uri.path}-<-<-<-<-<-<-<-<-<-<-<-<-<-');
    print(
      'endpoints with parameters:  ->->->->->->->->-${uri.queryParameters}-<-<-<-<-<-<-<-<-<-<-<-<-<-',
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (uri.host.contains('bk-qa.baps.dev') == true &&
          uri.path.contains('/password/changepass')) {
        final key = uri.queryParameters['key'];
        final userId = uri.queryParameters['user_id'];
        final isChild = uri.queryParameters['is_child'];
        if (key == null || userId == null) {
          print('->->->->->->->->-Missing params-<-<-<-<-<-<-<-<-<-<-<-<-<-');
          router.go('/login');
          return;
        }

        final path = '/resetpass?key=$key&bkms_id=$userId&is_child=$isChild';
        router.go(path);
      } else {
        print('->->->->->->->->-Invalid link');
      }
    });
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
