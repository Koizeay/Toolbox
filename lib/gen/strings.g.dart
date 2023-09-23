/// Generated file. Do not edit.
///
/// Original: assets/translations
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 284 (142 per locale)
///
/// Built on 2023-09-23 at 14:19 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _StringsEn> {
	en(languageCode: 'en', build: _StringsEn.build),
	fr(languageCode: 'fr', build: _StringsFr.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _StringsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	_StringsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _StringsEn> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, _StringsEn> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_StringsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _StringsEn> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _StringsEn> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _StringsEn implements BaseTranslations<AppLocale, _StringsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	late final _StringsGenericEn generic = _StringsGenericEn._(_root);
	late final _StringsToolsEn tools = _StringsToolsEn._(_root);
	late final _StringsCreditsEn credits = _StringsCreditsEn._(_root);
}

// Path: generic
class _StringsGenericEn {
	_StringsGenericEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get app_name => 'Toolbox';
	String get error => 'Error';
	String get warning => 'Warning';
	String get ok => 'OK';
	String get cancel => 'Cancel';
	String get search => 'Search';
}

// Path: tools
class _StringsToolsEn {
	_StringsToolsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsToolsClockEn clock = _StringsToolsClockEn._(_root);
	late final _StringsToolsMetronomeEn metronome = _StringsToolsMetronomeEn._(_root);
	late final _StringsToolsMegaphoneEn megaphone = _StringsToolsMegaphoneEn._(_root);
	late final _StringsToolsNslookupEn nslookup = _StringsToolsNslookupEn._(_root);
	late final _StringsToolsPingEn ping = _StringsToolsPingEn._(_root);
	late final _StringsToolsSoundmeterEn soundmeter = _StringsToolsSoundmeterEn._(_root);
	late final _StringsToolsQrreaderEn qrreader = _StringsToolsQrreaderEn._(_root);
	late final _StringsToolsTimerEn timer = _StringsToolsTimerEn._(_root);
	late final _StringsToolsStopwatchEn stopwatch = _StringsToolsStopwatchEn._(_root);
	late final _StringsToolsRouletteEn roulette = _StringsToolsRouletteEn._(_root);
	late final _StringsToolsFlipcoinsEn flipcoins = _StringsToolsFlipcoinsEn._(_root);
	late final _StringsToolsRandomnumberEn randomnumber = _StringsToolsRandomnumberEn._(_root);
	late final _StringsToolsRandomcolorEn randomcolor = _StringsToolsRandomcolorEn._(_root);
	late final _StringsToolsSshclientEn sshclient = _StringsToolsSshclientEn._(_root);
	late final _StringsToolsWhiteboardEn whiteboard = _StringsToolsWhiteboardEn._(_root);
	late final _StringsToolsNetworkinfoEn networkinfo = _StringsToolsNetworkinfoEn._(_root);
	late final _StringsToolsUuidgeneratorEn uuidgenerator = _StringsToolsUuidgeneratorEn._(_root);
	late final _StringsToolsTexttospeechEn texttospeech = _StringsToolsTexttospeechEn._(_root);
	late final _StringsToolsNearbypublictransportstopsEn nearbypublictransportstops = _StringsToolsNearbypublictransportstopsEn._(_root);
}

// Path: credits
class _StringsCreditsEn {
	_StringsCreditsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Credits';
	String app_icon({required Object author}) => 'App icon by ${author}';
	String app_license({required Object license}) => 'The app is licensed under the ${license} license';
	String tools_icons({required Object author}) => 'Tools icons by ${author}';
	String get contribute_on_github => 'Contribute on GitHub';
	late final _StringsCreditsTranslationsEn translations = _StringsCreditsTranslationsEn._(_root);
}

// Path: tools.clock
class _StringsToolsClockEn {
	_StringsToolsClockEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Clock';
}

// Path: tools.metronome
class _StringsToolsMetronomeEn {
	_StringsToolsMetronomeEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Metronome';
	String get bpm => 'BPM';
	String get beats_per_measure => 'Beats per measure';
	String get start => 'Start';
	String get stop => 'Stop';
}

// Path: tools.megaphone
class _StringsToolsMegaphoneEn {
	_StringsToolsMegaphoneEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Megaphone';
	late final _StringsToolsMegaphoneErrorEn error = _StringsToolsMegaphoneErrorEn._(_root);
}

// Path: tools.nslookup
class _StringsToolsNslookupEn {
	_StringsToolsNslookupEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'NSLookup';
	String get enter_a_domain_name => 'Enter a domain name';
	String get lookup => 'Lookup';
	late final _StringsToolsNslookupErrorEn error = _StringsToolsNslookupErrorEn._(_root);
}

// Path: tools.ping
class _StringsToolsPingEn {
	_StringsToolsPingEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Ping';
	String get ping => 'Ping';
	String get enter_a_domain_name_or_ip => 'Enter a domain name or IP address';
	String reply_from_host_time_ttl({required Object host, required Object time, required Object ttl}) => 'Reply from ${host}: time=${time}ms TTL=${ttl}';
	String x_packets_transmitted_y({required Object transmitted, required Object received}) => '${transmitted} packets transmitted, ${received} packets received';
	late final _StringsToolsPingErrorEn error = _StringsToolsPingErrorEn._(_root);
}

// Path: tools.soundmeter
class _StringsToolsSoundmeterEn {
	_StringsToolsSoundmeterEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Sound meter';
	String get decibels => 'dB';
	late final _StringsToolsSoundmeterErrorEn error = _StringsToolsSoundmeterErrorEn._(_root);
}

// Path: tools.qrreader
class _StringsToolsQrreaderEn {
	_StringsToolsQrreaderEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'QR reader';
	String get scanned => 'Scanned';
	String get openurl => 'Open link';
}

// Path: tools.timer
class _StringsToolsTimerEn {
	_StringsToolsTimerEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Timer';
	String get start => 'Start';
	String get stop => 'Stop';
	String get ios_warning_message => 'For the timer to ring on iOS, you must not quit the application or switch off your iPhone screen. Otherwise iOS will prevent the timer from ringing when it reaches zero.';
}

// Path: tools.stopwatch
class _StringsToolsStopwatchEn {
	_StringsToolsStopwatchEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Stopwatch';
	String get start => 'Start';
	String get stop => 'Stop';
	String get reset => 'Reset';
	String get lap => 'Lap';
}

// Path: tools.roulette
class _StringsToolsRouletteEn {
	_StringsToolsRouletteEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Roulette';
	String get tap_to_roll_info => 'Tap the wheel to roll it';
	String get default_1 => 'Study';
	String get default_2 => 'Play';
	String get default_3 => 'Sleep';
	String get add => 'Add';
	String get remove => 'Remove';
	String get add_item => 'Add an item';
	String get item_name => 'Item name';
	String get remove_an_item => 'Remove an item';
	late final _StringsToolsRouletteWarningEn warning = _StringsToolsRouletteWarningEn._(_root);
}

// Path: tools.flipcoins
class _StringsToolsFlipcoinsEn {
	_StringsToolsFlipcoinsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Flip a coin';
}

// Path: tools.randomnumber
class _StringsToolsRandomnumberEn {
	_StringsToolsRandomnumberEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Random number';
	String get min => 'Min';
	String get max => 'Max';
	late final _StringsToolsRandomnumberErrorEn error = _StringsToolsRandomnumberErrorEn._(_root);
}

