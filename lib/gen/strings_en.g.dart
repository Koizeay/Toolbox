///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsGenericEn generic = TranslationsGenericEn._(_root);
	late final TranslationsHomepageEn homepage = TranslationsHomepageEn._(_root);
	late final TranslationsCategoriesEn categories = TranslationsCategoriesEn._(_root);
	late final TranslationsToolsEn tools = TranslationsToolsEn._(_root);
	late final TranslationsCreditsEn credits = TranslationsCreditsEn._(_root);
}

// Path: generic
class TranslationsGenericEn {
	TranslationsGenericEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Toolbox'
	String get app_name => 'Toolbox';

	/// en: 'Tools'
	String get tools => 'Tools';

	/// en: 'Categories'
	String get categories => 'Categories';

	/// en: 'Error'
	String get error => 'Error';

	/// en: 'Warning'
	String get warning => 'Warning';

	/// en: 'OK'
	String get ok => 'OK';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Search'
	String get search => 'Search';

	/// en: 'Enable'
	String get enable => 'Enable';

	/// en: 'Reset'
	String get reset => 'Reset';

	/// en: 'Yes'
	String get yes => 'Yes';

	/// en: 'No'
	String get no => 'No';

	/// en: 'Copy'
	String get copy => 'Copy';

	/// en: 'Share'
	String get share => 'Share';

	/// en: 'Generate'
	String get generate => 'Generate';
}

// Path: homepage
class TranslationsHomepageEn {
	TranslationsHomepageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Update available'
	String get update_available => 'Update available';

	/// en: 'A new version of Toolbox is available. Update it now to get the latest features and improvements.'
	String get update_available_message => 'A new version of Toolbox is available. Update it now to get the latest features and improvements.';

	/// en: 'Switch view'
	String get switch_view => 'Switch view';

	/// en: 'Search in all categories'
	String get search_all_categories => 'Search in all categories';

	/// en: 'Clear search'
	String get clear_search => 'Clear search';

	/// en: 'Add'
	String get add => 'Add';

	/// en: 'Remove'
	String get remove => 'Remove';

	/// en: 'Favorites'
	String get favorites => 'Favorites';

	/// en: 'Would you like to add this tool to favorites?'
	String get would_you_like_to_add_this_tool_to_favorites => 'Would you like to add this tool to favorites?';

	/// en: 'Would you like to remove this tool from favorites?'
	String get would_you_like_to_remove_this_tool_from_favorites => 'Would you like to remove this tool from favorites?';
}

// Path: categories
class TranslationsCategoriesEn {
	TranslationsCategoriesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Audio'
	String get audio => 'Audio';

	/// en: 'Calculations'
	String get calculations => 'Calculations';

	/// en: 'Games'
	String get games => 'Games';

	/// en: 'Geography'
	String get geography => 'Geography';

	/// en: 'Miscellaneous'
	String get miscellaneous => 'Miscellaneous';

	/// en: 'Network'
	String get network => 'Network';

	/// en: 'Random'
	String get random => 'Random';

	/// en: 'Time'
	String get time => 'Time';

	/// en: 'Web'
	String get web => 'Web';
}

// Path: tools
class TranslationsToolsEn {
	TranslationsToolsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsToolsBaseconverterEn baseconverter = TranslationsToolsBaseconverterEn._(_root);
	late final TranslationsToolsClockEn clock = TranslationsToolsClockEn._(_root);
	late final TranslationsToolsMetronomeEn metronome = TranslationsToolsMetronomeEn._(_root);
	late final TranslationsToolsMegaphoneEn megaphone = TranslationsToolsMegaphoneEn._(_root);
	late final TranslationsToolsNslookupEn nslookup = TranslationsToolsNslookupEn._(_root);
	late final TranslationsToolsPingEn ping = TranslationsToolsPingEn._(_root);
	late final TranslationsToolsSoundmeterEn soundmeter = TranslationsToolsSoundmeterEn._(_root);
	late final TranslationsToolsQrreaderEn qrreader = TranslationsToolsQrreaderEn._(_root);
	late final TranslationsToolsTimerEn timer = TranslationsToolsTimerEn._(_root);
	late final TranslationsToolsStopwatchEn stopwatch = TranslationsToolsStopwatchEn._(_root);
	late final TranslationsToolsRouletteEn roulette = TranslationsToolsRouletteEn._(_root);
	late final TranslationsToolsFlipcoinsEn flipcoins = TranslationsToolsFlipcoinsEn._(_root);
	late final TranslationsToolsRandomnumberEn randomnumber = TranslationsToolsRandomnumberEn._(_root);
	late final TranslationsToolsRandomcolorEn randomcolor = TranslationsToolsRandomcolorEn._(_root);
	late final TranslationsToolsSshclientEn sshclient = TranslationsToolsSshclientEn._(_root);
	late final TranslationsToolsWhiteboardEn whiteboard = TranslationsToolsWhiteboardEn._(_root);
	late final TranslationsToolsNetworkinfoEn networkinfo = TranslationsToolsNetworkinfoEn._(_root);
	late final TranslationsToolsUuidgeneratorEn uuidgenerator = TranslationsToolsUuidgeneratorEn._(_root);
	late final TranslationsToolsTexttospeechEn texttospeech = TranslationsToolsTexttospeechEn._(_root);
	late final TranslationsToolsNearbypublictransportstopsEn nearbypublictransportstops = TranslationsToolsNearbypublictransportstopsEn._(_root);
	late final TranslationsToolsFileencryptionEn fileencryption = TranslationsToolsFileencryptionEn._(_root);
	late final TranslationsToolsYoutubethumbnailEn youtubethumbnail = TranslationsToolsYoutubethumbnailEn._(_root);
	late final TranslationsToolsNationalanthemsEn nationalanthems = TranslationsToolsNationalanthemsEn._(_root);
	late final TranslationsToolsHttprequestEn httprequest = TranslationsToolsHttprequestEn._(_root);
	late final TranslationsToolsMorsecodeEn morsecode = TranslationsToolsMorsecodeEn._(_root);
	late final TranslationsToolsOsmEn osm = TranslationsToolsOsmEn._(_root);
	late final TranslationsToolsGameoflifeEn gameoflife = TranslationsToolsGameoflifeEn._(_root);
	late final TranslationsToolsSpeedometerEn speedometer = TranslationsToolsSpeedometerEn._(_root);
	late final TranslationsToolsMcServerPingEn mc_server_ping = TranslationsToolsMcServerPingEn._(_root);
	late final TranslationsToolsTimestampconverterEn timestampconverter = TranslationsToolsTimestampconverterEn._(_root);
	late final TranslationsToolsUrlshortenerEn urlshortener = TranslationsToolsUrlshortenerEn._(_root);
	late final TranslationsToolsCounterEn counter = TranslationsToolsCounterEn._(_root);
	late final TranslationsToolsBitwisecalculatorEn bitwisecalculator = TranslationsToolsBitwisecalculatorEn._(_root);
	late final TranslationsToolsMusicsearchEn musicsearch = TranslationsToolsMusicsearchEn._(_root);
	late final TranslationsToolsMusicanalyserEn musicanalyser = TranslationsToolsMusicanalyserEn._(_root);
	late final TranslationsToolsTextdifferencesEn textdifferences = TranslationsToolsTextdifferencesEn._(_root);
	late final TranslationsToolsCharacterscopyEn characterscopy = TranslationsToolsCharacterscopyEn._(_root);
	late final TranslationsToolsWhoisdomainEn whoisdomain = TranslationsToolsWhoisdomainEn._(_root);
	late final TranslationsToolsTextcounterEn textcounter = TranslationsToolsTextcounterEn._(_root);
	late final TranslationsToolsRomannumeralEn romannumeral = TranslationsToolsRomannumeralEn._(_root);
	late final TranslationsToolsAreacalculatorEn areacalculator = TranslationsToolsAreacalculatorEn._(_root);
	late final TranslationsToolsMathtexEn mathtex = TranslationsToolsMathtexEn._(_root);
	late final TranslationsToolsCompassEn compass = TranslationsToolsCompassEn._(_root);
	late final TranslationsToolsQrcreatorEn qrcreator = TranslationsToolsQrcreatorEn._(_root);
	late final TranslationsToolsPastebinEn pastebin = TranslationsToolsPastebinEn._(_root);
	late final TranslationsToolsPercentagecalculatorEn percentagecalculator = TranslationsToolsPercentagecalculatorEn._(_root);
	late final TranslationsToolsPasswordgeneratorEn passwordgenerator = TranslationsToolsPasswordgeneratorEn._(_root);
	late final TranslationsToolsPortscannerEn portscanner = TranslationsToolsPortscannerEn._(_root);
	late final TranslationsToolsCommonsEn commons = TranslationsToolsCommonsEn._(_root);
	late final TranslationsToolsCrdeckEn crdeck = TranslationsToolsCrdeckEn._(_root);
	late final TranslationsToolsIplocationEn iplocation = TranslationsToolsIplocationEn._(_root);
}

// Path: credits
class TranslationsCreditsEn {
	TranslationsCreditsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Credits'
	String get title => 'Credits';

	/// en: 'App icon by $author'
	String app_icon({required Object author}) => 'App icon by ${author}';

	/// en: 'The app is licensed under the $license license'
	String app_license({required Object license}) => 'The app is licensed under the ${license} license';

	/// en: 'Tools icons by $author'
	String tools_icons({required Object author}) => 'Tools icons by ${author}';

	/// en: 'Ads are there to help me pay server costs and support the development of this app.\nOnly a small banner is displayed at the bottom of the screen, nothing to block your Toolbox experience.'
	String get ads_disclaimer => 'Ads are there to help me pay server costs and support the development of this app.\nOnly a small banner is displayed at the bottom of the screen, nothing to block your Toolbox experience.';

	/// en: 'More apps and services'
	String get more_apps_and_services => 'More apps and services';

	/// en: 'View licenses'
	String get view_licenses => 'View licenses';

	/// en: 'Special thanks'
	String get special_thanks => 'Special thanks';

	/// en: 'Contribute on GitHub'
	String get contribute_on_github => 'Contribute on GitHub';

	/// en: 'Email copied to clipboard'
	String get email_copied_to_clipboard => 'Email copied to clipboard';

	/// en: 'Made with love in Switzerland'
	String get made_with_love_in_switzerland => 'Made with love in Switzerland';

	/// en: 'Made in Switzerland, used worldwide. Thank you for using Toolbox. If you like it, please consider leaving a review on the Play Store or App Store. It helps me a lot and motivates me to keep improving the app.'
	String get made_with_love_in_switzerland_description => 'Made in Switzerland, used worldwide.\nThank you for using Toolbox.\nIf you like it, please consider leaving a review on the Play Store or App Store.\nIt helps me a lot and motivates me to keep improving the app.';

	late final TranslationsCreditsTranslationsEn translations = TranslationsCreditsTranslationsEn._(_root);
}

// Path: tools.baseconverter
class TranslationsToolsBaseconverterEn {
	TranslationsToolsBaseconverterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Base converter'
	String get title => 'Base converter';

	/// en: 'Input'
	String get input => 'Input';

	/// en: 'Results'
	String get results => 'Results';

	/// en: 'Enter a decimal number'
	String get enter_a_dec_number => 'Enter a decimal number';

	/// en: 'Enter a hexadecimal number'
	String get enter_a_hex_number => 'Enter a hexadecimal number';

	/// en: 'Enter a binary number'
	String get enter_a_bin_number => 'Enter a binary number';

	/// en: 'Enter an octal number'
	String get enter_a_oct_number => 'Enter an octal number';

	/// en: 'Hexadecimal'
	String get hexadecimal => 'Hexadecimal';

	/// en: 'Binary'
	String get binary => 'Binary';

	/// en: 'Octal'
	String get octal => 'Octal';

	/// en: 'Decimal'
	String get decimal => 'Decimal';

	/// en: 'Incompatible number'
	String get incompatible_number => 'Incompatible number';

	/// en: 'Too big number'
	String get too_big_number => 'Too big number';

	/// en: 'The number you entered is not a valid $base number'
	String the_number_you_entered_is_not_a_valid_x_number({required Object base}) => 'The number you entered is not a valid ${base} number';

	/// en: 'The number you entered is too big to be able to convert it'
	String get the_number_you_entered_is_too_big_to_be_abble_to_convert_it => 'The number you entered is too big to be able to convert it';
}

// Path: tools.clock
class TranslationsToolsClockEn {
	TranslationsToolsClockEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Clock'
	String get title => 'Clock';

	/// en: 'Change timezone'
	String get change_timezone => 'Change timezone';

	/// en: 'Timezone'
	String get timezone => 'Timezone';

	/// en: 'Choose a timezone'
	String get choose_a_timezone => 'Choose a timezone';

	/// en: 'Local time'
	String get select_local => 'Local time';
}

// Path: tools.metronome
class TranslationsToolsMetronomeEn {
	TranslationsToolsMetronomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Metronome'
	String get title => 'Metronome';

	/// en: 'BPM'
	String get bpm => 'BPM';

	/// en: 'Beats per measure'
	String get beats_per_measure => 'Beats per measure';

	/// en: 'Start'
	String get start => 'Start';

	/// en: 'Stop'
	String get stop => 'Stop';
}

// Path: tools.megaphone
class TranslationsToolsMegaphoneEn {
	TranslationsToolsMegaphoneEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Megaphone'
	String get title => 'Megaphone';

	late final TranslationsToolsMegaphoneErrorEn error = TranslationsToolsMegaphoneErrorEn._(_root);
}

// Path: tools.nslookup
class TranslationsToolsNslookupEn {
	TranslationsToolsNslookupEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'NSLookup'
	String get title => 'NSLookup';

	/// en: 'Enter a domain name'
	String get enter_a_domain_name => 'Enter a domain name';

	/// en: 'Lookup'
	String get lookup => 'Lookup';

	late final TranslationsToolsNslookupErrorEn error = TranslationsToolsNslookupErrorEn._(_root);

	/// en: 'Not supported by system DNS'
	String get not_supported_by_system_dns => 'Not supported by system DNS';

	/// en: 'No records found'
	String get no_records_found => 'No records found';
}

// Path: tools.ping
class TranslationsToolsPingEn {
	TranslationsToolsPingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Ping'
	String get title => 'Ping';

	/// en: 'Ping'
	String get ping => 'Ping';

	/// en: 'Enter a domain name or IP address'
	String get enter_a_domain_name_or_ip => 'Enter a domain name or IP address';

	/// en: 'Reply from $host: time=${time}ms TTL=$ttl'
	String reply_from_host_time_ttl({required Object host, required Object time, required Object ttl}) => 'Reply from ${host}: time=${time}ms TTL=${ttl}';

	/// en: '$transmitted packets transmitted, $received packets received'
	String x_packets_transmitted_y({required Object transmitted, required Object received}) => '${transmitted} packets transmitted, ${received} packets received';

	late final TranslationsToolsPingErrorEn error = TranslationsToolsPingErrorEn._(_root);
}

// Path: tools.soundmeter
class TranslationsToolsSoundmeterEn {
	TranslationsToolsSoundmeterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Sound meter'
	String get title => 'Sound meter';

	/// en: 'dB'
	String get decibels => 'dB';

	late final TranslationsToolsSoundmeterErrorEn error = TranslationsToolsSoundmeterErrorEn._(_root);
}

// Path: tools.qrreader
class TranslationsToolsQrreaderEn {
	TranslationsToolsQrreaderEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'QR reader'
	String get title => 'QR reader';

	/// en: 'Scanned'
	String get scanned => 'Scanned';

	/// en: 'Open link'
	String get openurl => 'Open link';

	/// en: 'Copy password'
	String get copy_password => 'Copy password';

	/// en: 'Copy'
	String get copy => 'Copy';

	/// en: 'Copied to clipboard'
	String get copied_to_clipboard => 'Copied to clipboard';

	/// en: 'WiFi'
	String get wifi => 'WiFi';

	/// en: 'SSID'
	String get wifi_ssid => 'SSID';

	/// en: 'Password'
	String get wifi_password => 'Password';

	late final TranslationsToolsQrreaderErrorEn error = TranslationsToolsQrreaderErrorEn._(_root);
}

// Path: tools.timer
class TranslationsToolsTimerEn {
	TranslationsToolsTimerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Timer'
	String get title => 'Timer';

	/// en: 'Start'
	String get start => 'Start';

	/// en: 'Stop'
	String get stop => 'Stop';

	/// en: 'Pause'
	String get pause => 'Pause';

	/// en: 'Please stop the timer first'
	String get please_stop_the_timer_first => 'Please stop the timer first';

	/// en: 'For the timer to ring on iOS, you must not quit the application or switch off your iPhone screen. Otherwise iOS will prevent the timer from ringing when it reaches zero.'
	String get ios_warning_message => 'For the timer to ring on iOS, you must not quit the application or switch off your iPhone screen. Otherwise iOS will prevent the timer from ringing when it reaches zero.';

	/// en: 'Adjust Time'
	String get adjust_time => 'Adjust Time';
}

// Path: tools.stopwatch
class TranslationsToolsStopwatchEn {
	TranslationsToolsStopwatchEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Stopwatch'
	String get title => 'Stopwatch';

	/// en: 'Controls'
	String get controls => 'Controls';

	/// en: 'Start'
	String get start => 'Start';

	/// en: 'Stop'
	String get stop => 'Stop';

	/// en: 'Reset'
	String get reset => 'Reset';

	/// en: 'Laps'
	String get laps => 'Laps';

	/// en: 'Lap'
	String get lap => 'Lap';
}

// Path: tools.roulette
class TranslationsToolsRouletteEn {
	TranslationsToolsRouletteEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Roulette'
	String get title => 'Roulette';

	/// en: 'Tap the wheel to roll it'
	String get tap_to_roll_info => 'Tap the wheel to roll it';

	/// en: 'Study'
	String get default_1 => 'Study';

	/// en: 'Play'
	String get default_2 => 'Play';

	/// en: 'Sleep'
	String get default_3 => 'Sleep';

	/// en: 'Add'
	String get add => 'Add';

	/// en: 'Remove'
	String get remove => 'Remove';

	/// en: 'Add an item'
	String get add_item => 'Add an item';

	/// en: 'Item name'
	String get item_name => 'Item name';

	/// en: 'Remove an item'
	String get remove_an_item => 'Remove an item';

	late final TranslationsToolsRouletteWarningEn warning = TranslationsToolsRouletteWarningEn._(_root);
}

