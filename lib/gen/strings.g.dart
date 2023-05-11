/// Generated file. Do not edit.
///
/// Locales: 2
/// Strings: 76 (38 per locale)
///
/// Built on 2023-05-11 at 19:07 UTC

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

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'generic.app_name': return 'Toolbox';
			case 'generic.error': return 'Error';
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