// Path: tools.randomcolor
class _StringsToolsRandomcolorEn {
	_StringsToolsRandomcolorEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Random color';
	String get hint => 'Tap the color to change it';
	String get copied_to_clipboard => 'Copied to clipboard';
}

// Path: tools.sshclient
class _StringsToolsSshclientEn {
	_StringsToolsSshclientEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'SSH client';
	String get use_password => 'Use password';
	String get use_ssh_key => 'Use SSH key';
	String get host => 'Host';
	String get port => 'Port';
	String get username => 'Username';
	String get password => 'Password';
	String get connect => 'Connect';
	String get select_private_key => 'Select private key';
	String get no_private_key_selected => 'No private key selected';
	String get passphrase => 'Passphrase (leave empty if none)';
	late final _StringsToolsSshclientErrorEn error = _StringsToolsSshclientErrorEn._(_root);
}

// Path: tools.whiteboard
class _StringsToolsWhiteboardEn {
	_StringsToolsWhiteboardEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Whiteboard';
	String get clear => 'Clear';
	String get undo => 'Undo';
	String get share => 'Share';
	String get share_success => 'Your whiteboard has been shared successfully';
}

// Path: tools.networkinfo
class _StringsToolsNetworkinfoEn {
	_StringsToolsNetworkinfoEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Network info';
	String get loading => 'Loading...';
	String get location_permission_required => 'Location permission is required to get some WiFi info (this is an OS limitation).\nYou could get incorrect info if you don\'t grant it.';
	String get public_ip => 'Public IP address';
	String get local_ip => 'Local IP address';
	String get local_subnet_mask => 'Local network subnet mask';
	String get local_gateway_ip => 'Local network gateway IP';
	String get local_broadcast_ip => 'Local network broadcast IP';
	String get wifi_name => 'WiFi name';
	String get wifi_bssid => 'WiFi BSSID';
	String get not_available_on_ios => 'Not available on iOS';
	String get note_location_permission => 'Note: some information may be incorrect if you didn\'t grant precise location permission.';
}

// Path: tools.uuidgenerator
class _StringsToolsUuidgeneratorEn {
	_StringsToolsUuidgeneratorEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'UUID generator';
	String get generate => 'Generate';
	String get default_uuid_text => 'Press a button to generate a UUID';
	String get copied_to_clipboard => 'Copied to clipboard';
	String get v1_uuid => 'v1 (time-based)';
	String get v4_uuid => 'v4 (random)';
	String get v5_uuid => 'v5 (sha1-based)';
	String get v5_generate_title => 'Generate v5 UUID';
	String get v5_namespace => 'Namespace (leave blank for random)';
	String get v5_name => 'Name (leave blank for none)';
	late final _StringsToolsUuidgeneratorErrorEn error = _StringsToolsUuidgeneratorErrorEn._(_root);
}

// Path: tools.texttospeech
class _StringsToolsTexttospeechEn {
	_StringsToolsTexttospeechEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Text to speech';
	String get choose_a_language => 'Choose a language';
	String get text_to_speak => 'Text to speak';
	String get pitch => 'Pitch';
	String get rate => 'Rate';
	String get play => 'Play';
	String get stop => 'Stop';
	late final _StringsToolsTexttospeechErrorEn error = _StringsToolsTexttospeechErrorEn._(_root);
}

// Path: tools.nearbypublictransportstops
class _StringsToolsNearbypublictransportstopsEn {
	_StringsToolsNearbypublictransportstopsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Nearby transport stops';
	String get refresh => 'Refresh';
	String get data_source => 'Data source';
	String get initial_dialog_title => 'Information';
	String initial_dialog_message({required Object source}) => 'This tool is intended to be used in Switzerland. It uses the data from "${source}"';
	String get data_license_dialog_open => 'Open';
	String get data_license_dialog_title => 'Data source';
	String data_license_dialog_message({required Object source, required Object url}) => 'The data used in this tool comes from "${source}".\n${url}';
	late final _StringsToolsNearbypublictransportstopsErrorEn error = _StringsToolsNearbypublictransportstopsErrorEn._(_root);
}

// Path: credits.translations
class _StringsCreditsTranslationsEn {
	_StringsCreditsTranslationsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Translations';
	String english({required Object author}) => 'English by ${author}';
	String french({required Object author}) => 'French by ${author}';
}

// Path: tools.megaphone.error
class _StringsToolsMegaphoneErrorEn {
	_StringsToolsMegaphoneErrorEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get microphone_permission_denied => 'Permission denied, please allow the application to access the microphone in your device settings';
}

// Path: tools.nslookup.error
class _StringsToolsNslookupErrorEn {
	_StringsToolsNslookupErrorEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get please_enter_a_domain_name => 'Please enter a domain name';
	String get no_address_associated_with_domain => 'There is no address associated with the host name.\nCheck your input and your internet connection then try again.';
}

// Path: tools.ping.error
class _StringsToolsPingErrorEn {
	_StringsToolsPingErrorEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get please_enter_a_domain_name_or_ip => 'Please enter a domain name or IP address';
	String get request_timeout => 'Request timeout';
	String get unkown_host => 'Unknown host';
	String get no_reply => 'No reply';
	String get unkown_error => 'Unknown error';
}

// Path: tools.soundmeter.error
class _StringsToolsSoundmeterErrorEn {
	_StringsToolsSoundmeterErrorEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get impossible_to_start_the_sound_meter => 'Impossible to start the sound meter';
	String get no_sound_detected => 'No sound detected, check that the application has access to the microphone in the settings of your device.';
}

// Path: tools.roulette.warning
class _StringsToolsRouletteWarningEn {
	_StringsToolsRouletteWarningEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String you_cant_add_more_than_x_items({required Object numberOfItems}) => 'You can\'t have more than ${numberOfItems} items in the roulette.';
	String you_must_have_at_least_x_items({required Object numberOfItems}) => 'You must have at least ${numberOfItems} items in the roulette.';
	String get you_must_enter_an_item_name => 'You must enter an item name.';
}

// Path: tools.randomnumber.error
class _StringsToolsRandomnumberErrorEn {
	_StringsToolsRandomnumberErrorEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get invalid_number => 'Invalid number, please try again.';
	String get min_must_be_lower_than_max => 'The minimum number must be lower than the maximum number.';
	String min_and_max_must_be_between_x_and_y({required Object minNumberLimit, required Object maxNumberLimit}) => 'The minimum and maximum numbers must be between ${minNumberLimit} and ${maxNumberLimit}.';
}

// Path: tools.sshclient.error
class _StringsToolsSshclientErrorEn {
	_StringsToolsSshclientErrorEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get invalid_port => 'Invalid port';
	String get invalid_passphrase => 'You may have entered a passphrase when your key is not encrypted, or vice versa';
	String get invalid_private_key => 'The key you provided is not a valid private key';
	String get authentication_failed => 'Authentication failed';
	String get connection_failed => 'Could not connect to host';
	String get unknown_error => 'An unknown error occurred. Please try again';
}

// Path: tools.uuidgenerator.error
class _StringsToolsUuidgeneratorErrorEn {
	_StringsToolsUuidgeneratorErrorEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get invalid_namespace => 'The namespace is not a valid UUID';
}

// Path: tools.texttospeech.error
class _StringsToolsTexttospeechErrorEn {
	_StringsToolsTexttospeechErrorEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get please_try_again => 'Please try again later.\nIf it\'s the first time you\'re using this language, please wait a few seconds and try again.';
	String get please_select_a_language => 'Please select a language';
}