// Path: tools.flipcoins
class TranslationsToolsFlipcoinsEn {
	TranslationsToolsFlipcoinsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Flip a coin'
	String get title => 'Flip a coin';

	/// en: 'Change coin currency'
	String get change_coin_currency => 'Change coin currency';
}

// Path: tools.randomnumber
class TranslationsToolsRandomnumberEn {
	TranslationsToolsRandomnumberEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Random number'
	String get title => 'Random number';

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'Min'
	String get min => 'Min';

	/// en: 'Max'
	String get max => 'Max';

	late final TranslationsToolsRandomnumberErrorEn error = TranslationsToolsRandomnumberErrorEn._(_root);
}

// Path: tools.randomcolor
class TranslationsToolsRandomcolorEn {
	TranslationsToolsRandomcolorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Random color'
	String get title => 'Random color';

	/// en: 'Tap the color to change it'
	String get hint => 'Tap the color to change it';

	/// en: 'Tap to copy'
	String get tap_to_copy => 'Tap to copy';

	/// en: 'Copied to clipboard'
	String get copied_to_clipboard => 'Copied to clipboard';
}

// Path: tools.sshclient
class TranslationsToolsSshclientEn {
	TranslationsToolsSshclientEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'SSH client'
	String get title => 'SSH client';

	/// en: 'Backspace'
	String get backspace => 'Backspace';

	/// en: 'Use password'
	String get use_password => 'Use password';

	/// en: 'Use SSH key'
	String get use_ssh_key => 'Use SSH key';

	/// en: 'Connection'
	String get connection => 'Connection';

	/// en: 'Host'
	String get host => 'Host';

	/// en: 'Port'
	String get port => 'Port';

	/// en: 'Username'
	String get username => 'Username';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'SSH key'
	String get ssh_key => 'SSH key';

	/// en: 'Connect'
	String get connect => 'Connect';

	/// en: 'Authentication'
	String get authentication => 'Authentication';

	/// en: 'Select private key'
	String get select_private_key => 'Select private key';

	/// en: 'No private key selected'
	String get no_private_key_selected => 'No private key selected';

	/// en: 'Passphrase (leave empty if none)'
	String get passphrase => 'Passphrase (leave empty if none)';

	late final TranslationsToolsSshclientErrorEn error = TranslationsToolsSshclientErrorEn._(_root);
}

// Path: tools.whiteboard
class TranslationsToolsWhiteboardEn {
	TranslationsToolsWhiteboardEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Whiteboard'
	String get title => 'Whiteboard';

	/// en: 'Your whiteboard has been shared successfully'
	String get share_success => 'Your whiteboard has been shared successfully';

	/// en: 'Your whiteboard has been saved successfully'
	String get save_success => 'Your whiteboard has been saved successfully';
}

// Path: tools.networkinfo
class TranslationsToolsNetworkinfoEn {
	TranslationsToolsNetworkinfoEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Network info'
	String get title => 'Network info';

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'Unknown'
	String get unknown => 'Unknown';

	/// en: 'Location permission is required to get some WiFi info (this is an OS limitation). You could get incorrect info if you don't grant it.'
	String get location_permission_required => 'Location permission is required to get some WiFi info (this is an OS limitation).\nYou could get incorrect info if you don\'t grant it.';

	/// en: 'Public IP address'
	String get public_ip => 'Public IP address';

	/// en: 'Local IP address'
	String get local_ip => 'Local IP address';

	/// en: 'Local network subnet mask'
	String get local_subnet_mask => 'Local network subnet mask';

	/// en: 'Local network gateway IP'
	String get local_gateway_ip => 'Local network gateway IP';

	/// en: 'Local network broadcast IP'
	String get local_broadcast_ip => 'Local network broadcast IP';

	/// en: 'WiFi name'
	String get wifi_name => 'WiFi name';

	/// en: 'WiFi BSSID'
	String get wifi_bssid => 'WiFi BSSID';

	/// en: 'Not available on iOS'
	String get not_available_on_ios => 'Not available on iOS';

	/// en: 'Note: some information may be incorrect if you didn't grant precise location permission.'
	String get note_location_permission => 'Note: some information may be incorrect if you didn\'t grant precise location permission.';
}

// Path: tools.uuidgenerator
class TranslationsToolsUuidgeneratorEn {
	TranslationsToolsUuidgeneratorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'UUID generator'
	String get title => 'UUID generator';

	/// en: 'Generate'
	String get generate => 'Generate';

	/// en: 'Press a button to generate a UUID'
	String get default_uuid_text => 'Press a button to generate a UUID';

	/// en: 'Tap to copy'
	String get tap_to_copy => 'Tap to copy';

	/// en: 'Copied to clipboard'
	String get copied_to_clipboard => 'Copied to clipboard';

	/// en: 'v1 (time-based)'
	String get v1_uuid => 'v1 (time-based)';

	/// en: 'v4 (random)'
	String get v4_uuid => 'v4 (random)';

	/// en: 'v5 (sha1-based)'
	String get v5_uuid => 'v5 (sha1-based)';

	/// en: 'Generate v5 UUID'
	String get v5_generate_title => 'Generate v5 UUID';

	/// en: 'Namespace (leave blank for random)'
	String get v5_namespace => 'Namespace (leave blank for random)';

	/// en: 'Name (leave blank for none)'
	String get v5_name => 'Name (leave blank for none)';

	late final TranslationsToolsUuidgeneratorErrorEn error = TranslationsToolsUuidgeneratorErrorEn._(_root);
}

// Path: tools.texttospeech
class TranslationsToolsTexttospeechEn {
	TranslationsToolsTexttospeechEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Text to speech'
	String get title => 'Text to speech';

	/// en: 'Choose a language'
	String get choose_a_language => 'Choose a language';

	/// en: 'Text to speak'
	String get text_to_speak => 'Text to speak';

	/// en: 'Pitch'
	String get pitch => 'Pitch';

	/// en: 'Rate'
	String get rate => 'Rate';

	/// en: 'Play'
	String get play => 'Play';

	/// en: 'Stop'
	String get stop => 'Stop';

	late final TranslationsToolsTexttospeechErrorEn error = TranslationsToolsTexttospeechErrorEn._(_root);
}

// Path: tools.nearbypublictransportstops
class TranslationsToolsNearbypublictransportstopsEn {
	TranslationsToolsNearbypublictransportstopsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Nearby transport stops'
	String get title => 'Nearby transport stops';

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'Refresh'
	String get refresh => 'Refresh';

	/// en: 'Data source'
	String get data_source => 'Data source';

	/// en: 'Information'
	String get initial_dialog_title => 'Information';

	/// en: 'This tool is intended to be used in Switzerland. It uses the data from "$source"'
	String initial_dialog_message({required Object source}) => 'This tool is intended to be used in Switzerland. It uses the data from "${source}"';

	/// en: 'Open'
	String get data_license_dialog_open => 'Open';

	/// en: 'Data source'
	String get data_license_dialog_title => 'Data source';

	/// en: 'The data used in this tool comes from "$source". $url'
	String data_license_dialog_message({required Object source, required Object url}) => 'The data used in this tool comes from "${source}".\n${url}';

	/// en: 'No departures found'
	String get no_departures => 'No departures found';

	/// en: 'Departure'
	String get departure => 'Departure';

	/// en: 'Arrival'
	String get arrival => 'Arrival';

	/// en: 'Platform'
	String get platform => 'Platform';

	/// en: 'Map'
	String get show_on_map => 'Map';

	/// en: 'Stop'
	String get map_marker_title => 'Stop';

	late final TranslationsToolsNearbypublictransportstopsErrorEn error = TranslationsToolsNearbypublictransportstopsErrorEn._(_root);
}

// Path: tools.fileencryption
class TranslationsToolsFileencryptionEn {
	TranslationsToolsFileencryptionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'File encryption'
	String get title => 'File encryption';

	/// en: 'Pick a file to encrypt it. If you want to decrypt a file, pick an encrypted file with the .aes extension'
	String get home_hint => 'Pick a file to encrypt it. If you want to decrypt a file, pick an encrypted file with the .aes extension';

	/// en: 'No file selected'
	String get no_file_selected => 'No file selected';

	/// en: 'Please enter a password'
	String get enter_password => 'Please enter a password';

	/// en: 'File saved successfully'
	String get file_saved_successfully => 'File saved successfully';

	/// en: 'Pick a file'
	String get pick_a_file => 'Pick a file';

	/// en: 'Encryption password'
	String get encryption_password => 'Encryption password';

	/// en: 'Encrypt'
	String get encrypt => 'Encrypt';

	/// en: 'Decrypt'
	String get decrypt => 'Decrypt';

	late final TranslationsToolsFileencryptionErrorEn error = TranslationsToolsFileencryptionErrorEn._(_root);

	/// en: 'Enter password...'
	String get enter_password_hint => 'Enter password...';

	/// en: 'File selection'
	String get file_selection => 'File selection';
}

// Path: tools.youtubethumbnail
class TranslationsToolsYoutubethumbnailEn {
	TranslationsToolsYoutubethumbnailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'YouTube thumbnail'
	String get title => 'YouTube thumbnail';

	/// en: 'Thumbnail saved to device'
	String get saved => 'Thumbnail saved to device';

	/// en: 'YouTube video URL'
	String get youtube_video_id => 'YouTube video URL';

	/// en: 'Save thumbnail'
	String get save_thumbnail => 'Save thumbnail';

	/// en: 'Please enter the URL (or ID) of a YouTube video to download its thumbnail'
	String get please_enter_a_video_url => 'Please enter the URL (or ID) of a YouTube video to download its thumbnail';

	late final TranslationsToolsYoutubethumbnailErrorEn error = TranslationsToolsYoutubethumbnailErrorEn._(_root);

	/// en: 'Thumbnail preview'
	String get thumbnail_preview => 'Thumbnail preview';
}

// Path: tools.nationalanthems
class TranslationsToolsNationalanthemsEn {
	TranslationsToolsNationalanthemsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'National anthems'
	String get title => 'National anthems';

	/// en: 'Stop the anthem'
	String get stop => 'Stop the anthem';

	/// en: 'Search (English name)'
	String get search => 'Search (English name)';

	/// en: 'License'
	String get license => 'License';

	/// en: 'The audio files are provided by "$source" under the $license license'
	String license_text({required Object source, required Object license}) => 'The audio files are provided by "${source}" under the ${license} license';

	/// en: 'Open'
	String get open => 'Open';

	/// en: 'View license'
	String get view_license => 'View license';

	/// en: 'Loading'
	String get loading_audio_title => 'Loading';

	/// en: 'Loading the anthem, please wait...'
	String get loading_audio_text => 'Loading the anthem, please wait...';

	late final TranslationsToolsNationalanthemsErrorEn error = TranslationsToolsNationalanthemsErrorEn._(_root);

	/// en: 'No anthems found'
	String get no_anthems_found => 'No anthems found';
}

// Path: tools.httprequest
class TranslationsToolsHttprequestEn {
	TranslationsToolsHttprequestEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'HTTP request'
	String get title => 'HTTP request';

	/// en: 'Method'
	String get method => 'Method';

	/// en: 'Custom method'
	String get custom_method => 'Custom method';

	/// en: 'URL'
	String get url => 'URL';

	/// en: 'Headers'
	String get headers => 'Headers';

	/// en: 'Body'
	String get body => 'Body';

	/// en: 'Allow bad certificates'
	String get allow_bad_certificates => 'Allow bad certificates';

	/// en: 'Enabling this option allows the "HTTP request" tool to send HTTPS requests to servers with invalid, expired or self-signed SSL/TLS certificates. This disables important security controls and may expose your data to interception or tampering by third parties. Only use this function if you fully understand the risks involved, and only when sending requests to servers you trust and control. It is not recommended for general use. Please consider requests made with this option enabled as unencrypted requests (such as HTTP) that can be manipulated and viewed by third parties.'
	String get allow_bad_certificates_description => 'Enabling this option allows the "HTTP request" tool to send HTTPS requests to servers with invalid, expired or self-signed SSL/TLS certificates. This disables important security controls and may expose your data to interception or tampering by third parties. Only use this function if you fully understand the risks involved, and only when sending requests to servers you trust and control. It is not recommended for general use. Please consider requests made with this option enabled as unencrypted requests (such as HTTP) that can be manipulated and viewed by third parties.';

	/// en: 'I know what I'm doing'
	String get i_know_what_i_am_doing => 'I know what I\'m doing';

	/// en: 'Render HTML'
	String get render_html => 'Render HTML';

	/// en: 'Back to details'
	String get back_to_details => 'Back to details';

	/// en: 'Send request'
	String get send_request => 'Send request';

	/// en: 'Response'
	String get response => 'Response';

	/// en: 'Status code'
	String get status_code => 'Status code';

	late final TranslationsToolsHttprequestErrorEn error = TranslationsToolsHttprequestErrorEn._(_root);

	/// en: 'key1: value1 key2: value2'
	String get example_headers => 'key1: value1\nkey2: value2';

	/// en: 'Request body (JSON, XML, etc.)'
	String get request_body_hint => 'Request body (JSON, XML, etc.)';
}

// Path: tools.morsecode
class TranslationsToolsMorsecodeEn {
	TranslationsToolsMorsecodeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Morse code'
	String get title => 'Morse code';

	/// en: 'Alphabet (A-Z, 0-9)'
	String get alphabet_field => 'Alphabet (A-Z, 0-9)';

	/// en: 'Morse code (. and -)'
	String get morse_field => 'Morse code (. and -)';

	/// en: 'Note: Use 1 space between letters, 3 spaces between words.'
	String get note_spaces => 'Note: Use 1 space between letters, 3 spaces between words.';

	/// en: 'Alphabet to morse'
	String get alphabet_to_morse => 'Alphabet to morse';

	/// en: 'Morse to alphabet'
	String get morse_to_alphabet => 'Morse to alphabet';

	/// en: 'Play audio'
	String get play_audio => 'Play audio';

	/// en: 'Playing...'
	String get playing => 'Playing...';

	/// en: 'Enter text here...'
	String get enter_text => 'Enter text here...';
}

// Path: tools.osm
class TranslationsToolsOsmEn {
	TranslationsToolsOsmEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Map (OSM)'
	String get title => 'Map (OSM)';

	/// en: 'Go to my location'
	String get go_to_my_location => 'Go to my location';

	/// en: 'Loading map...'
	String get loading_map => 'Loading map...';

	late final TranslationsToolsOsmErrorEn error = TranslationsToolsOsmErrorEn._(_root);
}

// Path: tools.gameoflife
class TranslationsToolsGameoflifeEn {
	TranslationsToolsGameoflifeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Game of life'
	String get title => 'Game of life';

	/// en: 'Grid size'
	String get grid_size => 'Grid size';

	/// en: 'Current size is $size'
	String current_size_is_x({required Object size}) => 'Current size is ${size}';

	/// en: 'Waiting'
	String get waiting => 'Waiting';

	/// en: 'Stop simulation'
	String get stop_simulation => 'Stop simulation';

	/// en: 'Start simulation'
	String get start_simulation => 'Start simulation';

	/// en: 'Randomize grid'
	String get randomize_grid => 'Randomize grid';

	/// en: 'Clear grid'
	String get clear_grid => 'Clear grid';

	late final TranslationsToolsGameoflifeErrorEn error = TranslationsToolsGameoflifeErrorEn._(_root);
}

// Path: tools.speedometer
class TranslationsToolsSpeedometerEn {
	TranslationsToolsSpeedometerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Speedometer'
	String get title => 'Speedometer';

	/// en: 'Reset'
	String get reset => 'Reset';

	/// en: 'About traveled distance'
	String get about_traveled_distance_title => 'About traveled distance';

	/// en: 'Traveled distance is calculated using the speed detected by the GPS. This means that the distance is not 100% accurate.'
	String get about_traveled_distance_description => 'Traveled distance is calculated using the speed detected by the GPS.\nThis means that the distance is not 100% accurate.';

	/// en: 'km/h'
	String get kmh => 'km/h';

	/// en: 'km'
	String get km => 'km';

	/// en: 'mph'
	String get mph => 'mph';

	/// en: 'mi'
	String get mi => 'mi';

	/// en: 'Change speed unit'
	String get change_speed_unit => 'Change speed unit';

	/// en: 'Choose the speed unit you want to use with the speedometer'
	String get change_speed_unit_description => 'Choose the speed unit you want to use with the speedometer';

	/// en: 'Traveled distance'
	String get traveled_distance => 'Traveled distance';

	late final TranslationsToolsSpeedometerErrorEn error = TranslationsToolsSpeedometerErrorEn._(_root);
}

// Path: tools.mc_server_ping
class TranslationsToolsMcServerPingEn {
	TranslationsToolsMcServerPingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'MC server ping'
	String get title => 'MC server ping';

	/// en: 'Java Edition'
	String get java_edition => 'Java Edition';

	/// en: 'Information'
	String get information_java => 'Information';

	/// en: 'Check this box if the server is available for the Java Edition of Minecraft. If not, unchecked it and the tool will use the Bedrock Edition API.'
	String get information_java_description => 'Check this box if the server is available for the Java Edition of Minecraft. If not, unchecked it and the tool will use the Bedrock Edition API.';

	/// en: 'Minecraft server IP (or domain)'
	String get server_ip => 'Minecraft server IP (or domain)';

	/// en: 'Ping server'
	String get ping => 'Ping server';

	/// en: 'Ping another server'
	String get ping_another_server => 'Ping another server';

	/// en: 'API used'
	String get api_used => 'API used';

	/// en: 'About the API'
	String get about_the_api => 'About the API';

	/// en: 'This tool uses the "$source" from "$website" to ping Minecraft servers'
	String about_the_api_description({required Object source, required Object website}) => 'This tool uses the "${source}" from "${website}" to ping Minecraft servers';

	/// en: 'Open'
	String get about_open => 'Open';

	/// en: 'The server ID is "$id"'
	String the_server_id_is({required Object id}) => 'The server ID is "${id}"';

	/// en: '$playersOnline/$playersMax player(s) online'
	String x_y_players_online({required Object playersOnline, required Object playersMax}) => '${playersOnline}/${playersMax} player(s) online';

	/// en: 'Added to favorites'
	String get added_to_favorites => 'Added to favorites';

	/// en: 'The server has been added to your favorites'
	String get added_to_favorites_description => 'The server has been added to your favorites';

	/// en: 'Removed from favorites'
	String get removed_from_favorites => 'Removed from favorites';

	/// en: 'The server has been removed from your favorites'
	String get removed_from_favorites_description => 'The server has been removed from your favorites';

