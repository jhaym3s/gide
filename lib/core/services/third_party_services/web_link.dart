// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:gide/core/helpers/helper_fxn.dart';

class WebLinkServices {
  final ProviderRef ref;

  WebLinkServices(this.ref);

  Future<void> webLink({required String urlLink}) async {
    final webParse = Uri.parse(urlLink);
    // if (await canLaunchUrl(webParse)) {
    if (!await launchUrl(
      webParse,
      mode: LaunchMode.externalApplication,
    )) {
      errorToastMessage('Please Try Again');
    }
    // } else {
    //   errorToastMessage('Server Down!!! Please Try Again Later');
    // }
  }
}

final webLinkProvider = Provider((ref) => WebLinkServices(ref));