// Path: tools.nearbypublictransportstops.error
class _StringsToolsNearbypublictransportstopsErrorEn {
	_StringsToolsNearbypublictransportstopsErrorEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get location_permission_denied => 'Location permission denied, please enable it in settings in order to to make full use of this tool.';
	String get download_stops_failed => 'Failed to download stops, you need to be connected to the internet to download stops for the first time or to update them.';
	String get read_stops_failed => 'Failed to read stops, please try again later with an active internet connection.';
	String get parse_stops_failed => 'Failed to parse stops, please try again later with an active internet connection.';
}

// Path: <root>
class _StringsFr implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsFr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsFr _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsGenericFr generic = _StringsGenericFr._(_root);
	@override late final _StringsToolsFr tools = _StringsToolsFr._(_root);
	@override late final _StringsCreditsFr credits = _StringsCreditsFr._(_root);
}

// Path: generic
class _StringsGenericFr implements _StringsGenericEn {
	_StringsGenericFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get app_name => 'Toolbox';
	@override String get error => 'Erreur';
	@override String get warning => 'Attention';
	@override String get ok => 'OK';
	@override String get cancel => 'Annuler';
	@override String get search => 'Rechercher';
}

// Path: tools
class _StringsToolsFr implements _StringsToolsEn {
	_StringsToolsFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override late final _StringsToolsClockFr clock = _StringsToolsClockFr._(_root);
	@override late final _StringsToolsMetronomeFr metronome = _StringsToolsMetronomeFr._(_root);
	@override late final _StringsToolsMegaphoneFr megaphone = _StringsToolsMegaphoneFr._(_root);
	@override late final _StringsToolsNslookupFr nslookup = _StringsToolsNslookupFr._(_root);
	@override late final _StringsToolsPingFr ping = _StringsToolsPingFr._(_root);
	@override late final _StringsToolsSoundmeterFr soundmeter = _StringsToolsSoundmeterFr._(_root);
	@override late final _StringsToolsQrreaderFr qrreader = _StringsToolsQrreaderFr._(_root);
	@override late final _StringsToolsTimerFr timer = _StringsToolsTimerFr._(_root);
	@override late final _StringsToolsStopwatchFr stopwatch = _StringsToolsStopwatchFr._(_root);
	@override late final _StringsToolsRouletteFr roulette = _StringsToolsRouletteFr._(_root);
	@override late final _StringsToolsFlipcoinsFr flipcoins = _StringsToolsFlipcoinsFr._(_root);
	@override late final _StringsToolsRandomnumberFr randomnumber = _StringsToolsRandomnumberFr._(_root);
	@override late final _StringsToolsRandomcolorFr randomcolor = _StringsToolsRandomcolorFr._(_root);
	@override late final _StringsToolsSshclientFr sshclient = _StringsToolsSshclientFr._(_root);
	@override late final _StringsToolsWhiteboardFr whiteboard = _StringsToolsWhiteboardFr._(_root);
	@override late final _StringsToolsNetworkinfoFr networkinfo = _StringsToolsNetworkinfoFr._(_root);
	@override late final _StringsToolsUuidgeneratorFr uuidgenerator = _StringsToolsUuidgeneratorFr._(_root);
	@override late final _StringsToolsTexttospeechFr texttospeech = _StringsToolsTexttospeechFr._(_root);
	@override late final _StringsToolsNearbypublictransportstopsFr nearbypublictransportstops = _StringsToolsNearbypublictransportstopsFr._(_root);
}

// Path: credits
class _StringsCreditsFr implements _StringsCreditsEn {
	_StringsCreditsFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Crédits';
	@override String app_icon({required Object author}) => 'Icône de l\'application par ${author}';
	@override String app_license({required Object license}) => 'Application sous licence ${license}';
	@override String tools_icons({required Object author}) => 'Icônes des outils par ${author}';
	@override String get contribute_on_github => 'Contribuez sur GitHub';
	@override late final _StringsCreditsTranslationsFr translations = _StringsCreditsTranslationsFr._(_root);
}

// Path: tools.clock
class _StringsToolsClockFr implements _StringsToolsClockEn {
	_StringsToolsClockFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Horloge';
}

// Path: tools.metronome
class _StringsToolsMetronomeFr implements _StringsToolsMetronomeEn {
	_StringsToolsMetronomeFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Métronome';
	@override String get bpm => 'BPM';
	@override String get beats_per_measure => 'Battements par mesure';
	@override String get start => 'Démarrer';
	@override String get stop => 'Arrêter';
}

// Path: tools.megaphone
class _StringsToolsMegaphoneFr implements _StringsToolsMegaphoneEn {
	_StringsToolsMegaphoneFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mégaphone';
	@override late final _StringsToolsMegaphoneErrorFr error = _StringsToolsMegaphoneErrorFr._(_root);
}

// Path: tools.nslookup
class _StringsToolsNslookupFr implements _StringsToolsNslookupEn {
	_StringsToolsNslookupFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'NSLookup';
	@override String get enter_a_domain_name => 'Entrez un nom de domaine';
	@override String get lookup => 'Rechercher';
	@override late final _StringsToolsNslookupErrorFr error = _StringsToolsNslookupErrorFr._(_root);
}

// Path: tools.ping
class _StringsToolsPingFr implements _StringsToolsPingEn {
	_StringsToolsPingFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ping';
	@override String get ping => 'Ping';
	@override String get enter_a_domain_name_or_ip => 'Entrez un nom de domaine ou une adresse IP';
	@override String reply_from_host_time_ttl({required Object host, required Object time, required Object ttl}) => 'Réponse de ${host} : temps=${time}ms TTL=${ttl}';
	@override String x_packets_transmitted_y({required Object transmitted, required Object received}) => '${transmitted} paquets transmis, ${received} paquets reçus';
	@override late final _StringsToolsPingErrorFr error = _StringsToolsPingErrorFr._(_root);
}

// Path: tools.soundmeter
class _StringsToolsSoundmeterFr implements _StringsToolsSoundmeterEn {
	_StringsToolsSoundmeterFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sonomètre';
	@override String get decibels => 'dB';
	@override late final _StringsToolsSoundmeterErrorFr error = _StringsToolsSoundmeterErrorFr._(_root);
}

// Path: tools.qrreader
class _StringsToolsQrreaderFr implements _StringsToolsQrreaderEn {
	_StringsToolsQrreaderFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lecteur de QR';
	@override String get scanned => 'Scanné';
	@override String get openurl => 'Ouvrir le lien';
}

// Path: tools.timer
class _StringsToolsTimerFr implements _StringsToolsTimerEn {
	_StringsToolsTimerFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Minuteur';
	@override String get start => 'Démarrer';
	@override String get stop => 'Arrêter';
	@override String get ios_warning_message => 'Pour que le minuteur sonne sur iOS, vous ne devez pas quitter l\'application ni éteindre l\'écran de votre iPhone. Sinon, iOS empêchera le minuteur de sonner lorsqu\'il atteindra zéro.';
}

// Path: tools.stopwatch
class _StringsToolsStopwatchFr implements _StringsToolsStopwatchEn {
	_StringsToolsStopwatchFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chronomètre';
	@override String get start => 'Go';
	@override String get stop => 'Stop';
	@override String get reset => 'Effacer';
	@override String get lap => 'Tour';
}

