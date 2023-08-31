/// Generated file. Do not edit.
///
/// Locales: 2
/// Strings: 186 (93 per locale)
///
/// Built on 2023-08-31 at 18:40 UTC

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
}

// Path: tools
class _StringsToolsEn {
	_StringsToolsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsToolsClockEn clock = _StringsToolsClockEn._(_root);
	late final _StringsToolsMetronomeEn metronome = _StringsToolsMetronomeEn._(_root);
	late final _StringsToolsMicspeakEn micspeak = _StringsToolsMicspeakEn._(_root);
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

// Path: tools.micspeak
class _StringsToolsMicspeakEn {
	_StringsToolsMicspeakEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'MicSpeak';
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
}

// Path: tools
class _StringsToolsFr implements _StringsToolsEn {
	_StringsToolsFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override late final _StringsToolsClockFr clock = _StringsToolsClockFr._(_root);
	@override late final _StringsToolsMetronomeFr metronome = _StringsToolsMetronomeFr._(_root);
	@override late final _StringsToolsMicspeakFr micspeak = _StringsToolsMicspeakFr._(_root);
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

// Path: tools.micspeak
class _StringsToolsMicspeakFr implements _StringsToolsMicspeakEn {
	_StringsToolsMicspeakFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'MicSpeak';
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
			case 'tools.clock.title': return 'Clock';
			case 'tools.metronome.title': return 'Metronome';
			case 'tools.metronome.bpm': return 'BPM';
			case 'tools.metronome.beats_per_measure': return 'Beats per measure';
			case 'tools.metronome.start': return 'Start';
			case 'tools.metronome.stop': return 'Stop';
			case 'tools.micspeak.title': return 'MicSpeak';
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
			case 'tools.clock.title': return 'Horloge';
			case 'tools.metronome.title': return 'Métronome';
			case 'tools.metronome.bpm': return 'BPM';
			case 'tools.metronome.beats_per_measure': return 'Battements par mesure';
			case 'tools.metronome.start': return 'Démarrer';
			case 'tools.metronome.stop': return 'Arrêter';
			case 'tools.micspeak.title': return 'MicSpeak';
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