	/// en: 'Add to favorite'
	String get add_to_favorites => 'Add to favorite';

	/// en: 'Remove from favorite'
	String get remove_from_favorites => 'Remove from favorite';

	/// en: 'Are you sure you want to remove this server from your favorites?'
	String get remove_from_favorites_description => 'Are you sure you want to remove this server from your favorites?';

	/// en: 'From favorites'
	String get from_favorites => 'From favorites';

	/// en: 'Pick from favorites'
	String get pick_from_favorites => 'Pick from favorites';

	/// en: 'No favorites'
	String get no_favorites => 'No favorites';

	/// en: 'You don't have any favorite servers yet.'
	String get no_favorites_description => 'You don\'t have any favorite servers yet.';

	/// en: 'Online players'
	String get online_players => 'Online players';

	/// en: 'The server has online players, but no player names are available to show'
	String get online_players_description_no_players_to_show => 'The server has online players, but no player names are available to show';

	late final TranslationsToolsMcServerPingErrorEn error = TranslationsToolsMcServerPingErrorEn._(_root);

	/// en: 'Server ID'
	String get server_id => 'Server ID';

	/// en: 'Server info'
	String get server_info => 'Server info';
}

// Path: tools.timestampconverter
class TranslationsToolsTimestampconverterEn {
	TranslationsToolsTimestampconverterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Timestamp converter'
	String get title => 'Timestamp converter';

	/// en: 'Now'
	String get now_tooltip => 'Now';

	/// en: 'UTC'
	String get utc => 'UTC';

	/// en: 'Local'
	String get local => 'Local';

	/// en: 'Local or UTC'
	String get local_or_utc_dialog_title => 'Local or UTC';

	/// en: 'Do you want to pick a local or UTC date?'
	String get local_or_utc_dialog_message => 'Do you want to pick a local or UTC date?';

	/// en: 'Unix timestamp'
	String get unix_timestamp => 'Unix timestamp';

	/// en: 'Convert timestamp to date'
	String get convert_timestamp_to_date => 'Convert timestamp to date';

	/// en: 'Tap the date to change it'
	String get tap_the_date_to_change_it => 'Tap the date to change it';

	/// en: 'Select seconds'
	String get select_seconds => 'Select seconds';

	late final TranslationsToolsTimestampconverterErrorEn error = TranslationsToolsTimestampconverterErrorEn._(_root);

	/// en: 'Convert'
	String get convert => 'Convert';
}

// Path: tools.urlshortener
class TranslationsToolsUrlshortenerEn {
	TranslationsToolsUrlshortenerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'URL shortener'
	String get title => 'URL shortener';

	/// en: 'URL'
	String get url => 'URL';

	/// en: 'QR code'
	String get qr_code => 'QR code';

	/// en: 'Share'
	String get share => 'Share';

	/// en: 'What do you want to share?'
	String get share_dialog_message => 'What do you want to share?';

	/// en: 'Your shortened URL is'
	String get your_shortened_url_is => 'Your shortened URL is';

	/// en: 'Copy to clipboard'
	String get copy_to_clipboard => 'Copy to clipboard';

	/// en: 'The link ID is'
	String get the_link_id_is => 'The link ID is';

	/// en: 'Link ID copied to clipboard'
	String get link_id_copied_to_clipboard => 'Link ID copied to clipboard';

	/// en: 'The link password is'
	String get the_link_password_is => 'The link password is';

	/// en: 'Link password copied to clipboard'
	String get link_password_copied_to_clipboard => 'Link password copied to clipboard';

	/// en: 'Tap the password to copy it You will need it to view statistics about this link'
	String get link_password_hint_text => 'Tap the password to copy it\nYou will need it to view statistics about this link';

	/// en: 'Shorten another URL'
	String get shorten_another_url => 'Shorten another URL';

	/// en: 'URL to shorten'
	String get url_to_shorten => 'URL to shorten';

	/// en: 'By clicking the shorten button, you agree to the terms of service of "$url" available via the link below.'
	String by_clicking_you_accept({required Object url}) => 'By clicking the shorten button, you agree to the terms of service of "${url}" available via the link below.';

	/// en: 'Terms of service'
	String get terms_of_service => 'Terms of service';

	/// en: 'Shorten'
	String get shorten => 'Shorten';

	/// en: 'More features'
	String get more_features => 'More features';

	/// en: 'Use additional features such as text sharing, link-in-bio profile, and more via the official JTU.ME website'
	String get more_features_message => 'Use additional features such as text sharing, link-in-bio profile, and more via the official JTU.ME website';

	/// en: 'Open'
	String get open => 'Open';

	/// en: 'Options (optional)'
	String get options => 'Options (optional)';

	/// en: 'Access password'
	String get access_password => 'Access password';

	/// en: 'Expiration date (UTC)'
	String get expiration_date => 'Expiration date (UTC)';

	/// en: 'Use my account'
	String get use_my_account => 'Use my account';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'No account?'
	String get no_account => 'No account?';

	/// en: 'You can create a free account on the official JTU.ME website'
	String get no_account_message => 'You can create a free account on the official JTU.ME website';

	late final TranslationsToolsUrlshortenerErrorEn error = TranslationsToolsUrlshortenerErrorEn._(_root);

	/// en: 'Management info'
	String get management_info => 'Management info';

	/// en: 'To view statistics and manage this link, use your JTU.ME account on the official website'
	String get manage_with_account => 'To view statistics and manage this link, use your JTU.ME account on the official website';
}

// Path: tools.counter
class TranslationsToolsCounterEn {
	TranslationsToolsCounterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Counter'
	String get title => 'Counter';

	/// en: 'Add button'
	String get add_button => 'Add button';

	/// en: 'Remove button'
	String get remove_button => 'Remove button';

	/// en: 'Enter a number'
	String get enter_number => 'Enter a number';

	late final TranslationsToolsCounterErrorEn error = TranslationsToolsCounterErrorEn._(_root);
}

// Path: tools.bitwisecalculator
class TranslationsToolsBitwisecalculatorEn {
	TranslationsToolsBitwisecalculatorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Bitwise calculator'
	String get title => 'Bitwise calculator';

	/// en: 'Binary values'
	String get binary_values => 'Binary values';

	/// en: 'First number'
	String get first_number => 'First number';

	/// en: 'Second number'
	String get second_number => 'Second number';

	/// en: 'Enter a binary number'
	String get enter_a_binary_number => 'Enter a binary number';

	/// en: 'Operations'
	String get operations => 'Operations';

	/// en: 'AND'
	String get and => 'AND';

	/// en: 'OR'
	String get or => 'OR';

	/// en: 'XOR'
	String get xor => 'XOR';

	/// en: 'Result'
	String get result => 'Result';

	late final TranslationsToolsBitwisecalculatorErrorEn error = TranslationsToolsBitwisecalculatorErrorEn._(_root);
}

// Path: tools.musicsearch
class TranslationsToolsMusicsearchEn {
	TranslationsToolsMusicsearchEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Music search'
	String get title => 'Music search';

	/// en: 'Unknown title'
	String get unknown_title => 'Unknown title';

	/// en: 'Unknown artist'
	String get unknown_artist => 'Unknown artist';

	/// en: 'Unknown album'
	String get unknown_album => 'Unknown album';

	/// en: 'Loading'
	String get loading => 'Loading';

	/// en: 'Loading audio preview...'
	String get loading_audio_preview => 'Loading audio preview...';

	/// en: 'Stop audio preview'
	String get stop_audio_preview => 'Stop audio preview';

	/// en: 'Data source'
	String get data_source => 'Data source';

	/// en: 'This tool uses the "$service" API to search for music. The audio previews are provided by "$service".'
	String this_tool_uses_the_x_api({required Object service}) => 'This tool uses the "${service}" API to search for music.\nThe audio previews are provided by "${service}".';

	/// en: 'Go to $service'
	String go_to_x({required Object service}) => 'Go to ${service}';

	/// en: 'Search for music'
	String get search_for_music => 'Search for music';

	/// en: 'Use the search bar to find music. If your search returns no results, try a different search term. If you still have no results, make sure your internet connection is working properly and that $service is available in your country or region.'
	String use_the_searchbar_to_search_music({required Object service}) => 'Use the search bar to find music.\nIf your search returns no results, try a different search term.\nIf you still have no results, make sure your internet connection is working properly and that ${service} is available in your country or region.';

	/// en: 'Open in $service'
	String open_in_x({required Object service}) => 'Open in ${service}';

	/// en: 'Play preview'
	String get play_preview => 'Play preview';

	late final TranslationsToolsMusicsearchErrorEn error = TranslationsToolsMusicsearchErrorEn._(_root);
}

// Path: tools.musicanalyser
class TranslationsToolsMusicanalyserEn {
	TranslationsToolsMusicanalyserEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Music analyser'
	String get title => 'Music analyser';

	/// en: 'Press the button to start music analysis'
	String get press_the_button_to_start_music_analysis => 'Press the button to start music analysis';

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'Analyzing music... (${remainingSeconds}s)'
	String analyzing_music({required Object remainingSeconds}) => 'Analyzing music... (${remainingSeconds}s)';

	/// en: 'Getting results...'
	String get getting_results => 'Getting results...';

	/// en: 'Unknown'
	String get unknown => 'Unknown';

	/// en: 'API used'
	String get api_used => 'API used';

	/// en: 'This tool uses the "$service" API via a Koizeay backend server. "$service" is a registered trademark of "$company" and is not affiliated with this tool.'
	String this_tool_uses_the_x_api({required Object service, required Object company}) => 'This tool uses the "${service}" API via a Koizeay backend server. "${service}" is a registered trademark of "${company}" and is not affiliated with this tool.';

	/// en: 'Start analyzing music'
	String get start_analyzing_music => 'Start analyzing music';

	/// en: 'Clear'
	String get clear => 'Clear';

	late final TranslationsToolsMusicanalyserErrorEn error = TranslationsToolsMusicanalyserErrorEn._(_root);
}

// Path: tools.textdifferences
class TranslationsToolsTextdifferencesEn {
	TranslationsToolsTextdifferencesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Text differences'
	String get title => 'Text differences';

	/// en: 'Old text'
	String get old_text => 'Old text';

	/// en: 'New text'
	String get new_text => 'New text';

	/// en: 'Enter text in the fields above to see the differences'
	String get no_text_hint => 'Enter text in the fields above to see the differences';

	/// en: 'Enter old text...'
	String get enter_old_text => 'Enter old text...';

	/// en: 'Enter new text...'
	String get enter_new_text => 'Enter new text...';
}

// Path: tools.characterscopy
class TranslationsToolsCharacterscopyEn {
	TranslationsToolsCharacterscopyEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Characters copy'
	String get title => 'Characters copy';

	/// en: 'Important'
	String get important => 'Important';

	/// en: 'Some characters may not be displayed correctly on all devices depending on your operating system. Also, some characters may not be supported by all apps and fonts. Just click on the character you want to copy and it will be copied to your clipboard.'
	String get important_description => 'Some characters may not be displayed correctly on all devices depending on your operating system. Also, some characters may not be supported by all apps and fonts. Just click on the character you want to copy and it will be copied to your clipboard.';

	/// en: 'Copied to clipboard'
	String get copied_to_clipboard => 'Copied to clipboard';
}

// Path: tools.whoisdomain
class TranslationsToolsWhoisdomainEn {
	TranslationsToolsWhoisdomainEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Whois domain'
	String get title => 'Whois domain';

	/// en: 'Domain name'
	String get domain_name => 'Domain name';

	/// en: 'Whois lookup'
	String get whois_lookup => 'Whois lookup';

	/// en: 'Disclaimer'
	String get disclaimer => 'Disclaimer';

	/// en: 'Toolbox provides WHOIS query functionality for informational purposes only. The data retrieved may not be accurate, complete, or up-to-date, and is subject to the terms and conditions of the respective domain registries. Users are prohibited from using WHOIS data for spam, unlawful purposes, or automated data collection. By using this tool, you agree to comply with applicable laws and the registry's terms of service. Toolbox and/or Koizeay assumes no responsibility for errors, omissions, or misuse of the data. Please note that some TLDs may not be supported by this tool.'
	String get disclaimer_text => 'Toolbox provides WHOIS query functionality for informational purposes only. The data retrieved may not be accurate, complete, or up-to-date, and is subject to the terms and conditions of the respective domain registries. Users are prohibited from using WHOIS data for spam, unlawful purposes, or automated data collection. By using this tool, you agree to comply with applicable laws and the registry\'s terms of service. Toolbox and/or Koizeay assumes no responsibility for errors, omissions, or misuse of the data. Please note that some TLDs may not be supported by this tool.';

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'IP address not supported'
	String get ip_address_not_supported => 'IP address not supported';

	/// en: 'This tool only supports domain names, not IP addresses'
	String get ip_address_not_supported_description => 'This tool only supports domain names, not IP addresses';

	/// en: 'No valid result found'
	String get no_result => 'No valid result found';

	/// en: 'View pretty'
	String get view_pretty => 'View pretty';

	/// en: 'View raw'
	String get view_raw => 'View raw';

	/// en: 'Raw WHOIS data'
	String get raw_whois_data => 'Raw WHOIS data';

	/// en: 'Domain'
	String get domain => 'Domain';

	/// en: 'Registrar'
	String get registrar => 'Registrar';

	/// en: 'Dates'
	String get dates => 'Dates';

	/// en: 'Status'
	String get status => 'Status';

	/// en: 'Name servers'
	String get name_servers => 'Name servers';

	/// en: 'Contact'
	String get contact => 'Contact';

	/// en: 'Other'
	String get other => 'Other';

	late final TranslationsToolsWhoisdomainErrorEn error = TranslationsToolsWhoisdomainErrorEn._(_root);
}

// Path: tools.textcounter
class TranslationsToolsTextcounterEn {
	TranslationsToolsTextcounterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Text counter'
	String get title => 'Text counter';

	/// en: 'Clear'
	String get clear => 'Clear';

	/// en: 'Enter text here'
	String get enter_text_here => 'Enter text here';

	/// en: 'Length'
	String get length => 'Length';

	/// en: 'Trimmed length'
	String get trimmed_length => 'Trimmed length';

	/// en: 'Raw length'
	String get raw_length => 'Raw length';

	/// en: 'Letters'
	String get letters => 'Letters';

	/// en: 'Words'
	String get words => 'Words';

	/// en: 'Spaces'
	String get spaces => 'Spaces';

	/// en: 'Digits'
	String get digits => 'Digits';

	/// en: 'Lines'
	String get lines => 'Lines';

	/// en: 'Empty lines'
	String get empty_lines => 'Empty lines';

	/// en: 'Total lines'
	String get total_lines => 'Total lines';

	/// en: 'Text input'
	String get text_input => 'Text input';
}

// Path: tools.romannumeral
class TranslationsToolsRomannumeralEn {
	TranslationsToolsRomannumeralEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Roman numeral'
	String get title => 'Roman numeral';

	/// en: 'Change to'
	String get change_to => 'Change to';

	/// en: 'roman numeral'
	String get roman_numeral => 'roman numeral';

	/// en: 'number'
	String get number => 'number';

	/// en: 'Number'
	String get number_input_hint => 'Number';

	/// en: 'Roman numeral'
	String get roman_numeral_input_hint => 'Roman numeral';

	/// en: 'Tap to copy'
	String get tap_to_copy => 'Tap to copy';

	/// en: 'Copied to clipboard'
	String get copied_to_clipboard => 'Copied to clipboard';

	late final TranslationsToolsRomannumeralErrorEn error = TranslationsToolsRomannumeralErrorEn._(_root);
}

// Path: tools.areacalculator
class TranslationsToolsAreacalculatorEn {
	TranslationsToolsAreacalculatorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Area calculator'
	String get title => 'Area calculator';

	/// en: 'Select a shape'
	String get select_a_shape => 'Select a shape';

	/// en: 'Values'
	String get values => 'Values';

	/// en: 'Area'
	String get area => 'Area';

	/// en: 'Calculate'
	String get calculate => 'Calculate';

	late final TranslationsToolsAreacalculatorShapesEn shapes = TranslationsToolsAreacalculatorShapesEn._(_root);
	late final TranslationsToolsAreacalculatorInputsEn inputs = TranslationsToolsAreacalculatorInputsEn._(_root);
	late final TranslationsToolsAreacalculatorErrorEn error = TranslationsToolsAreacalculatorErrorEn._(_root);
}

// Path: tools.mathtex
class TranslationsToolsMathtexEn {
	TranslationsToolsMathtexEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'MathTeX'
	String get title => 'MathTeX';

	/// en: 'Enter a mathematical expression in TeX format'
	String get enter_a_mathematical_expression_in_tex_format => 'Enter a mathematical expression in TeX format';

	/// en: 'TeX expression'
	String get texExpression => 'TeX expression';

	/// en: 'Export to image'
	String get export_to_image => 'Export to image';

	/// en: 'Preview'
	String get preview => 'Preview';

	/// en: 'Color'
	String get color => 'Color';

	/// en: 'Get help'
	String get get_help => 'Get help';

	/// en: 'Open help website'
	String get open_help_website => 'Open help website';

	/// en: 'Enter a mathematical expression in TeX format to render it as a mathematical formula. For example, the TeX expression '\\frac{a}{b}' will be rendered as a fraction with 'a' above 'b'. You can use any supported TeX syntax to create complex mathematical expressions. Once you have entered your expression, you can preview it and export it as an SVG file. Compatible with MathJax's TeX format.'
	String get help_content => 'Enter a mathematical expression in TeX format to render it as a mathematical formula. For example, the TeX expression \'\\frac{a}{b}\' will be rendered as a fraction with \'a\' above \'b\'. You can use any supported TeX syntax to create complex mathematical expressions. Once you have entered your expression, you can preview it and export it as an SVG file.\nCompatible with MathJax\'s TeX format.';

	/// en: 'Copied to clipboard'
	String get copied_to_clipboard => 'Copied to clipboard';

	late final TranslationsToolsMathtexErrorEn error = TranslationsToolsMathtexErrorEn._(_root);
}

// Path: tools.compass
class TranslationsToolsCompassEn {
	TranslationsToolsCompassEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Compass'
	String get title => 'Compass';

	late final TranslationsToolsCompassErrorEn error = TranslationsToolsCompassErrorEn._(_root);
}

// Path: tools.qrcreator
class TranslationsToolsQrcreatorEn {
	TranslationsToolsQrcreatorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'QR creator'
	String get title => 'QR creator';