// Path: tools.roulette
class _StringsToolsRouletteFr implements _StringsToolsRouletteEn {
	_StringsToolsRouletteFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Roulette';
	@override String get tap_to_roll_info => 'Touchez la roue pour la faire tourner';
	@override String get default_1 => 'Étudier';
	@override String get default_2 => 'Jouer';
	@override String get default_3 => 'Dormir';
	@override String get add => 'Ajouter';
	@override String get remove => 'Supprimer';
	@override String get add_item => 'Ajouter un item';
	@override String get item_name => 'Nom de l\'item';
	@override String get remove_an_item => 'Supprimer un item';
	@override late final _StringsToolsRouletteWarningFr warning = _StringsToolsRouletteWarningFr._(_root);
}

// Path: tools.flipcoins
class _StringsToolsFlipcoinsFr implements _StringsToolsFlipcoinsEn {
	_StringsToolsFlipcoinsFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pile ou face';
}

// Path: tools.randomnumber
class _StringsToolsRandomnumberFr implements _StringsToolsRandomnumberEn {
	_StringsToolsRandomnumberFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nombre aléatoire';
	@override String get min => 'Min';
	@override String get max => 'Max';
	@override late final _StringsToolsRandomnumberErrorFr error = _StringsToolsRandomnumberErrorFr._(_root);
}

// Path: tools.randomcolor
class _StringsToolsRandomcolorFr implements _StringsToolsRandomcolorEn {
	_StringsToolsRandomcolorFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Couleur aléatoire';
	@override String get hint => 'Toucher la couleur pour la changer';
	@override String get copied_to_clipboard => 'Copié dans le presse-papier';
}

// Path: tools.sshclient
class _StringsToolsSshclientFr implements _StringsToolsSshclientEn {
	_StringsToolsSshclientFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Client SSH';
	@override String get use_password => 'Utiliser un mot de passe';
	@override String get use_ssh_key => 'Utiliser une clé SSH';
	@override String get host => 'Hôte';
	@override String get port => 'Port';
	@override String get username => 'Nom d\'utilisateur';
	@override String get password => 'Mot de passe';
	@override String get connect => 'Se connecter';
	@override String get select_private_key => 'Sélectionner une clé privée';
	@override String get no_private_key_selected => 'Aucune clé privée sélectionnée';
	@override String get passphrase => 'Phrase secrète (laisser vide si aucune)';
	@override late final _StringsToolsSshclientErrorFr error = _StringsToolsSshclientErrorFr._(_root);
}

// Path: tools.whiteboard
class _StringsToolsWhiteboardFr implements _StringsToolsWhiteboardEn {
	_StringsToolsWhiteboardFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tableau blanc';
	@override String get clear => 'Effacer';
	@override String get undo => 'Annuler';
	@override String get share => 'Partager';
	@override String get share_success => 'Votre tableau blanc a été partagé avec succès';
}

// Path: tools.networkinfo
class _StringsToolsNetworkinfoFr implements _StringsToolsNetworkinfoEn {
	_StringsToolsNetworkinfoFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Informations réseau';
	@override String get loading => 'Chargement...';
	@override String get location_permission_required => 'La permission de localisation est nécessaire pour obtenir certaines informations sur le WiFi (il s\'agit d\'une limitation du système d\'exploitation).\nVous risquez d\'obtenir des informations erronées si vous ne l\'autorisez pas.';
	@override String get public_ip => 'Adresse IP publique';
	@override String get local_ip => 'Adresse IP locale';
	@override String get local_subnet_mask => 'Masque de sous-réseau local';
	@override String get local_gateway_ip => 'Adresse IP de passerelle locale';
	@override String get local_broadcast_ip => 'Adresse IP de diffusion locale';
	@override String get wifi_name => 'Nom du WiFi';
	@override String get wifi_bssid => 'BSSID du WiFi';
	@override String get not_available_on_ios => 'Non disponible sur iOS';
	@override String get note_location_permission => 'Remarque : certaines informations peuvent être incorrectes si vous n\'avez pas autorisé la permission de localisation précise.';
}

// Path: tools.uuidgenerator
class _StringsToolsUuidgeneratorFr implements _StringsToolsUuidgeneratorEn {
	_StringsToolsUuidgeneratorFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Générateur d\'UUID';
	@override String get generate => 'Générer';
	@override String get default_uuid_text => 'Appuyer sur un bouton pour générer un UUID';
	@override String get copied_to_clipboard => 'Copié dans le presse-papiers';
	@override String get v1_uuid => 'v1 (basé sur le temps)';
	@override String get v4_uuid => 'v4 (aléatoire)';
	@override String get v5_uuid => 'v5 (basé sur sha1)';
	@override String get v5_generate_title => 'Générer un UUID v5';
	@override String get v5_namespace => 'Espace de noms (laisser vide pour aléatoire)';
	@override String get v5_name => 'Nom (laisser vide si aucun)';
	@override late final _StringsToolsUuidgeneratorErrorFr error = _StringsToolsUuidgeneratorErrorFr._(_root);
}

// Path: tools.texttospeech
class _StringsToolsTexttospeechFr implements _StringsToolsTexttospeechEn {
	_StringsToolsTexttospeechFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Synthèse vocale';
	@override String get choose_a_language => 'Choisir une langue';
	@override String get text_to_speak => 'Texte à prononcer';
	@override String get pitch => 'Hauteur';
	@override String get rate => 'Débit';
	@override String get play => 'Play';
	@override String get stop => 'Stop';
	@override late final _StringsToolsTexttospeechErrorFr error = _StringsToolsTexttospeechErrorFr._(_root);
}

// Path: tools.nearbypublictransportstops
class _StringsToolsNearbypublictransportstopsFr implements _StringsToolsNearbypublictransportstopsEn {
	_StringsToolsNearbypublictransportstopsFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Arrêts de transport';
	@override String get refresh => 'Rafraîchir';
	@override String get data_source => 'Source des données';
	@override String get initial_dialog_title => 'Information';
	@override String initial_dialog_message({required Object source}) => 'Cet outil est destiné à être utilisé en Suisse. Il utilise les données de "${source}"';
	@override String get data_license_dialog_open => 'Ouvrir';
	@override String get data_license_dialog_title => 'Source des données';
	@override String data_license_dialog_message({required Object source, required Object url}) => 'Les données utilisées dans cet outil proviennent de "${source}".\n${url}';
	@override late final _StringsToolsNearbypublictransportstopsErrorFr error = _StringsToolsNearbypublictransportstopsErrorFr._(_root);
}

// Path: credits.translations
class _StringsCreditsTranslationsFr implements _StringsCreditsTranslationsEn {
	_StringsCreditsTranslationsFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Traductions';
	@override String english({required Object author}) => 'Anglais par ${author}';
	@override String french({required Object author}) => 'Français par ${author}';
}

// Path: tools.megaphone.error
class _StringsToolsMegaphoneErrorFr implements _StringsToolsMegaphoneErrorEn {
	_StringsToolsMegaphoneErrorFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get microphone_permission_denied => 'Permission refusée, veuillez autoriser l\'application à accéder au micro dans les paramètres de votre appareil';
}

// Path: tools.nslookup.error
class _StringsToolsNslookupErrorFr implements _StringsToolsNslookupErrorEn {
	_StringsToolsNslookupErrorFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get please_enter_a_domain_name => 'Veuillez entrer un nom de domaine';
	@override String get no_address_associated_with_domain => 'Aucune adresse IP n\'est associée au nom d\'hôte.\nVérifiez votre saisie et votre connexion internet puis réessayez.';
}

