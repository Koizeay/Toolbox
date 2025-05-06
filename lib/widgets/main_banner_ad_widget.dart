
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MainBannerAd extends StatefulWidget {

  const MainBannerAd({super.key});

  @override
  State<MainBannerAd> createState() => _MainBannerAdState();
}

class _MainBannerAdState extends State<MainBannerAd> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;
  bool _hasError = false;

  final adUnitId = kDebugMode
      ? 'ca-app-pub-3940256099942544/9214589741'
      : 'ca-app-pub-1859656869880016/5663191492';

  void loadAd(BuildContext context) async {

    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(

        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            _isLoaded = true;
          });
        },

        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          setState(() {
            _hasError = true;
          });
          ad.dispose();
        },

        onAdOpened: (Ad ad) {},

        onAdClosed: (Ad ad) {},

        onAdImpression: (Ad ad) {},
      ),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    if (_bannerAd == null) {
      loadAd(context);
    }
    return Container(
      color: MediaQuery.of(context).platformBrightness == Brightness.light
          ? Colors.white
          : Colors.black,
      alignment: Alignment.center,
      child: SizedBox(
        width: _bannerAd?.size.width.toDouble(),
        height: _bannerAd?.size.height.toDouble(),
        child: _hasError
            ? Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _hasError = false;
                      _isLoaded = false;
                      loadAd(context);
                    });
                  },
                  child: Container(
                    height: AdSize.banner.height.toDouble(),
                    width: AdSize.banner.width.toDouble(),
                    color: Colors.transparent,
                    child: Image.asset(
                      'assets/images/core/ad_error.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              )
            : (_isLoaded && _bannerAd != null)
            ? AdWidget(ad: _bannerAd!)
            : const Center(
              child: SizedBox(),
            ),
      ),
    );
  }
}