	/// en: 'QR Code settings'
	String get qr_code_settings => 'QR Code settings';

	/// en: 'Low'
	String get ecc_low => 'Low';

	/// en: 'Medium'
	String get ecc_medium => 'Medium';

	/// en: 'Quartile'
	String get ecc_quartile => 'Quartile';

	/// en: 'High'
	String get ecc_high => 'High';

	/// en: 'QR code saved successfully'
	String get saved_successfully => 'QR code saved successfully';

	/// en: 'QR code shared successfully'
	String get shared_successfully => 'QR code shared successfully';

	/// en: 'Enter text or URL'
	String get enter_text_or_url => 'Enter text or URL';

	/// en: 'Error correction level'
	String get error_correction_level => 'Error correction level';

	/// en: 'Create'
	String get create => 'Create';

	/// en: 'Generated QR code'
	String get generated_qr_code => 'Generated QR code';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Share'
	String get share => 'Share';

	late final TranslationsToolsQrcreatorErrorEn error = TranslationsToolsQrcreatorErrorEn._(_root);
}

// Path: tools.pastebin
class TranslationsToolsPastebinEn {
	TranslationsToolsPastebinEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Pastebin'
	String get title => 'Pastebin';

	/// en: 'URL'
	String get url => 'URL';

	/// en: 'QR code'
	String get qr_code => 'QR code';

	/// en: 'Share'
	String get share => 'Share';

	/// en: 'What do you want to share?'
	String get share_dialog_message => 'What do you want to share?';

	/// en: 'Your short link is'
	String get your_short_link_is => 'Your short link is';

	/// en: 'Copy to clipboard'
	String get copy_to_clipboard => 'Copy to clipboard';

	/// en: 'Short link copied to clipboard'
	String get copied_to_clipboard => 'Short link copied to clipboard';

	/// en: 'The link ID is'
	String get the_link_id_is => 'The link ID is';

	/// en: 'Link ID copied to clipboard'
	String get link_id_copied_to_clipboard => 'Link ID copied to clipboard';

	/// en: 'The link password is'
	String get the_link_password_is => 'The link password is';

	/// en: 'Link password copied to clipboard'
	String get link_password_copied_to_clipboard => 'Link password copied to clipboard';

	/// en: 'Tap the password to copy it You will need it to view statistics about this link'
	String get link_password_hint_text => 'Tap the password to copy it\nYou will need it to view statistics about this link';

	/// en: 'Paste another text'
	String get paste_another_text => 'Paste another text';

	/// en: 'Text to paste'
	String get text_to_paste => 'Text to paste';

	/// en: 'Paste your text, source code or other content here'
	String get text_paste_field_hint => 'Paste your text, source code or other content here';

	/// en: 'By clicking the send button, you agree to the terms of service of "$url" available via the link below.'
	String by_clicking_you_accept({required Object url}) => 'By clicking the send button, you agree to the terms of service of "${url}" available via the link below.';

	/// en: 'Terms of service'
	String get terms_of_service => 'Terms of service';

	/// en: 'Send'
	String get send => 'Send';

	/// en: 'More features'
	String get more_features => 'More features';

	/// en: 'Use additional features such as URL shortening, link-in-bio profile, and more via the official JTU.ME website'
	String get more_features_message => 'Use additional features such as URL shortening, link-in-bio profile, and more via the official JTU.ME website';

	/// en: 'Open'
	String get open => 'Open';

	/// en: 'Options (optional)'
	String get options => 'Options (optional)';

	/// en: 'Access password'
	String get access_password => 'Access password';

	/// en: 'Expiration date (UTC)'
	String get expiration_date => 'Expiration date (UTC)';

	/// en: 'Use my account'
	String get use_my_account => 'Use my account';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'No account?'
	String get no_account => 'No account?';

	/// en: 'You can create a free account on the official JTU.ME website to manage your links and pastes.'
	String get no_account_message => 'You can create a free account on the official JTU.ME website to manage your links and pastes.';

	late final TranslationsToolsPastebinErrorEn error = TranslationsToolsPastebinErrorEn._(_root);

	/// en: 'Management info'
	String get management_info => 'Management info';

	/// en: 'To view statistics and manage this link, use your JTU.ME account on the official website'
	String get manage_with_account => 'To view statistics and manage this link, use your JTU.ME account on the official website';
}

// Path: tools.percentagecalculator
class TranslationsToolsPercentagecalculatorEn {
	TranslationsToolsPercentagecalculatorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Percentage calculator'
	String get title => 'Percentage calculator';

	/// en: 'Result'
	String get result => 'Result';

	/// en: 'Percentage'
	String get percentage => 'Percentage';

	/// en: 'e.g.'
	String get eg => 'e.g.';

	/// en: 'Total'
	String get total => 'Total';

	/// en: 'First value'
	String get first_value => 'First value';

	/// en: 'Second value'
	String get second_value => 'Second value';

	/// en: 'What is'
	String get what_is => 'What is';

	/// en: 'of'
	String get of => 'of';

	/// en: 'is what percentage of'
	String get is_what_percentage_of => 'is what percentage of';

	/// en: 'What is the percentage difference'
	String get what_is_the_percentage_difference => 'What is the percentage difference';

	/// en: 'from'
	String get from => 'from';

	/// en: 'to'
	String get to => 'to';

	/// en: 'Calculate'
	String get calculate => 'Calculate';

	late final TranslationsToolsPercentagecalculatorErrorEn error = TranslationsToolsPercentagecalculatorErrorEn._(_root);
}

// Path: tools.passwordgenerator
class TranslationsToolsPasswordgeneratorEn {
	TranslationsToolsPasswordgeneratorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Password generator'
	String get title => 'Password generator';

	/// en: 'Password length'
	String get password_length => 'Password length';

	/// en: 'Number of digits'
	String get number_of_digits => 'Number of digits';

	/// en: 'Number of special characters'
	String get number_of_special_characters => 'Number of special characters';

	/// en: 'Generate password'
	String get generate_password => 'Generate password';

	/// en: 'Password copied to clipboard'
	String get password_copied_to_clipboard => 'Password copied to clipboard';

	/// en: 'Tap to copy'
	String get tap_to_copy => 'Tap to copy';

	late final TranslationsToolsPasswordgeneratorErrorEn error = TranslationsToolsPasswordgeneratorErrorEn._(_root);

	/// en: 'Generated password'
	String get generated_password => 'Generated password';
}

// Path: tools.portscanner
class TranslationsToolsPortscannerEn {
	TranslationsToolsPortscannerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Port scanner'
	String get title => 'Port scanner';

	/// en: 'Host to scan'
	String get host_to_scan => 'Host to scan';

	/// en: 'Start port'
	String get start_port => 'Start port';

	/// en: 'End port'
	String get end_port => 'End port';

	/// en: 'Start scan'
	String get start_scan => 'Start scan';

	/// en: 'Stop scan'
	String get stop_scan => 'Stop scan';

	/// en: 'Port'
	String get port => 'Port';

	late final TranslationsToolsPortscannerErrorEn error = TranslationsToolsPortscannerErrorEn._(_root);

	/// en: 'example.com or 192.168.1.1'
	String get example_domain_or_ip => 'example.com or 192.168.1.1';

	/// en: 'Port Range'
	String get port_range => 'Port Range';

	/// en: 'Scan progress'
	String get scan_progress => 'Scan progress';
}

// Path: tools.commons
class TranslationsToolsCommonsEn {
	TranslationsToolsCommonsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Commons'
	String get title => 'Commons';

	/// en: 'Data source and licensing'
	String get data_source_and_licensing => 'Data source and licensing';

	/// en: 'All media files are sourced from Wikimedia Commons and are subject to their respective licenses. Please ensure compliance with the terms of each license when using and downloading the media files.'
	String get data_source_and_licensing_description => 'All media files are sourced from Wikimedia Commons and are subject to their respective licenses. Please ensure compliance with the terms of each license when using and downloading the media files.';

	/// en: 'Open Wikimedia Commons'
	String get open_wikimedia_commons => 'Open Wikimedia Commons';

	/// en: 'Search files'
	String get search_files => 'Search files';

	/// en: 'Enter a search query to find media files on Wikimedia Commons'
	String get enter_search_query_to_find_files => 'Enter a search query to find media files on Wikimedia Commons';

	/// en: 'View on Wikimedia Commons'
	String get view_on_wikimedia => 'View on Wikimedia Commons';

	/// en: 'Previous'
	String get previous => 'Previous';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'B'
	String get bytes => 'B';

	/// en: 'KB'
	String get kilobytes => 'KB';

	/// en: 'MB'
	String get megabytes => 'MB';

	/// en: 'GB'
	String get gigabytes => 'GB';

	/// en: 'No files found'
	String get no_files_found => 'No files found';

	/// en: 'Close preview'
	String get close_preview => 'Close preview';

	/// en: 'View license details'
	String get view_license_details => 'View license details';

	/// en: 'Download media'
	String get download_media => 'Download media';

	/// en: 'Close'
	String get close => 'Close';

	/// en: 'File information'
	String get file_information => 'File information';

	/// en: 'Unknown license'
	String get unknown_license => 'Unknown license';

	/// en: 'MIME type'
	String get mime_type => 'MIME type';

	/// en: 'File size'
	String get file_size => 'File size';

	/// en: 'Dimensions'
	String get dimensions => 'Dimensions';

	/// en: 'Duration'
	String get duration => 'Duration';

	/// en: 'File license'
	String get file_license => 'File license';

	/// en: 'File by'
	String get file_by => 'File by';

	/// en: 'File downloaded successfully'
	String get file_downloaded_successfully => 'File downloaded successfully';

	/// en: 'Downloading...'
	String get downloading => 'Downloading...';

	late final TranslationsToolsCommonsErrorEn error = TranslationsToolsCommonsErrorEn._(_root);

	/// en: 'Load preview'
	String get load_preview => 'Load preview';

	/// en: 'Page $number'
	String page({required Object number}) => 'Page ${number}';
}

// Path: tools.crdeck
class TranslationsToolsCrdeckEn {
	TranslationsToolsCrdeckEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Clash Royale deck'
	String get title => 'Clash Royale deck';

	/// en: 'Clear unlocked deck cards'
	String get clear_unlocked_deck_cards => 'Clear unlocked deck cards';

	/// en: 'About and credits'
	String get about_and_credits => 'About and credits';

	/// en: 'This tool uses the official Clash Royale API provided by Supercell (via a Koizeay backend server). This tool is not affiliated with or endorsed by Supercell in any way. All Clash Royale content, including but not limited to images, names, and trademarks, are the property of Supercell.'
	String get about_and_credits_description => 'This tool uses the official Clash Royale API provided by Supercell (via a Koizeay backend server). This tool is not affiliated with or endorsed by Supercell in any way. All Clash Royale content, including but not limited to images, names, and trademarks, are the property of Supercell.';

	/// en: 'Supercell website'
	String get supercell_website => 'Supercell website';

	/// en: 'No deck'
	String get no_deck => 'No deck';

	/// en: 'Generate new deck'
	String get generate_new_deck => 'Generate new deck';

	/// en: 'Open deck in Clash Royale'
	String get open_deck_in_clash_royale => 'Open deck in Clash Royale';

	/// en: 'Share deck'
	String get share_deck => 'Share deck';

	/// en: 'Search cards'
	String get search_cards => 'Search cards';

	/// en: 'Import cards from player profile'
	String get import_cards_from_player_profile => 'Import cards from player profile';

	/// en: 'Deselect all cards'
	String get deselect_all_cards => 'Deselect all cards';

	/// en: 'Select all cards'
	String get select_all_cards => 'Select all cards';

	/// en: '$elixirs elixirs'
	String x_elixirs({required Object elixirs}) => '${elixirs} elixirs';

	/// en: 'Player tag'
	String get player_tag => 'Player tag';

	/// en: 'Import'
	String get import => 'Import';

	/// en: 'Importing cards...'
	String get importing_cards => 'Importing cards...';

	/// en: 'Check out my Clash Royale deck created with Toolbox! Open it in Clash Royale using this link: $url'
	String share_deck_text_message({required Object url}) => 'Check out my Clash Royale deck created with Toolbox!\nOpen it in Clash Royale using this link: ${url}';

	late final TranslationsToolsCrdeckErrorEn error = TranslationsToolsCrdeckErrorEn._(_root);
}

// Path: tools.iplocation
class TranslationsToolsIplocationEn {
	TranslationsToolsIplocationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'IP location'
	String get title => 'IP location';

	/// en: 'API used'
	String get api_used => 'API used';

	/// en: 'About the API'
	String get about_the_api => 'About the API';

	/// en: 'This tool uses the API provided by "$source" to fetch the location information of the given IP address'
	String about_the_api_description({required Object source}) => 'This tool uses the API provided by "${source}" to fetch the location information of the given IP address';

	/// en: 'Visit website'
	String get visit_website => 'Visit website';

	/// en: 'IP address'
	String get ip_address => 'IP address';

	/// en: 'Get IP location'
	String get get_ip_location => 'Get IP location';

	/// en: 'Location information'
	String get location_information => 'Location information';

	/// en: 'N/A'
	String get n_a => 'N/A';

	/// en: 'Country'
	String get country => 'Country';

	/// en: 'Provider'
	String get provider => 'Provider';

	late final TranslationsToolsIplocationErrorEn error = TranslationsToolsIplocationErrorEn._(_root);
}

// Path: credits.translations
class TranslationsCreditsTranslationsEn {
	TranslationsCreditsTranslationsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Translations'
	String get title => 'Translations';

	/// en: 'English by $author'
	String english({required Object author}) => 'English by ${author}';

	/// en: 'French by $author'
	String french({required Object author}) => 'French by ${author}';

	/// en: 'Japanese by $author'
	String japanese({required Object author}) => 'Japanese by ${author}';
}

// Path: tools.megaphone.error
class TranslationsToolsMegaphoneErrorEn {
	TranslationsToolsMegaphoneErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Permission denied, please allow the application to access the microphone in your device settings'
	String get microphone_permission_denied => 'Permission denied, please allow the application to access the microphone in your device settings';
}

// Path: tools.nslookup.error
class TranslationsToolsNslookupErrorEn {
	TranslationsToolsNslookupErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Please enter a domain name'
	String get please_enter_a_domain_name => 'Please enter a domain name';

	/// en: 'There is no address associated with the host name. Check your input and your internet connection then try again.'
	String get no_address_associated_with_domain => 'There is no address associated with the host name.\nCheck your input and your internet connection then try again.';
}

// Path: tools.ping.error
class TranslationsToolsPingErrorEn {
	TranslationsToolsPingErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Please enter a domain name or IP address'
	String get please_enter_a_domain_name_or_ip => 'Please enter a domain name or IP address';

	/// en: 'Request timeout'
	String get request_timeout => 'Request timeout';

	/// en: 'Unknown host'
	String get unkown_host => 'Unknown host';

	/// en: 'No reply'
	String get no_reply => 'No reply';

	/// en: 'Unknown error'
	String get unkown_error => 'Unknown error';
}

// Path: tools.soundmeter.error
class TranslationsToolsSoundmeterErrorEn {
	TranslationsToolsSoundmeterErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Impossible to start the sound meter'
	String get impossible_to_start_the_sound_meter => 'Impossible to start the sound meter';

	/// en: 'No sound detected, check that the application has access to the microphone in the settings of your device.'
	String get no_sound_detected => 'No sound detected, check that the application has access to the microphone in the settings of your device.';
}

// Path: tools.qrreader.error
class TranslationsToolsQrreaderErrorEn {
	TranslationsToolsQrreaderErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'No QR code'
	String get no_qr_code => 'No QR code';

	/// en: 'No result found'
	String get error_no_result => 'No result found';
}

// Path: tools.roulette.warning
class TranslationsToolsRouletteWarningEn {
	TranslationsToolsRouletteWarningEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'You can't have more than $numberOfItems items in the roulette.'
	String you_cant_add_more_than_x_items({required Object numberOfItems}) => 'You can\'t have more than ${numberOfItems} items in the roulette.';

	/// en: 'You must have at least $numberOfItems items in the roulette.'
	String you_must_have_at_least_x_items({required Object numberOfItems}) => 'You must have at least ${numberOfItems} items in the roulette.';

	/// en: 'You must enter an item name.'
	String get you_must_enter_an_item_name => 'You must enter an item name.';
}

// Path: tools.randomnumber.error
class TranslationsToolsRandomnumberErrorEn {
	TranslationsToolsRandomnumberErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Invalid number, please try again.'
	String get invalid_number => 'Invalid number, please try again.';

	/// en: 'The minimum number must be lower than the maximum number.'
	String get min_must_be_lower_than_max => 'The minimum number must be lower than the maximum number.';

	/// en: 'The minimum and maximum numbers must be between $minNumberLimit and $maxNumberLimit.'
	String min_and_max_must_be_between_x_and_y({required Object minNumberLimit, required Object maxNumberLimit}) => 'The minimum and maximum numbers must be between ${minNumberLimit} and ${maxNumberLimit}.';
}

// Path: tools.sshclient.error
class TranslationsToolsSshclientErrorEn {
	TranslationsToolsSshclientErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Invalid port'
	String get invalid_port => 'Invalid port';

	/// en: 'You may have entered a passphrase when your key is not encrypted, or vice versa'
	String get invalid_passphrase => 'You may have entered a passphrase when your key is not encrypted, or vice versa';

	/// en: 'The key you provided is not a valid private key'
	String get invalid_private_key => 'The key you provided is not a valid private key';

	/// en: 'Authentication failed'
	String get authentication_failed => 'Authentication failed';

	/// en: 'Could not connect to host'
	String get connection_failed => 'Could not connect to host';

	/// en: 'An unknown error occurred. Please try again'
	String get unknown_error => 'An unknown error occurred. Please try again';
}

// Path: tools.uuidgenerator.error
class TranslationsToolsUuidgeneratorErrorEn {
	TranslationsToolsUuidgeneratorErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'The namespace is not a valid UUID'
	String get invalid_namespace => 'The namespace is not a valid UUID';
}

// Path: tools.texttospeech.error
class TranslationsToolsTexttospeechErrorEn {
	TranslationsToolsTexttospeechErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Please try again later. If it's the first time you're using this language, please wait a few seconds and try again.'
	String get please_try_again => 'Please try again later.\nIf it\'s the first time you\'re using this language, please wait a few seconds and try again.';

	/// en: 'Please select a language'
	String get please_select_a_language => 'Please select a language';
}