// Path: tools.ping.error
class _StringsToolsPingErrorFr implements _StringsToolsPingErrorEn {
	_StringsToolsPingErrorFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get please_enter_a_domain_name_or_ip => 'Veuillez entrer un nom de domaine ou une adresse IP';
	@override String get request_timeout => 'Délai d\'attente de la demande dépassé';
	@override String get unkown_host => 'Hôte inconnu';
	@override String get no_reply => 'Pas de réponse';
	@override String get unkown_error => 'Erreur inconnue';
}

// Path: tools.soundmeter.error
class _StringsToolsSoundmeterErrorFr implements _StringsToolsSoundmeterErrorEn {
	_StringsToolsSoundmeterErrorFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get impossible_to_start_the_sound_meter => 'Impossible de démarrer le sonomètre';
	@override String get no_sound_detected => 'Aucun son détecté, vérifiez que l\'application a accès au micro dans les paramètres de votre appareil.';
}

// Path: tools.roulette.warning
class _StringsToolsRouletteWarningFr implements _StringsToolsRouletteWarningEn {
	_StringsToolsRouletteWarningFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String you_cant_add_more_than_x_items({required Object numberOfItems}) => 'Vous ne pouvez pas ajouter plus de ${numberOfItems} items dans la roulette';
	@override String you_must_have_at_least_x_items({required Object numberOfItems}) => 'Vous devez avoir au moins ${numberOfItems} items dans la roulette';
	@override String get you_must_enter_an_item_name => 'Vous devez entrer un nom d\'item';
}

// Path: tools.randomnumber.error
class _StringsToolsRandomnumberErrorFr implements _StringsToolsRandomnumberErrorEn {
	_StringsToolsRandomnumberErrorFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get invalid_number => 'Nombre invalide, veuillez réessayer.';
	@override String get min_must_be_lower_than_max => 'Le nombre minimum doit être inférieur au nombre maximum.';
	@override String min_and_max_must_be_between_x_and_y({required Object minNumberLimit, required Object maxNumberLimit}) => 'Les nombres minimum et maximum doivent être compris entre ${minNumberLimit} et ${maxNumberLimit}.';
}

// Path: tools.sshclient.error
class _StringsToolsSshclientErrorFr implements _StringsToolsSshclientErrorEn {
	_StringsToolsSshclientErrorFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get invalid_port => 'Port invalide';
	@override String get invalid_passphrase => 'Vous avez peut-être saisi une phrase de passe alors que votre clé n\'est pas cryptée, ou inversement';
	@override String get invalid_private_key => 'La clé que vous avez fournie n\'est pas une clé privée valide';
	@override String get authentication_failed => 'Échec de l\'authentification';
	@override String get connection_failed => 'Impossible de se connecter à l\'hôte';
	@override String get unknown_error => 'Une erreur inconnue s\'est produite, veuillez réessayer';
}

// Path: tools.uuidgenerator.error
class _StringsToolsUuidgeneratorErrorFr implements _StringsToolsUuidgeneratorErrorEn {
	_StringsToolsUuidgeneratorErrorFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get invalid_namespace => 'L\'espace de noms n\'est pas un UUID valide';
}

// Path: tools.texttospeech.error
class _StringsToolsTexttospeechErrorFr implements _StringsToolsTexttospeechErrorEn {
	_StringsToolsTexttospeechErrorFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get please_try_again => 'Veuillez réessayer plus tard.\nSi vous utilisez cette langue pour la première fois, veuillez patienter quelques secondes et réessayer.';
	@override String get please_select_a_language => 'Veuillez sélectionner une langue';
}

