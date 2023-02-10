import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  static String? get bannerAdUnitId {
    return 'ca-app-pub-6556402405172089/1288288099';
  }

  static String? get interstitialAdUnitId {
    return 'ca-app-pub-6556402405172089/1138503455';
  }

  static String? get bannerAdUnitId2 {
    return 'ca-app-pub-6556402405172089/6629894473';
  }


  static final BannerAdListener bannerListener = BannerAdListener(
    onAdLoaded: (ad) => debugPrint('Ad loaded.'),
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
      debugPrint('Ad failed to load: $error');
    },
    onAdOpened: (ad) => debugPrint('Ad opened.'),
    onAdClosed: (ad) => debugPrint('Ad closed'),
  );
}