// Path: tools.nearbypublictransportstops.error
class TranslationsToolsNearbypublictransportstopsErrorEn {
	TranslationsToolsNearbypublictransportstopsErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Location permission denied or disabled, please enable it in settings in order to see nearby stops.'
	String get location_permission_denied => 'Location permission denied or disabled, please enable it in settings in order to see nearby stops.';

	/// en: 'Please check your internet connection and try again.'
	String get check_internet_connection => 'Please check your internet connection and try again.';

	/// en: 'The API returned an empty response'
	String get api_empty_response => 'The API returned an empty response';

	/// en: 'The API returned an error: $errorCode'
	String api_error_xxx({required Object errorCode}) => 'The API returned an error: ${errorCode}';

	/// en: 'No stops found for this search'
	String get no_stops_found => 'No stops found for this search';

	/// en: 'No maps app found on your device'
	String get no_maps_app => 'No maps app found on your device';
}

// Path: tools.fileencryption.error
class TranslationsToolsFileencryptionErrorEn {
	TranslationsToolsFileencryptionErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Failed to read the file'
	String get failed_to_read_file => 'Failed to read the file';

	/// en: 'Failed to decrypt the file, please check the password'
	String get failed_to_decrypt_file => 'Failed to decrypt the file, please check the password';

	/// en: 'Please enter a password'
	String get please_enter_a_password => 'Please enter a password';
}

// Path: tools.youtubethumbnail.error
class TranslationsToolsYoutubethumbnailErrorEn {
	TranslationsToolsYoutubethumbnailErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Failed to download thumbnail from YouTube'
	String get failed_to_download => 'Failed to download thumbnail from YouTube';

	/// en: 'Please enter a valid YouTube video URL You also need an internet connection to download the thumbnail from YouTube'
	String get please_enter_a_valid_video_id => 'Please enter a valid YouTube video URL\nYou also need an internet connection to download the thumbnail from YouTube';
}

// Path: tools.nationalanthems.error
class TranslationsToolsNationalanthemsErrorEn {
	TranslationsToolsNationalanthemsErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Impossible to load the list of anthems. Please check your internet connection and try again.'
	String get failed_to_load_list => 'Impossible to load the list of anthems. Please check your internet connection and try again.';

	/// en: 'Impossible to play the anthem. Please check your internet connection and try again.'
	String get failed_to_play_anthem => 'Impossible to play the anthem. Please check your internet connection and try again.';
}

// Path: tools.httprequest.error
class TranslationsToolsHttprequestErrorEn {
	TranslationsToolsHttprequestErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'The URL cannot be empty'
	String get url_cannot_be_empty => 'The URL cannot be empty';

	/// en: 'Invalid URL'
	String get invalid_url => 'Invalid URL';

	/// en: 'Invalid headers'
	String get invalid_headers => 'Invalid headers';

	/// en: 'The request timed out. Please check your input and your internet connection then try again.'
	String get timeout => 'The request timed out.\nPlease check your input and your internet connection then try again.';

	/// en: 'An error occurred while sending the request. Please check your input and your internet connection then try again.'
	String get other_error => 'An error occurred while sending the request.\nPlease check your input and your internet connection then try again.';
}

// Path: tools.osm.error
class TranslationsToolsOsmErrorEn {
	TranslationsToolsOsmErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'You need to grant location permissions to use this feature'
	String get location_permission_denied => 'You need to grant location permissions to use this feature';

	/// en: 'Location services are disabled'
	String get location_services_disabled => 'Location services are disabled';
}

// Path: tools.gameoflife.error
class TranslationsToolsGameoflifeErrorEn {
	TranslationsToolsGameoflifeErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'No alive cells'
	String get no_alive_cells => 'No alive cells';

	/// en: 'There are no alive cells. Please tap on the grid to add some.'
	String get no_alive_cells_description => 'There are no alive cells.\nPlease tap on the grid to add some.';

	/// en: 'Please stop the simulation first'
	String get please_stop_simulation => 'Please stop the simulation first';
}

// Path: tools.speedometer.error
class TranslationsToolsSpeedometerErrorEn {
	TranslationsToolsSpeedometerErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Location required'
	String get location_permission_denied_title => 'Location required';

	/// en: 'This tool requires location permission to determine your speed.'
	String get location_permission_denied_description => 'This tool requires location permission to determine your speed.';

	/// en: 'Location services disabled'
	String get location_services_disabled_title => 'Location services disabled';

	/// en: 'This tool requires location services to be enabled to determine your speed.'
	String get location_services_disabled_description => 'This tool requires location services to be enabled to determine your speed.';
}

// Path: tools.mc_server_ping.error
class TranslationsToolsMcServerPingErrorEn {
	TranslationsToolsMcServerPingErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Please enter a server IP or domain'
	String get please_enter_a_server_ip => 'Please enter a server IP or domain';

	/// en: 'The server is offline or does not exist'
	String get server_offline_or_does_not_exist => 'The server is offline or does not exist';

	/// en: 'Please check your internet connection and try again'
	String get please_check_your_internet_connection => 'Please check your internet connection and try again';
}

// Path: tools.timestampconverter.error
class TranslationsToolsTimestampconverterErrorEn {
	TranslationsToolsTimestampconverterErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Invalid timestamp'
	String get invalid_timestamp => 'Invalid timestamp';
}

// Path: tools.urlshortener.error
class TranslationsToolsUrlshortenerErrorEn {
	TranslationsToolsUrlshortenerErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Failed to shorten the URL, please check your input and your internet connection.'
	String get failed_to_shorten_url => 'Failed to shorten the URL, please check your input and your internet connection.';

	/// en: 'Impossible to connect to the server'
	String get impossible_to_connect_to_the_server => 'Impossible to connect to the server';

	/// en: 'Failed to connect to the server, please check your internet connection and try again.'
	String get impossible_to_connect_to_the_server_message => 'Failed to connect to the server, please check your internet connection and try again.';

	/// en: 'Unauthorized. Please check your credentials.'
	String get unauthorized => 'Unauthorized. Please check your credentials.';

	/// en: 'The expiration date must be in the future.'
	String get invalid_expiration_date => 'The expiration date must be in the future.';
}

// Path: tools.counter.error
class TranslationsToolsCounterErrorEn {
	TranslationsToolsCounterErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'The number you entered is invalid'
	String get invalid_number => 'The number you entered is invalid';

	/// en: 'The number must be between $minNumberLimit and $maxNumberLimit'
	String the_number_must_be_between_x_and_y({required Object minNumberLimit, required Object maxNumberLimit}) => 'The number must be between ${minNumberLimit} and ${maxNumberLimit}';

	/// en: 'You must have at least one button'
	String get you_must_have_at_least_one_button => 'You must have at least one button';

	/// en: 'This button already exists'
	String get this_button_already_exists => 'This button already exists';
}

// Path: tools.bitwisecalculator.error
class TranslationsToolsBitwisecalculatorErrorEn {
	TranslationsToolsBitwisecalculatorErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Invalid input'
	String get invalid_input => 'Invalid input';
}

// Path: tools.musicsearch.error
class TranslationsToolsMusicsearchErrorEn {
	TranslationsToolsMusicsearchErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Error playing audio preview. Please try again later.'
	String get error_playing_audio_preview => 'Error playing audio preview. Please try again later.';

	/// en: 'Unable to connect to the API, please check your internet connection and try again.'
	String get unable_to_connect_to_the_api => 'Unable to connect to the API, please check your internet connection and try again.';
}

// Path: tools.musicanalyser.error
class TranslationsToolsMusicanalyserErrorEn {
	TranslationsToolsMusicanalyserErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Permission denied'
	String get permission_denied => 'Permission denied';

	/// en: 'The microphone permission is required to analyze music. Please grant the permission and try again.'
	String get permission_denied_description => 'The microphone permission is required to analyze music. Please grant the permission and try again.';

	/// en: 'No match found'
	String get no_match_found => 'No match found';

	/// en: 'No music match was found. Please try again.'
	String get no_match_found_description => 'No music match was found. Please try again.';

	/// en: 'An error occurred while analyzing the music. Please check your internet connection and try again.'
	String get error_occurred => 'An error occurred while analyzing the music. Please check your internet connection and try again.';

	/// en: 'Please update the app and try again. If the problem persists with the latest version, please try again later.'
	String get please_update_the_app_and_try_again => 'Please update the app and try again. If the problem persists with the latest version, please try again later.';
}

// Path: tools.whoisdomain.error
class TranslationsToolsWhoisdomainErrorEn {
	TranslationsToolsWhoisdomainErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Impossible to get the whois information, please check your input and your internet connection then try again'
	String get impossible_to_get_whois_information => 'Impossible to get the whois information, please check your input and your internet connection then try again';
}

// Path: tools.romannumeral.error
class TranslationsToolsRomannumeralErrorEn {
	TranslationsToolsRomannumeralErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Invalid or unsupported roman numeral'
	String get invalid_roman_numeral => 'Invalid or unsupported roman numeral';
}

// Path: tools.areacalculator.shapes
class TranslationsToolsAreacalculatorShapesEn {
	TranslationsToolsAreacalculatorShapesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Circle'
	String get circle => 'Circle';

	/// en: 'Ellipse'
	String get ellipse => 'Ellipse';

	/// en: 'Equilateral triangle'
	String get equilateral_triangle => 'Equilateral triangle';

	/// en: 'Kite'
	String get kite => 'Kite';

	/// en: 'Parallelogram'
	String get parallelogram => 'Parallelogram';

	/// en: 'Rectangle'
	String get rectangle => 'Rectangle';

	/// en: 'Rhombus'
	String get rhombus => 'Rhombus';

	/// en: 'Regular hexagon'
	String get regular_hexagon => 'Regular hexagon';

	/// en: 'Regular octagon'
	String get regular_octagon => 'Regular octagon';

	/// en: 'Regular pentagon'
	String get regular_pentagon => 'Regular pentagon';

	/// en: 'Regular polygon'
	String get regular_polygon => 'Regular polygon';

	/// en: 'Square'
	String get square => 'Square';

	/// en: 'Trapezoid'
	String get trapezoid => 'Trapezoid';

	/// en: 'Triangle'
	String get triangle => 'Triangle';
}

// Path: tools.areacalculator.inputs
class TranslationsToolsAreacalculatorInputsEn {
	TranslationsToolsAreacalculatorInputsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Radius'
	String get radius => 'Radius';

	/// en: 'Major axis'
	String get major_axis => 'Major axis';

	/// en: 'Minor axis'
	String get minor_axis => 'Minor axis';

	/// en: 'Side'
	String get side => 'Side';

	/// en: 'Base'
	String get base => 'Base';

	/// en: 'Height'
	String get height => 'Height';

	/// en: 'Diagonal 1'
	String get diagonal_1 => 'Diagonal 1';

	/// en: 'Diagonal 2'
	String get diagonal_2 => 'Diagonal 2';

	/// en: 'Length'
	String get length => 'Length';

	/// en: 'Width'
	String get width => 'Width';

	/// en: 'Number of sides'
	String get number_of_sides => 'Number of sides';

	/// en: 'Side length'
	String get side_length => 'Side length';

	/// en: 'Apothem'
	String get apothem => 'Apothem';

	/// en: 'Base 1'
	String get base_1 => 'Base 1';

	/// en: 'Base 2'
	String get base_2 => 'Base 2';
}

// Path: tools.areacalculator.error
class TranslationsToolsAreacalculatorErrorEn {
	TranslationsToolsAreacalculatorErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Invalid input'
	String get invalid_input => 'Invalid input';

	/// en: 'Please enter a value for'
	String get please_enter_a_value_for => 'Please enter a value for';

	/// en: 'Please enter a valid number for'
	String get please_enter_a_valid_number_for => 'Please enter a valid number for';

	/// en: 'Please enter a positive number for'
	String get please_enter_a_positive_number_for => 'Please enter a positive number for';

	/// en: 'Please try again with different values'
	String get please_try_again_with_different_values => 'Please try again with different values';

	/// en: 'The area of the shape is zero'
	String get the_area_of_the_shape_is_zero => 'The area of the shape is zero';
}

// Path: tools.mathtex.error
class TranslationsToolsMathtexErrorEn {
	TranslationsToolsMathtexErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'An error occurred while rendering the MathTeX'
	String get an_error_occurred_while_rendering_the_mathtex => 'An error occurred while rendering the MathTeX';

	/// en: 'Please wait until the preview is loaded'
	String get please_wait_until_the_preview_is_loaded => 'Please wait until the preview is loaded';

	/// en: 'An error occurred while exporting the image'
	String get an_error_occurred_while_exporting_the_image => 'An error occurred while exporting the image';

	/// en: 'Could not open help website, please check your configuration and try again'
	String get could_not_open_help_website => 'Could not open help website, please check your configuration and try again';
}

// Path: tools.compass.error
class TranslationsToolsCompassErrorEn {
	TranslationsToolsCompassErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Please grant location permission to use the compass. It is mandatory to access the device's sensors.'
	String get please_grant_location_permission => 'Please grant location permission to use the compass. It is mandatory to access the device\'s sensors.';
}

// Path: tools.qrcreator.error
class TranslationsToolsQrcreatorErrorEn {
	TranslationsToolsQrcreatorErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Failed to create QR code, please check your input and try again'
	String get failed_to_create_qr_code => 'Failed to create QR code, please check your input and try again';
}

// Path: tools.pastebin.error
class TranslationsToolsPastebinErrorEn {
	TranslationsToolsPastebinErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Failed to obtain short link, please check your internet connection and try again'
	String get failed_to_obtain_short_link => 'Failed to obtain short link, please check your internet connection and try again';

	/// en: 'Impossible to connect to the server'
	String get impossible_to_connect_to_the_server => 'Impossible to connect to the server';

	/// en: 'Failed to connect to the server, please check your internet connection and try again.'
	String get impossible_to_connect_to_the_server_message => 'Failed to connect to the server, please check your internet connection and try again.';

	/// en: 'Unauthorized. Please check your credentials.'
	String get unauthorized => 'Unauthorized. Please check your credentials.';

	/// en: 'The expiration date must be in the future.'
	String get invalid_expiration_date => 'The expiration date must be in the future.';
}

// Path: tools.percentagecalculator.error
class TranslationsToolsPercentagecalculatorErrorEn {
	TranslationsToolsPercentagecalculatorErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Please enter valid numbers for both fields'
	String get please_enter_valid_numbers_for_both_fields => 'Please enter valid numbers for both fields';

	/// en: 'Total cannot be zero'
	String get total_cannot_be_zero => 'Total cannot be zero';

	/// en: 'First value cannot be zero'
	String get first_value_cannot_be_zero => 'First value cannot be zero';
}

// Path: tools.passwordgenerator.error
class TranslationsToolsPasswordgeneratorErrorEn {
	TranslationsToolsPasswordgeneratorErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Password length must be greater than 0'
	String get password_length_must_be_greater_than_0 => 'Password length must be greater than 0';

	/// en: 'Password length cannot exceed $maxLength characters'
	String password_length_cannot_exceed_x_characters({required Object maxLength}) => 'Password length cannot exceed ${maxLength} characters';

	/// en: 'Password length cannot be less than the sum of digits and special characters'
	String get password_length_cannot_be_less_than_the_sum_of_digits_and_special_characters => 'Password length cannot be less than the sum of digits and special characters';
}

// Path: tools.portscanner.error
class TranslationsToolsPortscannerErrorEn {
	TranslationsToolsPortscannerErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Please enter a valid host'
	String get please_enter_a_valid_host => 'Please enter a valid host';

	/// en: 'Please enter a valid port number (1-65535) for both fields'
	String get please_enter_a_valid_port_number => 'Please enter a valid port number (1-65535) for both fields';
}

// Path: tools.commons.error
class TranslationsToolsCommonsErrorEn {
	TranslationsToolsCommonsErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Error downloading file ($errorCode)'
	String error_downloading_file({required Object errorCode}) => 'Error downloading file (${errorCode})';

	/// en: 'Error downloading file. Please check your internet connection and try again.'
	String get error_download_file_check_internet => 'Error downloading file. Please check your internet connection and try again.';
}

// Path: tools.crdeck.error
class TranslationsToolsCrdeckErrorEn {
	TranslationsToolsCrdeckErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Please check your internet connection and try again.'
	String get please_check_your_internet_connection => 'Please check your internet connection and try again.';

	/// en: 'An error occurred while loading the Clash Royale cards from the server. Please check your network connection and try again.'
	String get error_while_loading_cards_from_server => 'An error occurred while loading the Clash Royale cards from the server.\nPlease check your network connection and try again.';

	/// en: 'Failed to load Clash Royale cards from the server ($errorCode)'
	String failed_to_load_cards_from_server({required Object errorCode}) => 'Failed to load Clash Royale cards from the server (${errorCode})';

	/// en: 'Invalid tag'
	String get invalid_tag => 'Invalid tag';

	/// en: 'Please enter a valid player tag'
	String get please_enter_a_valid_player_tag => 'Please enter a valid player tag';

	/// en: 'Failed to import cards from player profile ($errorCode), you can still import cards manually'
	String failed_to_import_cards_from_player_profile({required Object errorCode}) => 'Failed to import cards from player profile (${errorCode}), you can still import cards manually';

	/// en: 'An error occurred while importing cards, you can still import cards manually'
	String get an_error_occurred_while_importing_cards => 'An error occurred while importing cards, you can still import cards manually';

	/// en: 'Not enough cards selected'
	String get not_enough_cards_selected => 'Not enough cards selected';

	/// en: 'Please select at least $numberOfCards more cards to create a valid deck'
	String please_select_at_least_x_more_cards({required Object numberOfCards}) => 'Please select at least ${numberOfCards} more cards to create a valid deck';

	/// en: 'Deck is full'
	String get deck_is_full => 'Deck is full';

	/// en: 'You can only add up to $numberOfCards cards to the deck'
	String you_can_only_add_up_to_x_cards_to_the_deck({required Object numberOfCards}) => 'You can only add up to ${numberOfCards} cards to the deck';

	/// en: 'Card already in deck'
	String get card_already_in_deck => 'Card already in deck';

	/// en: 'This card is already in the deck'
	String get this_card_is_already_in_the_deck => 'This card is already in the deck';

	/// en: 'Incomplete deck'
	String get incomplete_deck => 'Incomplete deck';