// Path: tools.nearbypublictransportstops.error
class _StringsToolsNearbypublictransportstopsErrorFr implements _StringsToolsNearbypublictransportstopsErrorEn {
	_StringsToolsNearbypublictransportstopsErrorFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get location_permission_denied => 'La permission de localisation a été refusée, veuillez l\'activer dans les paramètres afin d\'utiliser pleinement cet outil.';
	@override String get download_stops_failed => 'Échec du téléchargement des arrêts, vous devez être connecté à internet pour télécharger les arrêts pour la première fois ou pour les mettre à jour.';
	@override String get read_stops_failed => 'La lecture des arrêts a échoué, veuillez réessayer plus tard avec une connexion internet active.';
	@override String get parse_stops_failed => 'Le traitement des arrêts a échoué, veuillez réessayer plus tard avec une connexion Internet active.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'generic.app_name': return 'Toolbox';
			case 'generic.error': return 'Error';
			case 'generic.warning': return 'Warning';
			case 'generic.ok': return 'OK';
			case 'generic.cancel': return 'Cancel';
			case 'generic.search': return 'Search';
			case 'tools.clock.title': return 'Clock';
			case 'tools.metronome.title': return 'Metronome';
			case 'tools.metronome.bpm': return 'BPM';
			case 'tools.metronome.beats_per_measure': return 'Beats per measure';
			case 'tools.metronome.start': return 'Start';
			case 'tools.metronome.stop': return 'Stop';
			case 'tools.megaphone.title': return 'Megaphone';
			case 'tools.megaphone.error.microphone_permission_denied': return 'Permission denied, please allow the application to access the microphone in your device settings';
			case 'tools.nslookup.title': return 'NSLookup';
			case 'tools.nslookup.enter_a_domain_name': return 'Enter a domain name';
			case 'tools.nslookup.lookup': return 'Lookup';
			case 'tools.nslookup.error.please_enter_a_domain_name': return 'Please enter a domain name';
			case 'tools.nslookup.error.no_address_associated_with_domain': return 'There is no address associated with the host name.\nCheck your input and your internet connection then try again.';
			case 'tools.ping.title': return 'Ping';
			case 'tools.ping.ping': return 'Ping';
			case 'tools.ping.enter_a_domain_name_or_ip': return 'Enter a domain name or IP address';
			case 'tools.ping.reply_from_host_time_ttl': return ({required Object host, required Object time, required Object ttl}) => 'Reply from ${host}: time=${time}ms TTL=${ttl}';
			case 'tools.ping.x_packets_transmitted_y': return ({required Object transmitted, required Object received}) => '${transmitted} packets transmitted, ${received} packets received';
			case 'tools.ping.error.please_enter_a_domain_name_or_ip': return 'Please enter a domain name or IP address';
			case 'tools.ping.error.request_timeout': return 'Request timeout';
			case 'tools.ping.error.unkown_host': return 'Unknown host';
			case 'tools.ping.error.no_reply': return 'No reply';
			case 'tools.ping.error.unkown_error': return 'Unknown error';
			case 'tools.soundmeter.title': return 'Sound meter';
			case 'tools.soundmeter.decibels': return 'dB';
			case 'tools.soundmeter.error.impossible_to_start_the_sound_meter': return 'Impossible to start the sound meter';
			case 'tools.soundmeter.error.no_sound_detected': return 'No sound detected, check that the application has access to the microphone in the settings of your device.';
			case 'tools.qrreader.title': return 'QR reader';
			case 'tools.qrreader.scanned': return 'Scanned';
			case 'tools.qrreader.openurl': return 'Open link';
			case 'tools.timer.title': return 'Timer';
			case 'tools.timer.start': return 'Start';
			case 'tools.timer.stop': return 'Stop';
			case 'tools.timer.ios_warning_message': return 'For the timer to ring on iOS, you must not quit the application or switch off your iPhone screen. Otherwise iOS will prevent the timer from ringing when it reaches zero.';
			case 'tools.stopwatch.title': return 'Stopwatch';
			case 'tools.stopwatch.start': return 'Start';
			case 'tools.stopwatch.stop': return 'Stop';
			case 'tools.stopwatch.reset': return 'Reset';
			case 'tools.stopwatch.lap': return 'Lap';
			case 'tools.roulette.title': return 'Roulette';
			case 'tools.roulette.tap_to_roll_info': return 'Tap the wheel to roll it';
			case 'tools.roulette.default_1': return 'Study';
			case 'tools.roulette.default_2': return 'Play';
			case 'tools.roulette.default_3': return 'Sleep';
			case 'tools.roulette.add': return 'Add';
			case 'tools.roulette.remove': return 'Remove';
			case 'tools.roulette.add_item': return 'Add an item';
			case 'tools.roulette.item_name': return 'Item name';
			case 'tools.roulette.remove_an_item': return 'Remove an item';
			case 'tools.roulette.warning.you_cant_add_more_than_x_items': return ({required Object numberOfItems}) => 'You can\'t have more than ${numberOfItems} items in the roulette.';
			case 'tools.roulette.warning.you_must_have_at_least_x_items': return ({required Object numberOfItems}) => 'You must have at least ${numberOfItems} items in the roulette.';
			case 'tools.roulette.warning.you_must_enter_an_item_name': return 'You must enter an item name.';
			case 'tools.flipcoins.title': return 'Flip a coin';
			case 'tools.randomnumber.title': return 'Random number';
			case 'tools.randomnumber.min': return 'Min';
			case 'tools.randomnumber.max': return 'Max';
			case 'tools.randomnumber.error.invalid_number': return 'Invalid number, please try again.';
			case 'tools.randomnumber.error.min_must_be_lower_than_max': return 'The minimum number must be lower than the maximum number.';
			case 'tools.randomnumber.error.min_and_max_must_be_between_x_and_y': return ({required Object minNumberLimit, required Object maxNumberLimit}) => 'The minimum and maximum numbers must be between ${minNumberLimit} and ${maxNumberLimit}.';
			case 'tools.randomcolor.title': return 'Random color';
			case 'tools.randomcolor.hint': return 'Tap the color to change it';
			case 'tools.randomcolor.copied_to_clipboard': return 'Copied to clipboard';
			case 'tools.sshclient.title': return 'SSH client';
			case 'tools.sshclient.use_password': return 'Use password';
			case 'tools.sshclient.use_ssh_key': return 'Use SSH key';
			case 'tools.sshclient.host': return 'Host';
			case 'tools.sshclient.port': return 'Port';
			case 'tools.sshclient.username': return 'Username';
			case 'tools.sshclient.password': return 'Password';
			case 'tools.sshclient.connect': return 'Connect';
			case 'tools.sshclient.select_private_key': return 'Select private key';
			case 'tools.sshclient.no_private_key_selected': return 'No private key selected';
			case 'tools.sshclient.passphrase': return 'Passphrase (leave empty if none)';
			case 'tools.sshclient.error.invalid_port': return 'Invalid port';
			case 'tools.sshclient.error.invalid_passphrase': return 'You may have entered a passphrase when your key is not encrypted, or vice versa';
			case 'tools.sshclient.error.invalid_private_key': return 'The key you provided is not a valid private key';
			case 'tools.sshclient.error.authentication_failed': return 'Authentication failed';
			case 'tools.sshclient.error.connection_failed': return 'Could not connect to host';
			case 'tools.sshclient.error.unknown_error': return 'An unknown error occurred. Please try again';
			case 'tools.whiteboard.title': return 'Whiteboard';
			case 'tools.whiteboard.clear': return 'Clear';
			case 'tools.whiteboard.undo': return 'Undo';
			case 'tools.whiteboard.share': return 'Share';
			case 'tools.whiteboard.share_success': return 'Your whiteboard has been shared successfully';
			case 'tools.networkinfo.title': return 'Network info';
			case 'tools.networkinfo.loading': return 'Loading...';
			case 'tools.networkinfo.location_permission_required': return 'Location permission is required to get some WiFi info (this is an OS limitation).\nYou could get incorrect info if you don\'t grant it.';
			case 'tools.networkinfo.public_ip': return 'Public IP address';
			case 'tools.networkinfo.local_ip': return 'Local IP address';
			case 'tools.networkinfo.local_subnet_mask': return 'Local network subnet mask';
			case 'tools.networkinfo.local_gateway_ip': return 'Local network gateway IP';
			case 'tools.networkinfo.local_broadcast_ip': return 'Local network broadcast IP';
			case 'tools.networkinfo.wifi_name': return 'WiFi name';
			case 'tools.networkinfo.wifi_bssid': return 'WiFi BSSID';
			case 'tools.networkinfo.not_available_on_ios': return 'Not available on iOS';
			case 'tools.networkinfo.note_location_permission': return 'Note: some information may be incorrect if you didn\'t grant precise location permission.';
			case 'tools.uuidgenerator.title': return 'UUID generator';
			case 'tools.uuidgenerator.generate': return 'Generate';
			case 'tools.uuidgenerator.default_uuid_text': return 'Press a button to generate a UUID';
			case 'tools.uuidgenerator.copied_to_clipboard': return 'Copied to clipboard';
			case 'tools.uuidgenerator.v1_uuid': return 'v1 (time-based)';
			case 'tools.uuidgenerator.v4_uuid': return 'v4 (random)';
			case 'tools.uuidgenerator.v5_uuid': return 'v5 (sha1-based)';
			case 'tools.uuidgenerator.v5_generate_title': return 'Generate v5 UUID';
			case 'tools.uuidgenerator.v5_namespace': return 'Namespace (leave blank for random)';
			case 'tools.uuidgenerator.v5_name': return 'Name (leave blank for none)';
			case 'tools.uuidgenerator.error.invalid_namespace': return 'The namespace is not a valid UUID';
			case 'tools.texttospeech.title': return 'Text to speech';
			case 'tools.texttospeech.choose_a_language': return 'Choose a language';
			case 'tools.texttospeech.text_to_speak': return 'Text to speak';
			case 'tools.texttospeech.pitch': return 'Pitch';
			case 'tools.texttospeech.rate': return 'Rate';
			case 'tools.texttospeech.play': return 'Play';
			case 'tools.texttospeech.stop': return 'Stop';
			case 'tools.texttospeech.error.please_try_again': return 'Please try again later.\nIf it\'s the first time you\'re using this language, please wait a few seconds and try again.';
			case 'tools.texttospeech.error.please_select_a_language': return 'Please select a language';
			case 'tools.nearbypublictransportstops.title': return 'Nearby transport stops';
			case 'tools.nearbypublictransportstops.refresh': return 'Refresh';
			case 'tools.nearbypublictransportstops.data_source': return 'Data source';
			case 'tools.nearbypublictransportstops.initial_dialog_title': return 'Information';
			case 'tools.nearbypublictransportstops.initial_dialog_message': return ({required Object source}) => 'This tool is intended to be used in Switzerland. It uses the data from "${source}"';
			case 'tools.nearbypublictransportstops.data_license_dialog_open': return 'Open';
			case 'tools.nearbypublictransportstops.data_license_dialog_title': return 'Data source';
			case 'tools.nearbypublictransportstops.data_license_dialog_message': return ({required Object source, required Object url}) => 'The data used in this tool comes from "${source}".\n${url}';
			case 'tools.nearbypublictransportstops.error.location_permission_denied': return 'Location permission denied, please enable it in settings in order to to make full use of this tool.';
			case 'tools.nearbypublictransportstops.error.download_stops_failed': return 'Failed to download stops, you need to be connected to the internet to download stops for the first time or to update them.';
			case 'tools.nearbypublictransportstops.error.read_stops_failed': return 'Failed to read stops, please try again later with an active internet connection.';
			case 'tools.nearbypublictransportstops.error.parse_stops_failed': return 'Failed to parse stops, please try again later with an active internet connection.';
			case 'credits.title': return 'Credits';
			case 'credits.app_icon': return ({required Object author}) => 'App icon by ${author}';
			case 'credits.app_license': return ({required Object license}) => 'The app is licensed under the ${license} license';
			case 'credits.tools_icons': return ({required Object author}) => 'Tools icons by ${author}';
			case 'credits.contribute_on_github': return 'Contribute on GitHub';
			case 'credits.translations.title': return 'Translations';
			case 'credits.translations.english': return ({required Object author}) => 'English by ${author}';
			case 'credits.translations.french': return ({required Object author}) => 'French by ${author}';
			default: return null;
		}
	}
}

extension on _StringsFr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'generic.app_name': return 'Toolbox';
			case 'generic.error': return 'Erreur';
			case 'generic.warning': return 'Attention';
			case 'generic.ok': return 'OK';
			case 'generic.cancel': return 'Annuler';
			case 'generic.search': return 'Rechercher';
			case 'tools.clock.title': return 'Horloge';
			case 'tools.metronome.title': return 'Métronome';
			case 'tools.metronome.bpm': return 'BPM';
			case 'tools.metronome.beats_per_measure': return 'Battements par mesure';
			case 'tools.metronome.start': return 'Démarrer';
			case 'tools.metronome.stop': return 'Arrêter';
			case 'tools.megaphone.title': return 'Mégaphone';
			case 'tools.megaphone.error.microphone_permission_denied': return 'Permission refusée, veuillez autoriser l\'application à accéder au micro dans les paramètres de votre appareil';
			case 'tools.nslookup.title': return 'NSLookup';
			case 'tools.nslookup.enter_a_domain_name': return 'Entrez un nom de domaine';
			case 'tools.nslookup.lookup': return 'Rechercher';
			case 'tools.nslookup.error.please_enter_a_domain_name': return 'Veuillez entrer un nom de domaine';
			case 'tools.nslookup.error.no_address_associated_with_domain': return 'Aucune adresse IP n\'est associée au nom d\'hôte.\nVérifiez votre saisie et votre connexion internet puis réessayez.';
			case 'tools.ping.title': return 'Ping';
			case 'tools.ping.ping': return 'Ping';
			case 'tools.ping.enter_a_domain_name_or_ip': return 'Entrez un nom de domaine ou une adresse IP';
			case 'tools.ping.reply_from_host_time_ttl': return ({required Object host, required Object time, required Object ttl}) => 'Réponse de ${host} : temps=${time}ms TTL=${ttl}';
			case 'tools.ping.x_packets_transmitted_y': return ({required Object transmitted, required Object received}) => '${transmitted} paquets transmis, ${received} paquets reçus';
			case 'tools.ping.error.please_enter_a_domain_name_or_ip': return 'Veuillez entrer un nom de domaine ou une adresse IP';
			case 'tools.ping.error.request_timeout': return 'Délai d\'attente de la demande dépassé';
			case 'tools.ping.error.unkown_host': return 'Hôte inconnu';
			case 'tools.ping.error.no_reply': return 'Pas de réponse';
			case 'tools.ping.error.unkown_error': return 'Erreur inconnue';
			case 'tools.soundmeter.title': return 'Sonomètre';
			case 'tools.soundmeter.decibels': return 'dB';
			case 'tools.soundmeter.error.impossible_to_start_the_sound_meter': return 'Impossible de démarrer le sonomètre';
			case 'tools.soundmeter.error.no_sound_detected': return 'Aucun son détecté, vérifiez que l\'application a accès au micro dans les paramètres de votre appareil.';
			case 'tools.qrreader.title': return 'Lecteur de QR';
			case 'tools.qrreader.scanned': return 'Scanné';
			case 'tools.qrreader.openurl': return 'Ouvrir le lien';
			case 'tools.timer.title': return 'Minuteur';
			case 'tools.timer.start': return 'Démarrer';
			case 'tools.timer.stop': return 'Arrêter';
			case 'tools.timer.ios_warning_message': return 'Pour que le minuteur sonne sur iOS, vous ne devez pas quitter l\'application ni éteindre l\'écran de votre iPhone. Sinon, iOS empêchera le minuteur de sonner lorsqu\'il atteindra zéro.';
			case 'tools.stopwatch.title': return 'Chronomètre';
			case 'tools.stopwatch.start': return 'Go';
			case 'tools.stopwatch.stop': return 'Stop';
			case 'tools.stopwatch.reset': return 'Effacer';
			case 'tools.stopwatch.lap': return 'Tour';
			case 'tools.roulette.title': return 'Roulette';
			case 'tools.roulette.tap_to_roll_info': return 'Touchez la roue pour la faire tourner';
			case 'tools.roulette.default_1': return 'Étudier';
			case 'tools.roulette.default_2': return 'Jouer';
			case 'tools.roulette.default_3': return 'Dormir';
			case 'tools.roulette.add': return 'Ajouter';
			case 'tools.roulette.remove': return 'Supprimer';
			case 'tools.roulette.add_item': return 'Ajouter un item';
			case 'tools.roulette.item_name': return 'Nom de l\'item';
			case 'tools.roulette.remove_an_item': return 'Supprimer un item';
			case 'tools.roulette.warning.you_cant_add_more_than_x_items': return ({required Object numberOfItems}) => 'Vous ne pouvez pas ajouter plus de ${numberOfItems} items dans la roulette';
			case 'tools.roulette.warning.you_must_have_at_least_x_items': return ({required Object numberOfItems}) => 'Vous devez avoir au moins ${numberOfItems} items dans la roulette';
			case 'tools.roulette.warning.you_must_enter_an_item_name': return 'Vous devez entrer un nom d\'item';
			case 'tools.flipcoins.title': return 'Pile ou face';
			case 'tools.randomnumber.title': return 'Nombre aléatoire';
			case 'tools.randomnumber.min': return 'Min';
			case 'tools.randomnumber.max': return 'Max';
			case 'tools.randomnumber.error.invalid_number': return 'Nombre invalide, veuillez réessayer.';
			case 'tools.randomnumber.error.min_must_be_lower_than_max': return 'Le nombre minimum doit être inférieur au nombre maximum.';
			case 'tools.randomnumber.error.min_and_max_must_be_between_x_and_y': return ({required Object minNumberLimit, required Object maxNumberLimit}) => 'Les nombres minimum et maximum doivent être compris entre ${minNumberLimit} et ${maxNumberLimit}.';
			case 'tools.randomcolor.title': return 'Couleur aléatoire';
			case 'tools.randomcolor.hint': return 'Toucher la couleur pour la changer';
			case 'tools.randomcolor.copied_to_clipboard': return 'Copié dans le presse-papier';
			case 'tools.sshclient.title': return 'Client SSH';
			case 'tools.sshclient.use_password': return 'Utiliser un mot de passe';
			case 'tools.sshclient.use_ssh_key': return 'Utiliser une clé SSH';
			case 'tools.sshclient.host': return 'Hôte';
			case 'tools.sshclient.port': return 'Port';
			case 'tools.sshclient.username': return 'Nom d\'utilisateur';
			case 'tools.sshclient.password': return 'Mot de passe';
			case 'tools.sshclient.connect': return 'Se connecter';
			case 'tools.sshclient.select_private_key': return 'Sélectionner une clé privée';
			case 'tools.sshclient.no_private_key_selected': return 'Aucune clé privée sélectionnée';
			case 'tools.sshclient.passphrase': return 'Phrase secrète (laisser vide si aucune)';
			case 'tools.sshclient.error.invalid_port': return 'Port invalide';
			case 'tools.sshclient.error.invalid_passphrase': return 'Vous avez peut-être saisi une phrase de passe alors que votre clé n\'est pas cryptée, ou inversement';
			case 'tools.sshclient.error.invalid_private_key': return 'La clé que vous avez fournie n\'est pas une clé privée valide';
			case 'tools.sshclient.error.authentication_failed': return 'Échec de l\'authentification';
			case 'tools.sshclient.error.connection_failed': return 'Impossible de se connecter à l\'hôte';
			case 'tools.sshclient.error.unknown_error': return 'Une erreur inconnue s\'est produite, veuillez réessayer';
			case 'tools.whiteboard.title': return 'Tableau blanc';
			case 'tools.whiteboard.clear': return 'Effacer';
			case 'tools.whiteboard.undo': return 'Annuler';
			case 'tools.whiteboard.share': return 'Partager';
			case 'tools.whiteboard.share_success': return 'Votre tableau blanc a été partagé avec succès';
			case 'tools.networkinfo.title': return 'Informations réseau';
			case 'tools.networkinfo.loading': return 'Chargement...';
			case 'tools.networkinfo.location_permission_required': return 'La permission de localisation est nécessaire pour obtenir certaines informations sur le WiFi (il s\'agit d\'une limitation du système d\'exploitation).\nVous risquez d\'obtenir des informations erronées si vous ne l\'autorisez pas.';
			case 'tools.networkinfo.public_ip': return 'Adresse IP publique';
			case 'tools.networkinfo.local_ip': return 'Adresse IP locale';
			case 'tools.networkinfo.local_subnet_mask': return 'Masque de sous-réseau local';
			case 'tools.networkinfo.local_gateway_ip': return 'Adresse IP de passerelle locale';
			case 'tools.networkinfo.local_broadcast_ip': return 'Adresse IP de diffusion locale';
			case 'tools.networkinfo.wifi_name': return 'Nom du WiFi';
			case 'tools.networkinfo.wifi_bssid': return 'BSSID du WiFi';
			case 'tools.networkinfo.not_available_on_ios': return 'Non disponible sur iOS';
			case 'tools.networkinfo.note_location_permission': return 'Remarque : certaines informations peuvent être incorrectes si vous n\'avez pas autorisé la permission de localisation précise.';
			case 'tools.uuidgenerator.title': return 'Générateur d\'UUID';
			case 'tools.uuidgenerator.generate': return 'Générer';
			case 'tools.uuidgenerator.default_uuid_text': return 'Appuyer sur un bouton pour générer un UUID';
			case 'tools.uuidgenerator.copied_to_clipboard': return 'Copié dans le presse-papiers';
			case 'tools.uuidgenerator.v1_uuid': return 'v1 (basé sur le temps)';
			case 'tools.uuidgenerator.v4_uuid': return 'v4 (aléatoire)';
			case 'tools.uuidgenerator.v5_uuid': return 'v5 (basé sur sha1)';
			case 'tools.uuidgenerator.v5_generate_title': return 'Générer un UUID v5';
			case 'tools.uuidgenerator.v5_namespace': return 'Espace de noms (laisser vide pour aléatoire)';
			case 'tools.uuidgenerator.v5_name': return 'Nom (laisser vide si aucun)';
			case 'tools.uuidgenerator.error.invalid_namespace': return 'L\'espace de noms n\'est pas un UUID valide';
			case 'tools.texttospeech.title': return 'Synthèse vocale';
			case 'tools.texttospeech.choose_a_language': return 'Choisir une langue';
			case 'tools.texttospeech.text_to_speak': return 'Texte à prononcer';
			case 'tools.texttospeech.pitch': return 'Hauteur';
			case 'tools.texttospeech.rate': return 'Débit';
			case 'tools.texttospeech.play': return 'Play';
			case 'tools.texttospeech.stop': return 'Stop';
			case 'tools.texttospeech.error.please_try_again': return 'Veuillez réessayer plus tard.\nSi vous utilisez cette langue pour la première fois, veuillez patienter quelques secondes et réessayer.';
			case 'tools.texttospeech.error.please_select_a_language': return 'Veuillez sélectionner une langue';
			case 'tools.nearbypublictransportstops.title': return 'Arrêts de transport';
			case 'tools.nearbypublictransportstops.refresh': return 'Rafraîchir';
			case 'tools.nearbypublictransportstops.data_source': return 'Source des données';
			case 'tools.nearbypublictransportstops.initial_dialog_title': return 'Information';
			case 'tools.nearbypublictransportstops.initial_dialog_message': return ({required Object source}) => 'Cet outil est destiné à être utilisé en Suisse. Il utilise les données de "${source}"';
			case 'tools.nearbypublictransportstops.data_license_dialog_open': return 'Ouvrir';
			case 'tools.nearbypublictransportstops.data_license_dialog_title': return 'Source des données';
			case 'tools.nearbypublictransportstops.data_license_dialog_message': return ({required Object source, required Object url}) => 'Les données utilisées dans cet outil proviennent de "${source}".\n${url}';
			case 'tools.nearbypublictransportstops.error.location_permission_denied': return 'La permission de localisation a été refusée, veuillez l\'activer dans les paramètres afin d\'utiliser pleinement cet outil.';
			case 'tools.nearbypublictransportstops.error.download_stops_failed': return 'Échec du téléchargement des arrêts, vous devez être connecté à internet pour télécharger les arrêts pour la première fois ou pour les mettre à jour.';
			case 'tools.nearbypublictransportstops.error.read_stops_failed': return 'La lecture des arrêts a échoué, veuillez réessayer plus tard avec une connexion internet active.';
			case 'tools.nearbypublictransportstops.error.parse_stops_failed': return 'Le traitement des arrêts a échoué, veuillez réessayer plus tard avec une connexion Internet active.';
			case 'credits.title': return 'Crédits';
			case 'credits.app_icon': return ({required Object author}) => 'Icône de l\'application par ${author}';
			case 'credits.app_license': return ({required Object license}) => 'Application sous licence ${license}';
			case 'credits.tools_icons': return ({required Object author}) => 'Icônes des outils par ${author}';
			case 'credits.contribute_on_github': return 'Contribuez sur GitHub';
			case 'credits.translations.title': return 'Traductions';
			case 'credits.translations.english': return ({required Object author}) => 'Anglais par ${author}';
			case 'credits.translations.french': return ({required Object author}) => 'Français par ${author}';
			default: return null;
		}
	}
}