	/// en: 'Please add $numberOfCards more cards to the deck before opening it in Clash Royale'
	String please_add_x_more_cards_to_the_deck_before_opening_it_in_clash_royale({required Object numberOfCards}) => 'Please add ${numberOfCards} more cards to the deck before opening it in Clash Royale';

	/// en: 'Please add $numberOfCards more cards to the deck before sharing it'
	String please_add_x_more_cards_to_the_deck_before_sharing_it({required Object numberOfCards}) => 'Please add ${numberOfCards} more cards to the deck before sharing it';
}

// Path: tools.iplocation.error
class TranslationsToolsIplocationErrorEn {
	TranslationsToolsIplocationErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'IP required'
	String get ip_required => 'IP required';

	/// en: 'Please enter an IP address to fetch its location'
	String get please_enter_an_ip_address => 'Please enter an IP address to fetch its location';

	/// en: 'Error fetching location'
	String get error_fetching_location => 'Error fetching location';

	/// en: 'It seems there was an error fetching the location. Please check your input and your internet connection then try again'
	String get error_fetching_location_description => 'It seems there was an error fetching the location. Please check your input and your internet connection then try again';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return _flatMapFunction$0(path)
			?? _flatMapFunction$1(path);
	}

	dynamic _flatMapFunction$0(String path) {
		switch (path) {
			case 'generic.app_name': return 'Toolbox';
			case 'generic.tools': return 'Tools';
			case 'generic.categories': return 'Categories';
			case 'generic.error': return 'Error';
			case 'generic.warning': return 'Warning';
			case 'generic.ok': return 'OK';
			case 'generic.cancel': return 'Cancel';
			case 'generic.search': return 'Search';
			case 'generic.enable': return 'Enable';
			case 'generic.reset': return 'Reset';
			case 'generic.yes': return 'Yes';
			case 'generic.no': return 'No';
			case 'generic.copy': return 'Copy';
			case 'generic.share': return 'Share';
			case 'generic.generate': return 'Generate';
			case 'homepage.update_available': return 'Update available';
			case 'homepage.update_available_message': return 'A new version of Toolbox is available. Update it now to get the latest features and improvements.';
			case 'homepage.switch_view': return 'Switch view';
			case 'homepage.search_all_categories': return 'Search in all categories';
			case 'homepage.clear_search': return 'Clear search';
			case 'homepage.add': return 'Add';
			case 'homepage.remove': return 'Remove';
			case 'homepage.favorites': return 'Favorites';
			case 'homepage.would_you_like_to_add_this_tool_to_favorites': return 'Would you like to add this tool to favorites?';
			case 'homepage.would_you_like_to_remove_this_tool_from_favorites': return 'Would you like to remove this tool from favorites?';
			case 'categories.audio': return 'Audio';
			case 'categories.calculations': return 'Calculations';
			case 'categories.games': return 'Games';
			case 'categories.geography': return 'Geography';
			case 'categories.miscellaneous': return 'Miscellaneous';
			case 'categories.network': return 'Network';
			case 'categories.random': return 'Random';
			case 'categories.time': return 'Time';
			case 'categories.web': return 'Web';
			case 'tools.baseconverter.title': return 'Base converter';
			case 'tools.baseconverter.input': return 'Input';
			case 'tools.baseconverter.results': return 'Results';
			case 'tools.baseconverter.enter_a_dec_number': return 'Enter a decimal number';
			case 'tools.baseconverter.enter_a_hex_number': return 'Enter a hexadecimal number';
			case 'tools.baseconverter.enter_a_bin_number': return 'Enter a binary number';
			case 'tools.baseconverter.enter_a_oct_number': return 'Enter an octal number';
			case 'tools.baseconverter.hexadecimal': return 'Hexadecimal';
			case 'tools.baseconverter.binary': return 'Binary';
			case 'tools.baseconverter.octal': return 'Octal';
			case 'tools.baseconverter.decimal': return 'Decimal';
			case 'tools.baseconverter.incompatible_number': return 'Incompatible number';
			case 'tools.baseconverter.too_big_number': return 'Too big number';
			case 'tools.baseconverter.the_number_you_entered_is_not_a_valid_x_number': return ({required Object base}) => 'The number you entered is not a valid ${base} number';
			case 'tools.baseconverter.the_number_you_entered_is_too_big_to_be_abble_to_convert_it': return 'The number you entered is too big to be able to convert it';
			case 'tools.clock.title': return 'Clock';
			case 'tools.clock.change_timezone': return 'Change timezone';
			case 'tools.clock.timezone': return 'Timezone';
			case 'tools.clock.choose_a_timezone': return 'Choose a timezone';
			case 'tools.clock.select_local': return 'Local time';
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
			case 'tools.nslookup.not_supported_by_system_dns': return 'Not supported by system DNS';
			case 'tools.nslookup.no_records_found': return 'No records found';
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
			case 'tools.qrreader.copy_password': return 'Copy password';
			case 'tools.qrreader.copy': return 'Copy';
			case 'tools.qrreader.copied_to_clipboard': return 'Copied to clipboard';
			case 'tools.qrreader.wifi': return 'WiFi';
			case 'tools.qrreader.wifi_ssid': return 'SSID';
			case 'tools.qrreader.wifi_password': return 'Password';
			case 'tools.qrreader.error.no_qr_code': return 'No QR code';
			case 'tools.qrreader.error.error_no_result': return 'No result found';
			case 'tools.timer.title': return 'Timer';
			case 'tools.timer.start': return 'Start';
			case 'tools.timer.stop': return 'Stop';
			case 'tools.timer.pause': return 'Pause';
			case 'tools.timer.please_stop_the_timer_first': return 'Please stop the timer first';
			case 'tools.timer.ios_warning_message': return 'For the timer to ring on iOS, you must not quit the application or switch off your iPhone screen. Otherwise iOS will prevent the timer from ringing when it reaches zero.';
			case 'tools.timer.adjust_time': return 'Adjust Time';
			case 'tools.stopwatch.title': return 'Stopwatch';
			case 'tools.stopwatch.controls': return 'Controls';
			case 'tools.stopwatch.start': return 'Start';
			case 'tools.stopwatch.stop': return 'Stop';
			case 'tools.stopwatch.reset': return 'Reset';
			case 'tools.stopwatch.laps': return 'Laps';
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
			case 'tools.flipcoins.change_coin_currency': return 'Change coin currency';
			case 'tools.randomnumber.title': return 'Random number';
			case 'tools.randomnumber.settings': return 'Settings';
			case 'tools.randomnumber.min': return 'Min';
			case 'tools.randomnumber.max': return 'Max';
			case 'tools.randomnumber.error.invalid_number': return 'Invalid number, please try again.';
			case 'tools.randomnumber.error.min_must_be_lower_than_max': return 'The minimum number must be lower than the maximum number.';
			case 'tools.randomnumber.error.min_and_max_must_be_between_x_and_y': return ({required Object minNumberLimit, required Object maxNumberLimit}) => 'The minimum and maximum numbers must be between ${minNumberLimit} and ${maxNumberLimit}.';
			case 'tools.randomcolor.title': return 'Random color';
			case 'tools.randomcolor.hint': return 'Tap the color to change it';
			case 'tools.randomcolor.tap_to_copy': return 'Tap to copy';
			case 'tools.randomcolor.copied_to_clipboard': return 'Copied to clipboard';
			case 'tools.sshclient.title': return 'SSH client';
			case 'tools.sshclient.backspace': return 'Backspace';
			case 'tools.sshclient.use_password': return 'Use password';
			case 'tools.sshclient.use_ssh_key': return 'Use SSH key';
			case 'tools.sshclient.connection': return 'Connection';
			case 'tools.sshclient.host': return 'Host';
			case 'tools.sshclient.port': return 'Port';
			case 'tools.sshclient.username': return 'Username';
			case 'tools.sshclient.password': return 'Password';
			case 'tools.sshclient.ssh_key': return 'SSH key';
			case 'tools.sshclient.connect': return 'Connect';
			case 'tools.sshclient.authentication': return 'Authentication';
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
			case 'tools.whiteboard.share_success': return 'Your whiteboard has been shared successfully';
			case 'tools.whiteboard.save_success': return 'Your whiteboard has been saved successfully';
			case 'tools.networkinfo.title': return 'Network info';
			case 'tools.networkinfo.loading': return 'Loading...';
			case 'tools.networkinfo.unknown': return 'Unknown';
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
			case 'tools.uuidgenerator.tap_to_copy': return 'Tap to copy';
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
			case 'tools.nearbypublictransportstops.loading': return 'Loading...';
			case 'tools.nearbypublictransportstops.refresh': return 'Refresh';
			case 'tools.nearbypublictransportstops.data_source': return 'Data source';
			case 'tools.nearbypublictransportstops.initial_dialog_title': return 'Information';
			case 'tools.nearbypublictransportstops.initial_dialog_message': return ({required Object source}) => 'This tool is intended to be used in Switzerland. It uses the data from "${source}"';
			case 'tools.nearbypublictransportstops.data_license_dialog_open': return 'Open';
			case 'tools.nearbypublictransportstops.data_license_dialog_title': return 'Data source';
			case 'tools.nearbypublictransportstops.data_license_dialog_message': return ({required Object source, required Object url}) => 'The data used in this tool comes from "${source}".\n${url}';
			case 'tools.nearbypublictransportstops.no_departures': return 'No departures found';
			case 'tools.nearbypublictransportstops.departure': return 'Departure';
			case 'tools.nearbypublictransportstops.arrival': return 'Arrival';
			case 'tools.nearbypublictransportstops.platform': return 'Platform';
			case 'tools.nearbypublictransportstops.show_on_map': return 'Map';
			case 'tools.nearbypublictransportstops.map_marker_title': return 'Stop';
			case 'tools.nearbypublictransportstops.error.location_permission_denied': return 'Location permission denied or disabled, please enable it in settings in order to see nearby stops.';
			case 'tools.nearbypublictransportstops.error.check_internet_connection': return 'Please check your internet connection and try again.';
			case 'tools.nearbypublictransportstops.error.api_empty_response': return 'The API returned an empty response';
			case 'tools.nearbypublictransportstops.error.api_error_xxx': return ({required Object errorCode}) => 'The API returned an error: ${errorCode}';
			case 'tools.nearbypublictransportstops.error.no_stops_found': return 'No stops found for this search';
			case 'tools.nearbypublictransportstops.error.no_maps_app': return 'No maps app found on your device';
			case 'tools.fileencryption.title': return 'File encryption';
			case 'tools.fileencryption.home_hint': return 'Pick a file to encrypt it. If you want to decrypt a file, pick an encrypted file with the .aes extension';
			case 'tools.fileencryption.no_file_selected': return 'No file selected';
			case 'tools.fileencryption.enter_password': return 'Please enter a password';
			case 'tools.fileencryption.file_saved_successfully': return 'File saved successfully';
			case 'tools.fileencryption.pick_a_file': return 'Pick a file';
			case 'tools.fileencryption.encryption_password': return 'Encryption password';
			case 'tools.fileencryption.encrypt': return 'Encrypt';
			case 'tools.fileencryption.decrypt': return 'Decrypt';
			case 'tools.fileencryption.error.failed_to_read_file': return 'Failed to read the file';
			case 'tools.fileencryption.error.failed_to_decrypt_file': return 'Failed to decrypt the file, please check the password';
			case 'tools.fileencryption.error.please_enter_a_password': return 'Please enter a password';
			case 'tools.fileencryption.enter_password_hint': return 'Enter password...';
			case 'tools.fileencryption.file_selection': return 'File selection';
			case 'tools.youtubethumbnail.title': return 'YouTube thumbnail';
			case 'tools.youtubethumbnail.saved': return 'Thumbnail saved to device';
			case 'tools.youtubethumbnail.youtube_video_id': return 'YouTube video URL';
			case 'tools.youtubethumbnail.save_thumbnail': return 'Save thumbnail';
			case 'tools.youtubethumbnail.please_enter_a_video_url': return 'Please enter the URL (or ID) of a YouTube video to download its thumbnail';
			case 'tools.youtubethumbnail.error.failed_to_download': return 'Failed to download thumbnail from YouTube';
			case 'tools.youtubethumbnail.error.please_enter_a_valid_video_id': return 'Please enter a valid YouTube video URL\nYou also need an internet connection to download the thumbnail from YouTube';
			case 'tools.youtubethumbnail.thumbnail_preview': return 'Thumbnail preview';
			case 'tools.nationalanthems.title': return 'National anthems';
			case 'tools.nationalanthems.stop': return 'Stop the anthem';
			case 'tools.nationalanthems.search': return 'Search (English name)';
			case 'tools.nationalanthems.license': return 'License';
			case 'tools.nationalanthems.license_text': return ({required Object source, required Object license}) => 'The audio files are provided by "${source}" under the ${license} license';
			case 'tools.nationalanthems.open': return 'Open';
			case 'tools.nationalanthems.view_license': return 'View license';
			case 'tools.nationalanthems.loading_audio_title': return 'Loading';
			case 'tools.nationalanthems.loading_audio_text': return 'Loading the anthem, please wait...';
			case 'tools.nationalanthems.error.failed_to_load_list': return 'Impossible to load the list of anthems. Please check your internet connection and try again.';
			case 'tools.nationalanthems.error.failed_to_play_anthem': return 'Impossible to play the anthem. Please check your internet connection and try again.';
			case 'tools.nationalanthems.no_anthems_found': return 'No anthems found';
			case 'tools.httprequest.title': return 'HTTP request';
			case 'tools.httprequest.method': return 'Method';
			case 'tools.httprequest.custom_method': return 'Custom method';
			case 'tools.httprequest.url': return 'URL';
			case 'tools.httprequest.headers': return 'Headers';
			case 'tools.httprequest.body': return 'Body';
			case 'tools.httprequest.allow_bad_certificates': return 'Allow bad certificates';
			case 'tools.httprequest.allow_bad_certificates_description': return 'Enabling this option allows the "HTTP request" tool to send HTTPS requests to servers with invalid, expired or self-signed SSL/TLS certificates. This disables important security controls and may expose your data to interception or tampering by third parties. Only use this function if you fully understand the risks involved, and only when sending requests to servers you trust and control. It is not recommended for general use. Please consider requests made with this option enabled as unencrypted requests (such as HTTP) that can be manipulated and viewed by third parties.';
			case 'tools.httprequest.i_know_what_i_am_doing': return 'I know what I\'m doing';
			case 'tools.httprequest.render_html': return 'Render HTML';
			case 'tools.httprequest.back_to_details': return 'Back to details';
			case 'tools.httprequest.send_request': return 'Send request';
			case 'tools.httprequest.response': return 'Response';
			case 'tools.httprequest.status_code': return 'Status code';
			case 'tools.httprequest.error.url_cannot_be_empty': return 'The URL cannot be empty';
			case 'tools.httprequest.error.invalid_url': return 'Invalid URL';
			case 'tools.httprequest.error.invalid_headers': return 'Invalid headers';
			case 'tools.httprequest.error.timeout': return 'The request timed out.\nPlease check your input and your internet connection then try again.';
			case 'tools.httprequest.error.other_error': return 'An error occurred while sending the request.\nPlease check your input and your internet connection then try again.';
			case 'tools.httprequest.example_headers': return 'key1: value1\nkey2: value2';
			case 'tools.httprequest.request_body_hint': return 'Request body (JSON, XML, etc.)';
			case 'tools.morsecode.title': return 'Morse code';
			case 'tools.morsecode.alphabet_field': return 'Alphabet (A-Z, 0-9)';
			case 'tools.morsecode.morse_field': return 'Morse code (. and -)';
			case 'tools.morsecode.note_spaces': return 'Note: Use 1 space between letters, 3 spaces between words.';
			case 'tools.morsecode.alphabet_to_morse': return 'Alphabet to morse';
			case 'tools.morsecode.morse_to_alphabet': return 'Morse to alphabet';
			case 'tools.morsecode.play_audio': return 'Play audio';
			case 'tools.morsecode.playing': return 'Playing...';
			case 'tools.morsecode.enter_text': return 'Enter text here...';
			case 'tools.osm.title': return 'Map (OSM)';
			case 'tools.osm.go_to_my_location': return 'Go to my location';
			case 'tools.osm.loading_map': return 'Loading map...';
			case 'tools.osm.error.location_permission_denied': return 'You need to grant location permissions to use this feature';
			case 'tools.osm.error.location_services_disabled': return 'Location services are disabled';
			case 'tools.gameoflife.title': return 'Game of life';
			case 'tools.gameoflife.grid_size': return 'Grid size';
			case 'tools.gameoflife.current_size_is_x': return ({required Object size}) => 'Current size is ${size}';
			case 'tools.gameoflife.waiting': return 'Waiting';
			case 'tools.gameoflife.stop_simulation': return 'Stop simulation';
			case 'tools.gameoflife.start_simulation': return 'Start simulation';
			case 'tools.gameoflife.randomize_grid': return 'Randomize grid';
			case 'tools.gameoflife.clear_grid': return 'Clear grid';
			case 'tools.gameoflife.error.no_alive_cells': return 'No alive cells';
			case 'tools.gameoflife.error.no_alive_cells_description': return 'There are no alive cells.\nPlease tap on the grid to add some.';
			case 'tools.gameoflife.error.please_stop_simulation': return 'Please stop the simulation first';
			case 'tools.speedometer.title': return 'Speedometer';
			case 'tools.speedometer.reset': return 'Reset';
			case 'tools.speedometer.about_traveled_distance_title': return 'About traveled distance';
			case 'tools.speedometer.about_traveled_distance_description': return 'Traveled distance is calculated using the speed detected by the GPS.\nThis means that the distance is not 100% accurate.';
			case 'tools.speedometer.kmh': return 'km/h';
			case 'tools.speedometer.km': return 'km';
			case 'tools.speedometer.mph': return 'mph';
			case 'tools.speedometer.mi': return 'mi';
			case 'tools.speedometer.change_speed_unit': return 'Change speed unit';
			case 'tools.speedometer.change_speed_unit_description': return 'Choose the speed unit you want to use with the speedometer';
			case 'tools.speedometer.traveled_distance': return 'Traveled distance';
			case 'tools.speedometer.error.location_permission_denied_title': return 'Location required';
			case 'tools.speedometer.error.location_permission_denied_description': return 'This tool requires location permission to determine your speed.';
			case 'tools.speedometer.error.location_services_disabled_title': return 'Location services disabled';
			case 'tools.speedometer.error.location_services_disabled_description': return 'This tool requires location services to be enabled to determine your speed.';
			case 'tools.mc_server_ping.title': return 'MC server ping';
			case 'tools.mc_server_ping.java_edition': return 'Java Edition';
			case 'tools.mc_server_ping.information_java': return 'Information';
			case 'tools.mc_server_ping.information_java_description': return 'Check this box if the server is available for the Java Edition of Minecraft. If not, unchecked it and the tool will use the Bedrock Edition API.';
			case 'tools.mc_server_ping.server_ip': return 'Minecraft server IP (or domain)';
			case 'tools.mc_server_ping.ping': return 'Ping server';
			case 'tools.mc_server_ping.ping_another_server': return 'Ping another server';
			case 'tools.mc_server_ping.api_used': return 'API used';
			case 'tools.mc_server_ping.about_the_api': return 'About the API';
			case 'tools.mc_server_ping.about_the_api_description': return ({required Object source, required Object website}) => 'This tool uses the "${source}" from "${website}" to ping Minecraft servers';
			case 'tools.mc_server_ping.about_open': return 'Open';
			case 'tools.mc_server_ping.the_server_id_is': return ({required Object id}) => 'The server ID is "${id}"';
			case 'tools.mc_server_ping.x_y_players_online': return ({required Object playersOnline, required Object playersMax}) => '${playersOnline}/${playersMax} player(s) online';
			case 'tools.mc_server_ping.added_to_favorites': return 'Added to favorites';
			case 'tools.mc_server_ping.added_to_favorites_description': return 'The server has been added to your favorites';
			case 'tools.mc_server_ping.removed_from_favorites': return 'Removed from favorites';
			case 'tools.mc_server_ping.removed_from_favorites_description': return 'The server has been removed from your favorites';
			case 'tools.mc_server_ping.add_to_favorites': return 'Add to favorite';
			case 'tools.mc_server_ping.remove_from_favorites': return 'Remove from favorite';
			case 'tools.mc_server_ping.remove_from_favorites_description': return 'Are you sure you want to remove this server from your favorites?';
			case 'tools.mc_server_ping.from_favorites': return 'From favorites';
			case 'tools.mc_server_ping.pick_from_favorites': return 'Pick from favorites';
			case 'tools.mc_server_ping.no_favorites': return 'No favorites';
			case 'tools.mc_server_ping.no_favorites_description': return 'You don\'t have any favorite servers yet.';
			case 'tools.mc_server_ping.online_players': return 'Online players';
			case 'tools.mc_server_ping.online_players_description_no_players_to_show': return 'The server has online players, but no player names are available to show';
			case 'tools.mc_server_ping.error.please_enter_a_server_ip': return 'Please enter a server IP or domain';
			case 'tools.mc_server_ping.error.server_offline_or_does_not_exist': return 'The server is offline or does not exist';
			case 'tools.mc_server_ping.error.please_check_your_internet_connection': return 'Please check your internet connection and try again';
			case 'tools.mc_server_ping.server_id': return 'Server ID';
			case 'tools.mc_server_ping.server_info': return 'Server info';
			case 'tools.timestampconverter.title': return 'Timestamp converter';
			case 'tools.timestampconverter.now_tooltip': return 'Now';
			case 'tools.timestampconverter.utc': return 'UTC';
			case 'tools.timestampconverter.local': return 'Local';
			case 'tools.timestampconverter.local_or_utc_dialog_title': return 'Local or UTC';
			case 'tools.timestampconverter.local_or_utc_dialog_message': return 'Do you want to pick a local or UTC date?';
			case 'tools.timestampconverter.unix_timestamp': return 'Unix timestamp';
			case 'tools.timestampconverter.convert_timestamp_to_date': return 'Convert timestamp to date';
			case 'tools.timestampconverter.tap_the_date_to_change_it': return 'Tap the date to change it';
			case 'tools.timestampconverter.select_seconds': return 'Select seconds';
			case 'tools.timestampconverter.error.invalid_timestamp': return 'Invalid timestamp';
			case 'tools.timestampconverter.convert': return 'Convert';
			case 'tools.urlshortener.title': return 'URL shortener';
			case 'tools.urlshortener.url': return 'URL';
			case 'tools.urlshortener.qr_code': return 'QR code';
			case 'tools.urlshortener.share': return 'Share';
			case 'tools.urlshortener.share_dialog_message': return 'What do you want to share?';
			case 'tools.urlshortener.your_shortened_url_is': return 'Your shortened URL is';
			case 'tools.urlshortener.copy_to_clipboard': return 'Copy to clipboard';
			case 'tools.urlshortener.the_link_id_is': return 'The link ID is';
			case 'tools.urlshortener.link_id_copied_to_clipboard': return 'Link ID copied to clipboard';
			case 'tools.urlshortener.the_link_password_is': return 'The link password is';
			case 'tools.urlshortener.link_password_copied_to_clipboard': return 'Link password copied to clipboard';
			case 'tools.urlshortener.link_password_hint_text': return 'Tap the password to copy it\nYou will need it to view statistics about this link';
			case 'tools.urlshortener.shorten_another_url': return 'Shorten another URL';
			case 'tools.urlshortener.url_to_shorten': return 'URL to shorten';
			case 'tools.urlshortener.by_clicking_you_accept': return ({required Object url}) => 'By clicking the shorten button, you agree to the terms of service of "${url}" available via the link below.';
			case 'tools.urlshortener.terms_of_service': return 'Terms of service';
			case 'tools.urlshortener.shorten': return 'Shorten';
			case 'tools.urlshortener.more_features': return 'More features';
			case 'tools.urlshortener.more_features_message': return 'Use additional features such as text sharing, link-in-bio profile, and more via the official JTU.ME website';
			case 'tools.urlshortener.open': return 'Open';
			case 'tools.urlshortener.options': return 'Options (optional)';
			case 'tools.urlshortener.access_password': return 'Access password';
			case 'tools.urlshortener.expiration_date': return 'Expiration date (UTC)';
			case 'tools.urlshortener.use_my_account': return 'Use my account';
			case 'tools.urlshortener.email': return 'Email';
			case 'tools.urlshortener.password': return 'Password';
			case 'tools.urlshortener.no_account': return 'No account?';
			case 'tools.urlshortener.no_account_message': return 'You can create a free account on the official JTU.ME website';
			case 'tools.urlshortener.error.failed_to_shorten_url': return 'Failed to shorten the URL, please check your input and your internet connection.';
			case 'tools.urlshortener.error.impossible_to_connect_to_the_server': return 'Impossible to connect to the server';
			case 'tools.urlshortener.error.impossible_to_connect_to_the_server_message': return 'Failed to connect to the server, please check your internet connection and try again.';
			case 'tools.urlshortener.error.unauthorized': return 'Unauthorized. Please check your credentials.';
			case 'tools.urlshortener.error.invalid_expiration_date': return 'The expiration date must be in the future.';
			case 'tools.urlshortener.management_info': return 'Management info';
			case 'tools.urlshortener.manage_with_account': return 'To view statistics and manage this link, use your JTU.ME account on the official website';
			case 'tools.counter.title': return 'Counter';
			case 'tools.counter.add_button': return 'Add button';
			case 'tools.counter.remove_button': return 'Remove button';
			case 'tools.counter.enter_number': return 'Enter a number';
			case 'tools.counter.error.invalid_number': return 'The number you entered is invalid';
			case 'tools.counter.error.the_number_must_be_between_x_and_y': return ({required Object minNumberLimit, required Object maxNumberLimit}) => 'The number must be between ${minNumberLimit} and ${maxNumberLimit}';
			case 'tools.counter.error.you_must_have_at_least_one_button': return 'You must have at least one button';
			case 'tools.counter.error.this_button_already_exists': return 'This button already exists';
			case 'tools.bitwisecalculator.title': return 'Bitwise calculator';
			case 'tools.bitwisecalculator.binary_values': return 'Binary values';
			case 'tools.bitwisecalculator.first_number': return 'First number';
			case 'tools.bitwisecalculator.second_number': return 'Second number';
			case 'tools.bitwisecalculator.enter_a_binary_number': return 'Enter a binary number';
			case 'tools.bitwisecalculator.operations': return 'Operations';
			case 'tools.bitwisecalculator.and': return 'AND';
			case 'tools.bitwisecalculator.or': return 'OR';
			case 'tools.bitwisecalculator.xor': return 'XOR';
			case 'tools.bitwisecalculator.result': return 'Result';
			case 'tools.bitwisecalculator.error.invalid_input': return 'Invalid input';
			case 'tools.musicsearch.title': return 'Music search';
			case 'tools.musicsearch.unknown_title': return 'Unknown title';
			case 'tools.musicsearch.unknown_artist': return 'Unknown artist';
			case 'tools.musicsearch.unknown_album': return 'Unknown album';
			case 'tools.musicsearch.loading': return 'Loading';
			case 'tools.musicsearch.loading_audio_preview': return 'Loading audio preview...';
			case 'tools.musicsearch.stop_audio_preview': return 'Stop audio preview';
			case 'tools.musicsearch.data_source': return 'Data source';
			case 'tools.musicsearch.this_tool_uses_the_x_api': return ({required Object service}) => 'This tool uses the "${service}" API to search for music.\nThe audio previews are provided by "${service}".';
			case 'tools.musicsearch.go_to_x': return ({required Object service}) => 'Go to ${service}';
			case 'tools.musicsearch.search_for_music': return 'Search for music';
			case 'tools.musicsearch.use_the_searchbar_to_search_music': return ({required Object service}) => 'Use the search bar to find music.\nIf your search returns no results, try a different search term.\nIf you still have no results, make sure your internet connection is working properly and that ${service} is available in your country or region.';
			case 'tools.musicsearch.open_in_x': return ({required Object service}) => 'Open in ${service}';
			case 'tools.musicsearch.play_preview': return 'Play preview';
			case 'tools.musicsearch.error.error_playing_audio_preview': return 'Error playing audio preview. Please try again later.';
			case 'tools.musicsearch.error.unable_to_connect_to_the_api': return 'Unable to connect to the API, please check your internet connection and try again.';
			case 'tools.musicanalyser.title': return 'Music analyser';
			case 'tools.musicanalyser.press_the_button_to_start_music_analysis': return 'Press the button to start music analysis';
			case 'tools.musicanalyser.loading': return 'Loading...';
			case 'tools.musicanalyser.analyzing_music': return ({required Object remainingSeconds}) => 'Analyzing music... (${remainingSeconds}s)';
			case 'tools.musicanalyser.getting_results': return 'Getting results...';
			case 'tools.musicanalyser.unknown': return 'Unknown';
			case 'tools.musicanalyser.api_used': return 'API used';
			case 'tools.musicanalyser.this_tool_uses_the_x_api': return ({required Object service, required Object company}) => 'This tool uses the "${service}" API via a Koizeay backend server. "${service}" is a registered trademark of "${company}" and is not affiliated with this tool.';
			case 'tools.musicanalyser.start_analyzing_music': return 'Start analyzing music';
			case 'tools.musicanalyser.clear': return 'Clear';
			case 'tools.musicanalyser.error.permission_denied': return 'Permission denied';
			case 'tools.musicanalyser.error.permission_denied_description': return 'The microphone permission is required to analyze music. Please grant the permission and try again.';
			case 'tools.musicanalyser.error.no_match_found': return 'No match found';
			case 'tools.musicanalyser.error.no_match_found_description': return 'No music match was found. Please try again.';
			case 'tools.musicanalyser.error.error_occurred': return 'An error occurred while analyzing the music. Please check your internet connection and try again.';
			case 'tools.musicanalyser.error.please_update_the_app_and_try_again': return 'Please update the app and try again. If the problem persists with the latest version, please try again later.';
			case 'tools.textdifferences.title': return 'Text differences';
			case 'tools.textdifferences.old_text': return 'Old text';
			case 'tools.textdifferences.new_text': return 'New text';
			case 'tools.textdifferences.no_text_hint': return 'Enter text in the fields above to see the differences';
			case 'tools.textdifferences.enter_old_text': return 'Enter old text...';
			case 'tools.textdifferences.enter_new_text': return 'Enter new text...';
			case 'tools.characterscopy.title': return 'Characters copy';
			case 'tools.characterscopy.important': return 'Important';
			case 'tools.characterscopy.important_description': return 'Some characters may not be displayed correctly on all devices depending on your operating system. Also, some characters may not be supported by all apps and fonts. Just click on the character you want to copy and it will be copied to your clipboard.';
			case 'tools.characterscopy.copied_to_clipboard': return 'Copied to clipboard';
			case 'tools.whoisdomain.title': return 'Whois domain';
			case 'tools.whoisdomain.domain_name': return 'Domain name';
			case 'tools.whoisdomain.whois_lookup': return 'Whois lookup';
			case 'tools.whoisdomain.disclaimer': return 'Disclaimer';
			case 'tools.whoisdomain.disclaimer_text': return 'Toolbox provides WHOIS query functionality for informational purposes only. The data retrieved may not be accurate, complete, or up-to-date, and is subject to the terms and conditions of the respective domain registries. Users are prohibited from using WHOIS data for spam, unlawful purposes, or automated data collection. By using this tool, you agree to comply with applicable laws and the registry\'s terms of service. Toolbox and/or Koizeay assumes no responsibility for errors, omissions, or misuse of the data. Please note that some TLDs may not be supported by this tool.';
			case 'tools.whoisdomain.loading': return 'Loading...';
			case 'tools.whoisdomain.ip_address_not_supported': return 'IP address not supported';
			case 'tools.whoisdomain.ip_address_not_supported_description': return 'This tool only supports domain names, not IP addresses';
			case 'tools.whoisdomain.no_result': return 'No valid result found';
			case 'tools.whoisdomain.view_pretty': return 'View pretty';
			case 'tools.whoisdomain.view_raw': return 'View raw';
			case 'tools.whoisdomain.raw_whois_data': return 'Raw WHOIS data';
			case 'tools.whoisdomain.domain': return 'Domain';
			case 'tools.whoisdomain.registrar': return 'Registrar';
			case 'tools.whoisdomain.dates': return 'Dates';
			case 'tools.whoisdomain.status': return 'Status';
			case 'tools.whoisdomain.name_servers': return 'Name servers';
			case 'tools.whoisdomain.contact': return 'Contact';
			case 'tools.whoisdomain.other': return 'Other';
			case 'tools.whoisdomain.error.impossible_to_get_whois_information': return 'Impossible to get the whois information, please check your input and your internet connection then try again';
			case 'tools.textcounter.title': return 'Text counter';
			case 'tools.textcounter.clear': return 'Clear';
			case 'tools.textcounter.enter_text_here': return 'Enter text here';
			case 'tools.textcounter.length': return 'Length';
			case 'tools.textcounter.trimmed_length': return 'Trimmed length';
			case 'tools.textcounter.raw_length': return 'Raw length';
			case 'tools.textcounter.letters': return 'Letters';
			case 'tools.textcounter.words': return 'Words';
			case 'tools.textcounter.spaces': return 'Spaces';
			case 'tools.textcounter.digits': return 'Digits';
			case 'tools.textcounter.lines': return 'Lines';
			case 'tools.textcounter.empty_lines': return 'Empty lines';
			case 'tools.textcounter.total_lines': return 'Total lines';
			case 'tools.textcounter.text_input': return 'Text input';
			case 'tools.romannumeral.title': return 'Roman numeral';
			case 'tools.romannumeral.change_to': return 'Change to';
			case 'tools.romannumeral.roman_numeral': return 'roman numeral';
			case 'tools.romannumeral.number': return 'number';
			case 'tools.romannumeral.number_input_hint': return 'Number';
			case 'tools.romannumeral.roman_numeral_input_hint': return 'Roman numeral';
			case 'tools.romannumeral.tap_to_copy': return 'Tap to copy';
			case 'tools.romannumeral.copied_to_clipboard': return 'Copied to clipboard';
			case 'tools.romannumeral.error.invalid_roman_numeral': return 'Invalid or unsupported roman numeral';
			case 'tools.areacalculator.title': return 'Area calculator';
			case 'tools.areacalculator.select_a_shape': return 'Select a shape';
			case 'tools.areacalculator.values': return 'Values';
			case 'tools.areacalculator.area': return 'Area';
			case 'tools.areacalculator.calculate': return 'Calculate';
			case 'tools.areacalculator.shapes.circle': return 'Circle';
			case 'tools.areacalculator.shapes.ellipse': return 'Ellipse';
			case 'tools.areacalculator.shapes.equilateral_triangle': return 'Equilateral triangle';
			case 'tools.areacalculator.shapes.kite': return 'Kite';
			case 'tools.areacalculator.shapes.parallelogram': return 'Parallelogram';
			case 'tools.areacalculator.shapes.rectangle': return 'Rectangle';
			case 'tools.areacalculator.shapes.rhombus': return 'Rhombus';
			case 'tools.areacalculator.shapes.regular_hexagon': return 'Regular hexagon';
			case 'tools.areacalculator.shapes.regular_octagon': return 'Regular octagon';
			case 'tools.areacalculator.shapes.regular_pentagon': return 'Regular pentagon';
			case 'tools.areacalculator.shapes.regular_polygon': return 'Regular polygon';
			case 'tools.areacalculator.shapes.square': return 'Square';
			case 'tools.areacalculator.shapes.trapezoid': return 'Trapezoid';
			case 'tools.areacalculator.shapes.triangle': return 'Triangle';
			case 'tools.areacalculator.inputs.radius': return 'Radius';
			case 'tools.areacalculator.inputs.major_axis': return 'Major axis';
			case 'tools.areacalculator.inputs.minor_axis': return 'Minor axis';
			case 'tools.areacalculator.inputs.side': return 'Side';
			default: return null;
		}
	}

	dynamic _flatMapFunction$1(String path) {
		switch (path) {
			case 'tools.areacalculator.inputs.base': return 'Base';
			case 'tools.areacalculator.inputs.height': return 'Height';
			case 'tools.areacalculator.inputs.diagonal_1': return 'Diagonal 1';
			case 'tools.areacalculator.inputs.diagonal_2': return 'Diagonal 2';
			case 'tools.areacalculator.inputs.length': return 'Length';
			case 'tools.areacalculator.inputs.width': return 'Width';
			case 'tools.areacalculator.inputs.number_of_sides': return 'Number of sides';
			case 'tools.areacalculator.inputs.side_length': return 'Side length';
			case 'tools.areacalculator.inputs.apothem': return 'Apothem';
			case 'tools.areacalculator.inputs.base_1': return 'Base 1';
			case 'tools.areacalculator.inputs.base_2': return 'Base 2';
			case 'tools.areacalculator.error.invalid_input': return 'Invalid input';
			case 'tools.areacalculator.error.please_enter_a_value_for': return 'Please enter a value for';
			case 'tools.areacalculator.error.please_enter_a_valid_number_for': return 'Please enter a valid number for';
			case 'tools.areacalculator.error.please_enter_a_positive_number_for': return 'Please enter a positive number for';
			case 'tools.areacalculator.error.please_try_again_with_different_values': return 'Please try again with different values';
			case 'tools.areacalculator.error.the_area_of_the_shape_is_zero': return 'The area of the shape is zero';
			case 'tools.mathtex.title': return 'MathTeX';
			case 'tools.mathtex.enter_a_mathematical_expression_in_tex_format': return 'Enter a mathematical expression in TeX format';
			case 'tools.mathtex.texExpression': return 'TeX expression';
			case 'tools.mathtex.export_to_image': return 'Export to image';
			case 'tools.mathtex.preview': return 'Preview';
			case 'tools.mathtex.color': return 'Color';
			case 'tools.mathtex.get_help': return 'Get help';
			case 'tools.mathtex.open_help_website': return 'Open help website';
			case 'tools.mathtex.help_content': return 'Enter a mathematical expression in TeX format to render it as a mathematical formula. For example, the TeX expression \'\\frac{a}{b}\' will be rendered as a fraction with \'a\' above \'b\'. You can use any supported TeX syntax to create complex mathematical expressions. Once you have entered your expression, you can preview it and export it as an SVG file.\nCompatible with MathJax\'s TeX format.';
			case 'tools.mathtex.copied_to_clipboard': return 'Copied to clipboard';
			case 'tools.mathtex.error.an_error_occurred_while_rendering_the_mathtex': return 'An error occurred while rendering the MathTeX';
			case 'tools.mathtex.error.please_wait_until_the_preview_is_loaded': return 'Please wait until the preview is loaded';
			case 'tools.mathtex.error.an_error_occurred_while_exporting_the_image': return 'An error occurred while exporting the image';
			case 'tools.mathtex.error.could_not_open_help_website': return 'Could not open help website, please check your configuration and try again';
			case 'tools.compass.title': return 'Compass';
			case 'tools.compass.error.please_grant_location_permission': return 'Please grant location permission to use the compass. It is mandatory to access the device\'s sensors.';
			case 'tools.qrcreator.title': return 'QR creator';
			case 'tools.qrcreator.qr_code_settings': return 'QR Code settings';
			case 'tools.qrcreator.ecc_low': return 'Low';
			case 'tools.qrcreator.ecc_medium': return 'Medium';
			case 'tools.qrcreator.ecc_quartile': return 'Quartile';
			case 'tools.qrcreator.ecc_high': return 'High';
			case 'tools.qrcreator.saved_successfully': return 'QR code saved successfully';
			case 'tools.qrcreator.shared_successfully': return 'QR code shared successfully';
			case 'tools.qrcreator.enter_text_or_url': return 'Enter text or URL';
			case 'tools.qrcreator.error_correction_level': return 'Error correction level';
			case 'tools.qrcreator.create': return 'Create';
			case 'tools.qrcreator.generated_qr_code': return 'Generated QR code';
			case 'tools.qrcreator.save': return 'Save';
			case 'tools.qrcreator.share': return 'Share';
			case 'tools.qrcreator.error.failed_to_create_qr_code': return 'Failed to create QR code, please check your input and try again';
			case 'tools.pastebin.title': return 'Pastebin';
			case 'tools.pastebin.url': return 'URL';
			case 'tools.pastebin.qr_code': return 'QR code';
			case 'tools.pastebin.share': return 'Share';
			case 'tools.pastebin.share_dialog_message': return 'What do you want to share?';
			case 'tools.pastebin.your_short_link_is': return 'Your short link is';
			case 'tools.pastebin.copy_to_clipboard': return 'Copy to clipboard';
			case 'tools.pastebin.copied_to_clipboard': return 'Short link copied to clipboard';
			case 'tools.pastebin.the_link_id_is': return 'The link ID is';
			case 'tools.pastebin.link_id_copied_to_clipboard': return 'Link ID copied to clipboard';
			case 'tools.pastebin.the_link_password_is': return 'The link password is';
			case 'tools.pastebin.link_password_copied_to_clipboard': return 'Link password copied to clipboard';
			case 'tools.pastebin.link_password_hint_text': return 'Tap the password to copy it\nYou will need it to view statistics about this link';
			case 'tools.pastebin.paste_another_text': return 'Paste another text';
			case 'tools.pastebin.text_to_paste': return 'Text to paste';
			case 'tools.pastebin.text_paste_field_hint': return 'Paste your text, source code or other content here';
			case 'tools.pastebin.by_clicking_you_accept': return ({required Object url}) => 'By clicking the send button, you agree to the terms of service of "${url}" available via the link below.';
			case 'tools.pastebin.terms_of_service': return 'Terms of service';
			case 'tools.pastebin.send': return 'Send';
			case 'tools.pastebin.more_features': return 'More features';
			case 'tools.pastebin.more_features_message': return 'Use additional features such as URL shortening, link-in-bio profile, and more via the official JTU.ME website';
			case 'tools.pastebin.open': return 'Open';
			case 'tools.pastebin.options': return 'Options (optional)';
			case 'tools.pastebin.access_password': return 'Access password';
			case 'tools.pastebin.expiration_date': return 'Expiration date (UTC)';
			case 'tools.pastebin.use_my_account': return 'Use my account';
			case 'tools.pastebin.email': return 'Email';
			case 'tools.pastebin.password': return 'Password';
			case 'tools.pastebin.no_account': return 'No account?';
			case 'tools.pastebin.no_account_message': return 'You can create a free account on the official JTU.ME website to manage your links and pastes.';
			case 'tools.pastebin.error.failed_to_obtain_short_link': return 'Failed to obtain short link, please check your internet connection and try again';
			case 'tools.pastebin.error.impossible_to_connect_to_the_server': return 'Impossible to connect to the server';
			case 'tools.pastebin.error.impossible_to_connect_to_the_server_message': return 'Failed to connect to the server, please check your internet connection and try again.';
			case 'tools.pastebin.error.unauthorized': return 'Unauthorized. Please check your credentials.';
			case 'tools.pastebin.error.invalid_expiration_date': return 'The expiration date must be in the future.';
			case 'tools.pastebin.management_info': return 'Management info';
			case 'tools.pastebin.manage_with_account': return 'To view statistics and manage this link, use your JTU.ME account on the official website';
			case 'tools.percentagecalculator.title': return 'Percentage calculator';
			case 'tools.percentagecalculator.result': return 'Result';
			case 'tools.percentagecalculator.percentage': return 'Percentage';
			case 'tools.percentagecalculator.eg': return 'e.g.';
			case 'tools.percentagecalculator.total': return 'Total';
			case 'tools.percentagecalculator.first_value': return 'First value';
			case 'tools.percentagecalculator.second_value': return 'Second value';
			case 'tools.percentagecalculator.what_is': return 'What is';
			case 'tools.percentagecalculator.of': return 'of';
			case 'tools.percentagecalculator.is_what_percentage_of': return 'is what percentage of';
			case 'tools.percentagecalculator.what_is_the_percentage_difference': return 'What is the percentage difference';
			case 'tools.percentagecalculator.from': return 'from';
			case 'tools.percentagecalculator.to': return 'to';
			case 'tools.percentagecalculator.calculate': return 'Calculate';
			case 'tools.percentagecalculator.error.please_enter_valid_numbers_for_both_fields': return 'Please enter valid numbers for both fields';
			case 'tools.percentagecalculator.error.total_cannot_be_zero': return 'Total cannot be zero';
			case 'tools.percentagecalculator.error.first_value_cannot_be_zero': return 'First value cannot be zero';
			case 'tools.passwordgenerator.title': return 'Password generator';
			case 'tools.passwordgenerator.password_length': return 'Password length';
			case 'tools.passwordgenerator.number_of_digits': return 'Number of digits';
			case 'tools.passwordgenerator.number_of_special_characters': return 'Number of special characters';
			case 'tools.passwordgenerator.generate_password': return 'Generate password';
			case 'tools.passwordgenerator.password_copied_to_clipboard': return 'Password copied to clipboard';
			case 'tools.passwordgenerator.tap_to_copy': return 'Tap to copy';
			case 'tools.passwordgenerator.error.password_length_must_be_greater_than_0': return 'Password length must be greater than 0';
			case 'tools.passwordgenerator.error.password_length_cannot_exceed_x_characters': return ({required Object maxLength}) => 'Password length cannot exceed ${maxLength} characters';
			case 'tools.passwordgenerator.error.password_length_cannot_be_less_than_the_sum_of_digits_and_special_characters': return 'Password length cannot be less than the sum of digits and special characters';
			case 'tools.passwordgenerator.generated_password': return 'Generated password';
			case 'tools.portscanner.title': return 'Port scanner';
			case 'tools.portscanner.host_to_scan': return 'Host to scan';
			case 'tools.portscanner.start_port': return 'Start port';
			case 'tools.portscanner.end_port': return 'End port';
			case 'tools.portscanner.start_scan': return 'Start scan';
			case 'tools.portscanner.stop_scan': return 'Stop scan';
			case 'tools.portscanner.port': return 'Port';
			case 'tools.portscanner.error.please_enter_a_valid_host': return 'Please enter a valid host';
			case 'tools.portscanner.error.please_enter_a_valid_port_number': return 'Please enter a valid port number (1-65535) for both fields';
			case 'tools.portscanner.example_domain_or_ip': return 'example.com or 192.168.1.1';
			case 'tools.portscanner.port_range': return 'Port Range';
			case 'tools.portscanner.scan_progress': return 'Scan progress';
			case 'tools.commons.title': return 'Commons';
			case 'tools.commons.data_source_and_licensing': return 'Data source and licensing';
			case 'tools.commons.data_source_and_licensing_description': return 'All media files are sourced from Wikimedia Commons and are subject to their respective licenses. Please ensure compliance with the terms of each license when using and downloading the media files.';
			case 'tools.commons.open_wikimedia_commons': return 'Open Wikimedia Commons';
			case 'tools.commons.search_files': return 'Search files';
			case 'tools.commons.enter_search_query_to_find_files': return 'Enter a search query to find media files on Wikimedia Commons';
			case 'tools.commons.view_on_wikimedia': return 'View on Wikimedia Commons';
			case 'tools.commons.previous': return 'Previous';
			case 'tools.commons.next': return 'Next';
			case 'tools.commons.bytes': return 'B';
			case 'tools.commons.kilobytes': return 'KB';
			case 'tools.commons.megabytes': return 'MB';
			case 'tools.commons.gigabytes': return 'GB';
			case 'tools.commons.no_files_found': return 'No files found';
			case 'tools.commons.close_preview': return 'Close preview';
			case 'tools.commons.view_license_details': return 'View license details';
			case 'tools.commons.download_media': return 'Download media';
			case 'tools.commons.close': return 'Close';
			case 'tools.commons.file_information': return 'File information';
			case 'tools.commons.unknown_license': return 'Unknown license';
			case 'tools.commons.mime_type': return 'MIME type';
			case 'tools.commons.file_size': return 'File size';
			case 'tools.commons.dimensions': return 'Dimensions';
			case 'tools.commons.duration': return 'Duration';
			case 'tools.commons.file_license': return 'File license';
			case 'tools.commons.file_by': return 'File by';
			case 'tools.commons.file_downloaded_successfully': return 'File downloaded successfully';
			case 'tools.commons.downloading': return 'Downloading...';
			case 'tools.commons.error.error_downloading_file': return ({required Object errorCode}) => 'Error downloading file (${errorCode})';
			case 'tools.commons.error.error_download_file_check_internet': return 'Error downloading file. Please check your internet connection and try again.';
			case 'tools.commons.load_preview': return 'Load preview';
			case 'tools.commons.page': return ({required Object number}) => 'Page ${number}';
			case 'tools.crdeck.title': return 'Clash Royale deck';
			case 'tools.crdeck.clear_unlocked_deck_cards': return 'Clear unlocked deck cards';
			case 'tools.crdeck.about_and_credits': return 'About and credits';
			case 'tools.crdeck.about_and_credits_description': return 'This tool uses the official Clash Royale API provided by Supercell (via a Koizeay backend server). This tool is not affiliated with or endorsed by Supercell in any way. All Clash Royale content, including but not limited to images, names, and trademarks, are the property of Supercell.';
			case 'tools.crdeck.supercell_website': return 'Supercell website';
			case 'tools.crdeck.no_deck': return 'No deck';
			case 'tools.crdeck.generate_new_deck': return 'Generate new deck';
			case 'tools.crdeck.open_deck_in_clash_royale': return 'Open deck in Clash Royale';
			case 'tools.crdeck.share_deck': return 'Share deck';
			case 'tools.crdeck.search_cards': return 'Search cards';
			case 'tools.crdeck.import_cards_from_player_profile': return 'Import cards from player profile';
			case 'tools.crdeck.deselect_all_cards': return 'Deselect all cards';
			case 'tools.crdeck.select_all_cards': return 'Select all cards';
			case 'tools.crdeck.x_elixirs': return ({required Object elixirs}) => '${elixirs} elixirs';
			case 'tools.crdeck.player_tag': return 'Player tag';
			case 'tools.crdeck.import': return 'Import';
			case 'tools.crdeck.importing_cards': return 'Importing cards...';
			case 'tools.crdeck.share_deck_text_message': return ({required Object url}) => 'Check out my Clash Royale deck created with Toolbox!\nOpen it in Clash Royale using this link: ${url}';
			case 'tools.crdeck.error.please_check_your_internet_connection': return 'Please check your internet connection and try again.';
			case 'tools.crdeck.error.error_while_loading_cards_from_server': return 'An error occurred while loading the Clash Royale cards from the server.\nPlease check your network connection and try again.';
			case 'tools.crdeck.error.failed_to_load_cards_from_server': return ({required Object errorCode}) => 'Failed to load Clash Royale cards from the server (${errorCode})';
			case 'tools.crdeck.error.invalid_tag': return 'Invalid tag';
			case 'tools.crdeck.error.please_enter_a_valid_player_tag': return 'Please enter a valid player tag';
			case 'tools.crdeck.error.failed_to_import_cards_from_player_profile': return ({required Object errorCode}) => 'Failed to import cards from player profile (${errorCode}), you can still import cards manually';
			case 'tools.crdeck.error.an_error_occurred_while_importing_cards': return 'An error occurred while importing cards, you can still import cards manually';
			case 'tools.crdeck.error.not_enough_cards_selected': return 'Not enough cards selected';
			case 'tools.crdeck.error.please_select_at_least_x_more_cards': return ({required Object numberOfCards}) => 'Please select at least ${numberOfCards} more cards to create a valid deck';
			case 'tools.crdeck.error.deck_is_full': return 'Deck is full';
			case 'tools.crdeck.error.you_can_only_add_up_to_x_cards_to_the_deck': return ({required Object numberOfCards}) => 'You can only add up to ${numberOfCards} cards to the deck';
			case 'tools.crdeck.error.card_already_in_deck': return 'Card already in deck';
			case 'tools.crdeck.error.this_card_is_already_in_the_deck': return 'This card is already in the deck';
			case 'tools.crdeck.error.incomplete_deck': return 'Incomplete deck';
			case 'tools.crdeck.error.please_add_x_more_cards_to_the_deck_before_opening_it_in_clash_royale': return ({required Object numberOfCards}) => 'Please add ${numberOfCards} more cards to the deck before opening it in Clash Royale';
			case 'tools.crdeck.error.please_add_x_more_cards_to_the_deck_before_sharing_it': return ({required Object numberOfCards}) => 'Please add ${numberOfCards} more cards to the deck before sharing it';
			case 'tools.iplocation.title': return 'IP location';
			case 'tools.iplocation.api_used': return 'API used';
			case 'tools.iplocation.about_the_api': return 'About the API';
			case 'tools.iplocation.about_the_api_description': return ({required Object source}) => 'This tool uses the API provided by "${source}" to fetch the location information of the given IP address';
			case 'tools.iplocation.visit_website': return 'Visit website';
			case 'tools.iplocation.ip_address': return 'IP address';
			case 'tools.iplocation.get_ip_location': return 'Get IP location';
			case 'tools.iplocation.location_information': return 'Location information';
			case 'tools.iplocation.n_a': return 'N/A';
			case 'tools.iplocation.country': return 'Country';
			case 'tools.iplocation.provider': return 'Provider';
			case 'tools.iplocation.error.ip_required': return 'IP required';
			case 'tools.iplocation.error.please_enter_an_ip_address': return 'Please enter an IP address to fetch its location';
			case 'tools.iplocation.error.error_fetching_location': return 'Error fetching location';
			case 'tools.iplocation.error.error_fetching_location_description': return 'It seems there was an error fetching the location. Please check your input and your internet connection then try again';
			case 'credits.title': return 'Credits';
			case 'credits.app_icon': return ({required Object author}) => 'App icon by ${author}';
			case 'credits.app_license': return ({required Object license}) => 'The app is licensed under the ${license} license';
			case 'credits.tools_icons': return ({required Object author}) => 'Tools icons by ${author}';
			case 'credits.ads_disclaimer': return 'Ads are there to help me pay server costs and support the development of this app.\nOnly a small banner is displayed at the bottom of the screen, nothing to block your Toolbox experience.';
			case 'credits.more_apps_and_services': return 'More apps and services';
			case 'credits.view_licenses': return 'View licenses';
			case 'credits.special_thanks': return 'Special thanks';
			case 'credits.contribute_on_github': return 'Contribute on GitHub';
			case 'credits.email_copied_to_clipboard': return 'Email copied to clipboard';
			case 'credits.made_with_love_in_switzerland': return 'Made with love in Switzerland';
			case 'credits.made_with_love_in_switzerland_description': return 'Made in Switzerland, used worldwide.\nThank you for using Toolbox.\nIf you like it, please consider leaving a review on the Play Store or App Store.\nIt helps me a lot and motivates me to keep improving the app.';
			case 'credits.translations.title': return 'Translations';
			case 'credits.translations.english': return ({required Object author}) => 'English by ${author}';
			case 'credits.translations.french': return ({required Object author}) => 'French by ${author}';
			case 'credits.translations.japanese': return ({required Object author}) => 'Japanese by ${author}';
			default: return null;
		}
	}
}

