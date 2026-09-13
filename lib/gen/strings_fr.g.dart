///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsFr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsFr _root = this; // ignore: unused_field

	@override 
	TranslationsFr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsGenericFr generic = _TranslationsGenericFr._(_root);
	@override late final _TranslationsHomepageFr homepage = _TranslationsHomepageFr._(_root);
	@override late final _TranslationsCategoriesFr categories = _TranslationsCategoriesFr._(_root);
	@override late final _TranslationsToolsFr tools = _TranslationsToolsFr._(_root);
	@override late final _TranslationsCreditsFr credits = _TranslationsCreditsFr._(_root);
}

// Path: generic
class _TranslationsGenericFr implements TranslationsGenericEn {
	_TranslationsGenericFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get app_name => 'Toolbox';
	@override String get tools => 'Outils';
	@override String get categories => 'Catégories';
	@override String get error => 'Erreur';
	@override String get warning => 'Attention';
	@override String get ok => 'OK';
	@override String get cancel => 'Annuler';
	@override String get search => 'Rechercher';
	@override String get enable => 'Activer';
	@override String get reset => 'Réinitialiser';
	@override String get yes => 'Oui';
	@override String get no => 'Non';
	@override String get copy => 'Copier';
	@override String get share => 'Partager';
	@override String get generate => 'Générer';
}

// Path: homepage
class _TranslationsHomepageFr implements TranslationsHomepageEn {
	_TranslationsHomepageFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get update_available => 'Mise à jour disponible';
	@override String get update_available_message => 'Une nouvelle version de Toolbox est disponible. Mettez à jour dès maintenant pour bénéficier des dernières fonctionnalités et améliorations.';
	@override String get switch_view => 'Changer de vue';
	@override String get search_all_categories => 'Rechercher dans toutes les catégories';
	@override String get clear_search => 'Effacer la recherche';
	@override String get add => 'Ajouter';
	@override String get remove => 'Supprimer';
	@override String get favorites => 'Favoris';
	@override String get would_you_like_to_add_this_tool_to_favorites => 'Voulez-vous ajouter cet outil aux favoris ?';
	@override String get would_you_like_to_remove_this_tool_from_favorites => 'Voulez-vous retirer cet outils des favoris ?';
}

// Path: categories
class _TranslationsCategoriesFr implements TranslationsCategoriesEn {
	_TranslationsCategoriesFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get audio => 'Audio';
	@override String get calculations => 'Calculs';
	@override String get games => 'Jeux';
	@override String get geography => 'Géographie';
	@override String get miscellaneous => 'Divers';
	@override String get network => 'Réseau';
	@override String get random => 'Aléatoire';
	@override String get time => 'Temps';
	@override String get web => 'Web';
}

// Path: tools
class _TranslationsToolsFr implements TranslationsToolsEn {
	_TranslationsToolsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsToolsBaseconverterFr baseconverter = _TranslationsToolsBaseconverterFr._(_root);
	@override late final _TranslationsToolsClockFr clock = _TranslationsToolsClockFr._(_root);
	@override late final _TranslationsToolsMetronomeFr metronome = _TranslationsToolsMetronomeFr._(_root);
	@override late final _TranslationsToolsMegaphoneFr megaphone = _TranslationsToolsMegaphoneFr._(_root);
	@override late final _TranslationsToolsNslookupFr nslookup = _TranslationsToolsNslookupFr._(_root);
	@override late final _TranslationsToolsPingFr ping = _TranslationsToolsPingFr._(_root);
	@override late final _TranslationsToolsSoundmeterFr soundmeter = _TranslationsToolsSoundmeterFr._(_root);
	@override late final _TranslationsToolsQrreaderFr qrreader = _TranslationsToolsQrreaderFr._(_root);
	@override late final _TranslationsToolsTimerFr timer = _TranslationsToolsTimerFr._(_root);
	@override late final _TranslationsToolsStopwatchFr stopwatch = _TranslationsToolsStopwatchFr._(_root);
	@override late final _TranslationsToolsRouletteFr roulette = _TranslationsToolsRouletteFr._(_root);
	@override late final _TranslationsToolsFlipcoinsFr flipcoins = _TranslationsToolsFlipcoinsFr._(_root);
	@override late final _TranslationsToolsRandomnumberFr randomnumber = _TranslationsToolsRandomnumberFr._(_root);
	@override late final _TranslationsToolsRandomcolorFr randomcolor = _TranslationsToolsRandomcolorFr._(_root);
	@override late final _TranslationsToolsSshclientFr sshclient = _TranslationsToolsSshclientFr._(_root);
	@override late final _TranslationsToolsWhiteboardFr whiteboard = _TranslationsToolsWhiteboardFr._(_root);
	@override late final _TranslationsToolsNetworkinfoFr networkinfo = _TranslationsToolsNetworkinfoFr._(_root);
	@override late final _TranslationsToolsUuidgeneratorFr uuidgenerator = _TranslationsToolsUuidgeneratorFr._(_root);
	@override late final _TranslationsToolsTexttospeechFr texttospeech = _TranslationsToolsTexttospeechFr._(_root);
	@override late final _TranslationsToolsNearbypublictransportstopsFr nearbypublictransportstops = _TranslationsToolsNearbypublictransportstopsFr._(_root);
	@override late final _TranslationsToolsFileencryptionFr fileencryption = _TranslationsToolsFileencryptionFr._(_root);
	@override late final _TranslationsToolsYoutubethumbnailFr youtubethumbnail = _TranslationsToolsYoutubethumbnailFr._(_root);
	@override late final _TranslationsToolsNationalanthemsFr nationalanthems = _TranslationsToolsNationalanthemsFr._(_root);
	@override late final _TranslationsToolsHttprequestFr httprequest = _TranslationsToolsHttprequestFr._(_root);
	@override late final _TranslationsToolsMorsecodeFr morsecode = _TranslationsToolsMorsecodeFr._(_root);
	@override late final _TranslationsToolsOsmFr osm = _TranslationsToolsOsmFr._(_root);
	@override late final _TranslationsToolsGameoflifeFr gameoflife = _TranslationsToolsGameoflifeFr._(_root);
	@override late final _TranslationsToolsSpeedometerFr speedometer = _TranslationsToolsSpeedometerFr._(_root);
	@override late final _TranslationsToolsMcServerPingFr mc_server_ping = _TranslationsToolsMcServerPingFr._(_root);
	@override late final _TranslationsToolsTimestampconverterFr timestampconverter = _TranslationsToolsTimestampconverterFr._(_root);
	@override late final _TranslationsToolsUrlshortenerFr urlshortener = _TranslationsToolsUrlshortenerFr._(_root);
	@override late final _TranslationsToolsCounterFr counter = _TranslationsToolsCounterFr._(_root);
	@override late final _TranslationsToolsBitwisecalculatorFr bitwisecalculator = _TranslationsToolsBitwisecalculatorFr._(_root);
	@override late final _TranslationsToolsMusicsearchFr musicsearch = _TranslationsToolsMusicsearchFr._(_root);
	@override late final _TranslationsToolsMusicanalyserFr musicanalyser = _TranslationsToolsMusicanalyserFr._(_root);
	@override late final _TranslationsToolsTextdifferencesFr textdifferences = _TranslationsToolsTextdifferencesFr._(_root);
	@override late final _TranslationsToolsCharacterscopyFr characterscopy = _TranslationsToolsCharacterscopyFr._(_root);
	@override late final _TranslationsToolsWhoisdomainFr whoisdomain = _TranslationsToolsWhoisdomainFr._(_root);
	@override late final _TranslationsToolsTextcounterFr textcounter = _TranslationsToolsTextcounterFr._(_root);
	@override late final _TranslationsToolsRomannumeralFr romannumeral = _TranslationsToolsRomannumeralFr._(_root);
	@override late final _TranslationsToolsAreacalculatorFr areacalculator = _TranslationsToolsAreacalculatorFr._(_root);
	@override late final _TranslationsToolsMathtexFr mathtex = _TranslationsToolsMathtexFr._(_root);
	@override late final _TranslationsToolsCompassFr compass = _TranslationsToolsCompassFr._(_root);
	@override late final _TranslationsToolsQrcreatorFr qrcreator = _TranslationsToolsQrcreatorFr._(_root);
	@override late final _TranslationsToolsPastebinFr pastebin = _TranslationsToolsPastebinFr._(_root);
	@override late final _TranslationsToolsPercentagecalculatorFr percentagecalculator = _TranslationsToolsPercentagecalculatorFr._(_root);
	@override late final _TranslationsToolsPasswordgeneratorFr passwordgenerator = _TranslationsToolsPasswordgeneratorFr._(_root);
	@override late final _TranslationsToolsPortscannerFr portscanner = _TranslationsToolsPortscannerFr._(_root);
	@override late final _TranslationsToolsCommonsFr commons = _TranslationsToolsCommonsFr._(_root);
	@override late final _TranslationsToolsCrdeckFr crdeck = _TranslationsToolsCrdeckFr._(_root);
	@override late final _TranslationsToolsIplocationFr iplocation = _TranslationsToolsIplocationFr._(_root);
}

// Path: credits
class _TranslationsCreditsFr implements TranslationsCreditsEn {
	_TranslationsCreditsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Crédits';
	@override String app_icon({required Object author}) => 'Icône de l\'application par ${author}';
	@override String app_license({required Object license}) => 'Application sous licence ${license}';
	@override String tools_icons({required Object author}) => 'Icônes des outils par ${author}';
	@override String get ads_disclaimer => 'Les publicités sont là pour m\'aider à payer les coûts de serveur et à soutenir le développement de cette application. Seule une petite bannière est affichée en bas de l\'écran, rien qui ne bloque votre expérience avec Toolbox.';
	@override String get more_apps_and_services => 'Plus d\'apps et services';
	@override String get view_licenses => 'Voir les licences';
	@override String get special_thanks => 'Remerciements spéciaux';
	@override String get contribute_on_github => 'Contribuez sur GitHub';
	@override String get email_copied_to_clipboard => 'Email copié dans le presse-papiers';
	@override String get made_with_love_in_switzerland => 'Développé de tout cœur en Suisse';
	@override String get made_with_love_in_switzerland_description => 'Développé en Suisse, utilisé dans le monde entier.\nMerci d\'utiliser Toolbox.\nSi vous l\'appréciez, n\'hésitez pas à laisser un commentaire sur le Play Store ou l\'App Store.\nCela m\'aide beaucoup et me motive à continuer à améliorer l\'application.';
	@override late final _TranslationsCreditsTranslationsFr translations = _TranslationsCreditsTranslationsFr._(_root);
}

// Path: tools.baseconverter
class _TranslationsToolsBaseconverterFr implements TranslationsToolsBaseconverterEn {
	_TranslationsToolsBaseconverterFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Convertisseur de base';
	@override String get input => 'Valeur d\'entrée';
	@override String get results => 'Résultats';
	@override String get enter_a_dec_number => 'Entrez un nombre décimal';
	@override String get enter_a_hex_number => 'Entrez un nombre hexadécimal';
	@override String get enter_a_bin_number => 'Entrez un nombre binaire';
	@override String get enter_a_oct_number => 'Entrez un nombre octal';
	@override String get hexadecimal => 'Hexadécimal';
	@override String get binary => 'Binaire';
	@override String get octal => 'Octal';
	@override String get decimal => 'Décimal';
	@override String get incompatible_number => 'Nombre incompatible';
	@override String get too_big_number => 'Nombre trop grand';
	@override String the_number_you_entered_is_not_a_valid_x_number({required Object base}) => 'Le nombre que vous avez entré n\'est pas un nombre ${base} valide';
	@override String get the_number_you_entered_is_too_big_to_be_abble_to_convert_it => 'Le nombre que vous avez entré est trop grand pour être converti';
}

// Path: tools.clock
class _TranslationsToolsClockFr implements TranslationsToolsClockEn {
	_TranslationsToolsClockFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Horloge';
	@override String get change_timezone => 'Changer le fuseau horaire';
	@override String get timezone => 'Fuseau horaire';
	@override String get choose_a_timezone => 'Choisissez un fuseau horaire';
	@override String get select_local => 'Heure locale';
}

// Path: tools.metronome
class _TranslationsToolsMetronomeFr implements TranslationsToolsMetronomeEn {
	_TranslationsToolsMetronomeFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Métronome';
	@override String get bpm => 'BPM';
	@override String get beats_per_measure => 'Battements par mesure';
	@override String get start => 'Démarrer';
	@override String get stop => 'Arrêter';
}

// Path: tools.megaphone
class _TranslationsToolsMegaphoneFr implements TranslationsToolsMegaphoneEn {
	_TranslationsToolsMegaphoneFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mégaphone';
	@override late final _TranslationsToolsMegaphoneErrorFr error = _TranslationsToolsMegaphoneErrorFr._(_root);
}

// Path: tools.nslookup
class _TranslationsToolsNslookupFr implements TranslationsToolsNslookupEn {
	_TranslationsToolsNslookupFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'NSLookup';
	@override String get enter_a_domain_name => 'Entrez un nom de domaine';
	@override String get lookup => 'Rechercher';
	@override late final _TranslationsToolsNslookupErrorFr error = _TranslationsToolsNslookupErrorFr._(_root);
	@override String get not_supported_by_system_dns => 'Non supporté par le DNS système';
	@override String get no_records_found => 'Aucun enregistrement trouvé';
}

// Path: tools.ping
class _TranslationsToolsPingFr implements TranslationsToolsPingEn {
	_TranslationsToolsPingFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ping';
	@override String get ping => 'Ping';
	@override String get enter_a_domain_name_or_ip => 'Entrez un nom de domaine ou une adresse IP';
	@override String reply_from_host_time_ttl({required Object host, required Object time, required Object ttl}) => 'Réponse de ${host} : temps=${time}ms TTL=${ttl}';
	@override String x_packets_transmitted_y({required Object transmitted, required Object received}) => '${transmitted} paquets transmis, ${received} paquets reçus';
	@override late final _TranslationsToolsPingErrorFr error = _TranslationsToolsPingErrorFr._(_root);
}

// Path: tools.soundmeter
class _TranslationsToolsSoundmeterFr implements TranslationsToolsSoundmeterEn {
	_TranslationsToolsSoundmeterFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sonomètre';
	@override String get decibels => 'dB';
	@override late final _TranslationsToolsSoundmeterErrorFr error = _TranslationsToolsSoundmeterErrorFr._(_root);
}

// Path: tools.qrreader
class _TranslationsToolsQrreaderFr implements TranslationsToolsQrreaderEn {
	_TranslationsToolsQrreaderFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lecteur de QR';
	@override String get scanned => 'Scanné';
	@override String get openurl => 'Ouvrir le lien';
	@override String get copy_password => 'Copier le MDP';
	@override String get copy => 'Copier';
	@override String get copied_to_clipboard => 'Copié dans le presse-papiers';
	@override String get wifi => 'WiFi';
	@override String get wifi_ssid => 'SSID';
	@override String get wifi_password => 'Mot de passe';
	@override late final _TranslationsToolsQrreaderErrorFr error = _TranslationsToolsQrreaderErrorFr._(_root);
}

// Path: tools.timer
class _TranslationsToolsTimerFr implements TranslationsToolsTimerEn {
	_TranslationsToolsTimerFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Minuteur';
	@override String get start => 'Démarrer';
	@override String get stop => 'Arrêter';
	@override String get pause => 'Pause';
	@override String get please_stop_the_timer_first => 'Veuillez d\'abord arrêter le minuteur';
	@override String get ios_warning_message => 'Pour que le minuteur sonne sur iOS, vous ne devez pas quitter l\'application ni éteindre l\'écran de votre iPhone. Sinon, iOS empêchera le minuteur de sonner lorsqu\'il atteindra zéro.';
	@override String get adjust_time => 'Ajuster le temps';
}

// Path: tools.stopwatch
class _TranslationsToolsStopwatchFr implements TranslationsToolsStopwatchEn {
	_TranslationsToolsStopwatchFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chronomètre';
	@override String get controls => 'Contrôles';
	@override String get start => 'Go';
	@override String get stop => 'Stop';
	@override String get reset => 'Effacer';
	@override String get laps => 'Tours';
	@override String get lap => 'Tour';
}

// Path: tools.roulette
class _TranslationsToolsRouletteFr implements TranslationsToolsRouletteEn {
	_TranslationsToolsRouletteFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

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
	@override late final _TranslationsToolsRouletteWarningFr warning = _TranslationsToolsRouletteWarningFr._(_root);
}

// Path: tools.flipcoins
class _TranslationsToolsFlipcoinsFr implements TranslationsToolsFlipcoinsEn {
	_TranslationsToolsFlipcoinsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pile ou face';
	@override String get change_coin_currency => 'Changer la devise de la pièce';
}

// Path: tools.randomnumber
class _TranslationsToolsRandomnumberFr implements TranslationsToolsRandomnumberEn {
	_TranslationsToolsRandomnumberFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nombre aléatoire';
	@override String get settings => 'Paramètres';
	@override String get min => 'Min';
	@override String get max => 'Max';
	@override late final _TranslationsToolsRandomnumberErrorFr error = _TranslationsToolsRandomnumberErrorFr._(_root);
}

// Path: tools.randomcolor
class _TranslationsToolsRandomcolorFr implements TranslationsToolsRandomcolorEn {
	_TranslationsToolsRandomcolorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Couleur aléatoire';
	@override String get hint => 'Touchez la couleur pour la changer';
	@override String get tap_to_copy => 'Cliquez pour copier';
	@override String get copied_to_clipboard => 'Copié dans le presse-papier';
}

// Path: tools.sshclient
class _TranslationsToolsSshclientFr implements TranslationsToolsSshclientEn {
	_TranslationsToolsSshclientFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Client SSH';
	@override String get backspace => 'Effacer';
	@override String get use_password => 'Utiliser un mot de passe';
	@override String get use_ssh_key => 'Utiliser une clé SSH';
	@override String get connection => 'Connexion';
	@override String get host => 'Hôte';
	@override String get port => 'Port';
	@override String get username => 'Nom d\'utilisateur';
	@override String get password => 'Mot de passe';
	@override String get connect => 'Se connecter';
	@override String get ssh_key => 'Clé SSH';
	@override String get authentication => 'Authentification';
	@override String get select_private_key => 'Sélectionner une clé privée';
	@override String get no_private_key_selected => 'Aucune clé privée sélectionnée';
	@override String get passphrase => 'Phrase secrète (laisser vide si aucune)';
	@override late final _TranslationsToolsSshclientErrorFr error = _TranslationsToolsSshclientErrorFr._(_root);
}

// Path: tools.whiteboard
class _TranslationsToolsWhiteboardFr implements TranslationsToolsWhiteboardEn {
	_TranslationsToolsWhiteboardFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tableau blanc';
	@override String get share_success => 'Votre tableau blanc a été partagé avec succès';
	@override String get save_success => 'Votre tableau blanc a été enregistré avec succès';
}

// Path: tools.networkinfo
class _TranslationsToolsNetworkinfoFr implements TranslationsToolsNetworkinfoEn {
	_TranslationsToolsNetworkinfoFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Informations réseau';
	@override String get loading => 'Chargement...';
	@override String get unknown => 'Inconnu';
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
class _TranslationsToolsUuidgeneratorFr implements TranslationsToolsUuidgeneratorEn {
	_TranslationsToolsUuidgeneratorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Générateur d\'UUID';
	@override String get generate => 'Générer';
	@override String get default_uuid_text => 'Appuyer sur un bouton pour générer un UUID';
	@override String get tap_to_copy => 'Cliquez pour copier';
	@override String get copied_to_clipboard => 'Copié dans le presse-papiers';
	@override String get v1_uuid => 'v1 (basé sur le temps)';
	@override String get v4_uuid => 'v4 (aléatoire)';
	@override String get v5_uuid => 'v5 (basé sur sha1)';
	@override String get v5_generate_title => 'Générer un UUID v5';
	@override String get v5_namespace => 'Espace de noms (laisser vide pour aléatoire)';
	@override String get v5_name => 'Nom (laisser vide si aucun)';
	@override late final _TranslationsToolsUuidgeneratorErrorFr error = _TranslationsToolsUuidgeneratorErrorFr._(_root);
}

// Path: tools.texttospeech
class _TranslationsToolsTexttospeechFr implements TranslationsToolsTexttospeechEn {
	_TranslationsToolsTexttospeechFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Synthèse vocale';
	@override String get choose_a_language => 'Choisir une langue';
	@override String get text_to_speak => 'Texte à prononcer';
	@override String get pitch => 'Hauteur';
	@override String get rate => 'Débit';
	@override String get play => 'Play';
	@override String get stop => 'Stop';
	@override late final _TranslationsToolsTexttospeechErrorFr error = _TranslationsToolsTexttospeechErrorFr._(_root);
}

// Path: tools.nearbypublictransportstops
class _TranslationsToolsNearbypublictransportstopsFr implements TranslationsToolsNearbypublictransportstopsEn {
	_TranslationsToolsNearbypublictransportstopsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Arrêts de transport';
	@override String get loading => 'Chargement...';
	@override String get refresh => 'Rafraîchir';
	@override String get data_source => 'Source des données';
	@override String get initial_dialog_title => 'Information';
	@override String initial_dialog_message({required Object source}) => 'Cet outil est destiné à être utilisé en Suisse. Il utilise les données de "${source}"';
	@override String get data_license_dialog_open => 'Ouvrir';
	@override String get data_license_dialog_title => 'Source des données';
	@override String data_license_dialog_message({required Object source, required Object url}) => 'Les données utilisées dans cet outil proviennent de "${source}".\n${url}';
	@override String get no_departures => 'Aucun départ';
	@override String get departure => 'Départ';
	@override String get arrival => 'Arrivée';
	@override String get platform => 'Voie';
	@override String get show_on_map => 'Plan';
	@override String get map_marker_title => 'Arrêt de transport';
	@override late final _TranslationsToolsNearbypublictransportstopsErrorFr error = _TranslationsToolsNearbypublictransportstopsErrorFr._(_root);
}

// Path: tools.fileencryption
class _TranslationsToolsFileencryptionFr implements TranslationsToolsFileencryptionEn {
	_TranslationsToolsFileencryptionFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chiffrement de fichiers';
	@override String get home_hint => 'Choisissez un fichier pour le chiffrer. Si vous souhaitez déchiffrer un fichier, choisissez un fichier chiffré ayant l\'extension .aes.';
	@override String get no_file_selected => 'Aucun fichier sélectionné';
	@override String get enter_password => 'Veuillez entrer un mot de passe';
	@override String get file_saved_successfully => 'Fichier enregistré avec succès';
	@override String get pick_a_file => 'Choisir un fichier';
	@override String get encryption_password => 'Mot de passe de chiffrement';
	@override String get encrypt => 'Chiffrer';
	@override String get decrypt => 'Déchiffrer';
	@override late final _TranslationsToolsFileencryptionErrorFr error = _TranslationsToolsFileencryptionErrorFr._(_root);
	@override String get enter_password_hint => 'Entrez le mot de passe...';
	@override String get file_selection => 'Sélection de fichier';
}

// Path: tools.youtubethumbnail
class _TranslationsToolsYoutubethumbnailFr implements TranslationsToolsYoutubethumbnailEn {
	_TranslationsToolsYoutubethumbnailFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Miniature YouTube';
	@override String get saved => 'Miniature enregistrée avec succès';
	@override String get youtube_video_id => 'URL de la vidéo YouTube';
	@override String get save_thumbnail => 'Enregistrer la miniature';
	@override String get please_enter_a_video_url => 'Veuillez entrer l\'URL (ou l\'ID) d\'une vidéo YouTube afin de télécharger sa miniature';
	@override late final _TranslationsToolsYoutubethumbnailErrorFr error = _TranslationsToolsYoutubethumbnailErrorFr._(_root);
	@override String get thumbnail_preview => 'Aperçu de la miniature';
}

// Path: tools.nationalanthems
class _TranslationsToolsNationalanthemsFr implements TranslationsToolsNationalanthemsEn {
	_TranslationsToolsNationalanthemsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hymnes nationaux';
	@override String get stop => 'Arrêter l\'hymne';
	@override String get search => 'Rechercher (en anglais)';
	@override String get license => 'Licence';
	@override String license_text({required Object source, required Object license}) => 'Les fichiers audio sont fournis par "${source}" sous la licence ${license}';
	@override String get open => 'Ouvrir';
	@override String get view_license => 'Voir la licence';
	@override String get loading_audio_title => 'Chargement';
	@override String get loading_audio_text => 'Chargement de l\'hymne en cours...';
	@override late final _TranslationsToolsNationalanthemsErrorFr error = _TranslationsToolsNationalanthemsErrorFr._(_root);
	@override String get no_anthems_found => 'Aucun hymne trouvé';
}

// Path: tools.httprequest
class _TranslationsToolsHttprequestFr implements TranslationsToolsHttprequestEn {
	_TranslationsToolsHttprequestFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Requête HTTP';
	@override String get method => 'Méthode';
	@override String get custom_method => 'Méthode personnalisée';
	@override String get url => 'URL';
	@override String get headers => 'En-têtes (headers)';
	@override String get body => 'Corps (body)';
	@override String get allow_bad_certificates => 'Autoriser les certificats non valides';
	@override String get allow_bad_certificates_description => 'L\'activation de cette option permet à l\'outil "Requête HTTP" d\'envoyer des requêtes HTTPS à des serveurs disposant de certificats SSL/TLS invalides, expirés ou auto-signés. Cela désactive d\'importants contrôles de sécurité et peut exposer vos données à l\'interception ou à la falsification par des tiers. N\'utilisez cette fonction que si vous comprenez parfaitement les risques encourus, et uniquement lorsque vous envoyez des requêtes à des serveurs que vous contrôlez et en lesquels vous avez confiance. Son utilisation générale n\'est pas recommandée. Veuillez considérer les requêtes effectuées avec cette option activée comme des requêtes non chiffrées (telles que HTTP) pouvant être manipulées et consultées par des tiers.';
	@override String get i_know_what_i_am_doing => 'Je sais ce que je fais';
	@override String get send_request => 'Envoyer la requête';
	@override String get response => 'Réponse';
	@override String get render_html => 'Rendre le HTML';
	@override String get back_to_details => 'Retour aux détails';
	@override String get status_code => 'Code d\'état';
	@override late final _TranslationsToolsHttprequestErrorFr error = _TranslationsToolsHttprequestErrorFr._(_root);
	@override String get example_headers => 'cle1: valeur1\ncle2: valeur2';
	@override String get request_body_hint => 'Corps de la requête (JSON, XML, etc.)';
}

// Path: tools.morsecode
class _TranslationsToolsMorsecodeFr implements TranslationsToolsMorsecodeEn {
	_TranslationsToolsMorsecodeFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Code morse';
	@override String get alphabet_field => 'Alphabet (A-Z, 0-9)';
	@override String get morse_field => 'Code Morse (. and -)';
	@override String get note_spaces => 'Note : Utilisez 1 espace entre les lettres et 3 espaces entre les mots.';
	@override String get alphabet_to_morse => 'Alphabet vers morse';
	@override String get morse_to_alphabet => 'Morse vers alphabet';
	@override String get play_audio => 'Écouter l\'audio';
	@override String get playing => 'Lecture en cours...';
	@override String get enter_text => 'Entrez le texte ici...';
}

// Path: tools.osm
class _TranslationsToolsOsmFr implements TranslationsToolsOsmEn {
	_TranslationsToolsOsmFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Plan (OSM)';
	@override String get go_to_my_location => 'Aller à ma position';
	@override String get loading_map => 'Chargement de la carte...';
	@override late final _TranslationsToolsOsmErrorFr error = _TranslationsToolsOsmErrorFr._(_root);
}

// Path: tools.gameoflife
class _TranslationsToolsGameoflifeFr implements TranslationsToolsGameoflifeEn {
	_TranslationsToolsGameoflifeFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Jeu de la vie';
	@override String get grid_size => 'Taille de la grille';
	@override String current_size_is_x({required Object size}) => 'La taille actuelle est ${size}';
	@override String get waiting => 'Attente';
	@override String get stop_simulation => 'Arrêter la simulation';
	@override String get start_simulation => 'Démarrer la simulation';
	@override String get randomize_grid => 'Randomiser la grille';
	@override String get clear_grid => 'Effacer la grille';
	@override late final _TranslationsToolsGameoflifeErrorFr error = _TranslationsToolsGameoflifeErrorFr._(_root);
}

// Path: tools.speedometer
class _TranslationsToolsSpeedometerFr implements TranslationsToolsSpeedometerEn {
	_TranslationsToolsSpeedometerFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Compteur de vitesse';
	@override String get reset => 'Réinitialiser';
	@override String get about_traveled_distance_title => 'À propos de la distance parcourue';
	@override String get about_traveled_distance_description => 'La distance parcourue est calculée à partir de la vitesse détectée par le GPS.\nCela signifie que la distance n\'est pas exacte à 100%.';
	@override String get kmh => 'km/h';
	@override String get km => 'km';
	@override String get mph => 'mph';
	@override String get mi => 'mi';
	@override String get change_speed_unit => 'Changer d\'unité de vitesse';
	@override String get change_speed_unit_description => 'Choisissez l\'unité de vitesse que vous souhaitez utiliser avec le compteur de vitesse';
	@override String get traveled_distance => 'Distance parcourue';
	@override late final _TranslationsToolsSpeedometerErrorFr error = _TranslationsToolsSpeedometerErrorFr._(_root);
}

// Path: tools.mc_server_ping
class _TranslationsToolsMcServerPingFr implements TranslationsToolsMcServerPingEn {
	_TranslationsToolsMcServerPingFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ping serveur MC';
	@override String get java_edition => 'Édition Java';
	@override String get information_java => 'Information';
	@override String get information_java_description => 'Cochez cette case si le serveur est disponible pour l\'édition Java de Minecraft. Si ce n\'est pas le cas, décochez-la et l\'outil utilisera l\'API de l\'édition Bedrock.';
	@override String get server_ip => 'IP ou domaine du serveur Minecraft';
	@override String get ping => 'Ping';
	@override String get ping_another_server => 'Ping un autre serveur';
	@override String get api_used => 'API utilisée';
	@override String get about_the_api => 'À propos de l\'API';
	@override String about_the_api_description({required Object source, required Object website}) => 'Cet outil utilise "${source}" du site "${website}" pour ping les serveurs Minecraft';
	@override String get about_open => 'Ouvrir';
	@override String the_server_id_is({required Object id}) => 'L\'ID du serveur est "${id}"';
	@override String x_y_players_online({required Object playersOnline, required Object playersMax}) => '${playersOnline}/${playersMax} joueur(s) en ligne';
	@override String get added_to_favorites => 'Ajouté aux favoris';
	@override String get added_to_favorites_description => 'Le serveur a été ajouté aux favoris';
	@override String get removed_from_favorites => 'Retiré des favoris';
	@override String get removed_from_favorites_description => 'Le serveur a été retiré des favoris';
	@override String get add_to_favorites => 'Ajouter aux favoris';
	@override String get remove_from_favorites => 'Retirer des favoris';
	@override String get remove_from_favorites_description => 'Êtes-vous sûr de vouloir retirer ce serveur de vos favoris ?';
	@override String get from_favorites => 'Depuis les favoris';
	@override String get pick_from_favorites => 'Choisir depuis les favoris';
	@override String get no_favorites => 'Aucun favori';
	@override String get no_favorites_description => 'Vous n\'avez pas encore ajouté de serveurs aux favoris.';
	@override String get online_players => 'Joueur(s) en ligne';
	@override String get online_players_description_no_players_to_show => 'Le serveur a des joueurs en ligne, mais aucun nom de joueur n\'est visible';
	@override late final _TranslationsToolsMcServerPingErrorFr error = _TranslationsToolsMcServerPingErrorFr._(_root);
	@override String get server_id => 'ID du serveur';
	@override String get server_info => 'Infos du serveur';
}

// Path: tools.timestampconverter
class _TranslationsToolsTimestampconverterFr implements TranslationsToolsTimestampconverterEn {
	_TranslationsToolsTimestampconverterFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Convertisseur de timestamp';
	@override String get now_tooltip => 'Maintenant';
	@override String get utc => 'UTC';
	@override String get local => 'Local';
	@override String get local_or_utc_dialog_title => 'Local ou UTC';
	@override String get local_or_utc_dialog_message => 'Allez-vous selectionner une date et une heure locale ou UTC ?';
	@override String get unix_timestamp => 'Timestamp Unix';
	@override String get convert_timestamp_to_date => 'Convertir le timestamp en date';
	@override String get tap_the_date_to_change_it => 'Appuyez sur la date pour la modifier';
	@override String get select_seconds => 'Sélectionner les secondes';
	@override late final _TranslationsToolsTimestampconverterErrorFr error = _TranslationsToolsTimestampconverterErrorFr._(_root);
	@override String get convert => 'Convertir';
}

// Path: tools.urlshortener
class _TranslationsToolsUrlshortenerFr implements TranslationsToolsUrlshortenerEn {
	_TranslationsToolsUrlshortenerFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Raccourcisseur d\'URL';
	@override String get url => 'L\'URL';
	@override String get qr_code => 'Le code QR';
	@override String get share => 'Partager';
	@override String get share_dialog_message => 'Que souhaitez-vous partager ?';
	@override String get your_shortened_url_is => 'Votre URL raccourcie est';
	@override String get copy_to_clipboard => 'Copier dans le presse-papiers';
	@override String get the_link_id_is => 'L\'ID du lien est';
	@override String get link_id_copied_to_clipboard => 'ID du lien copié dans le presse-papiers';
	@override String get the_link_password_is => 'Le mot de passe du lien est';
	@override String get link_password_copied_to_clipboard => 'Mot de passe du lien copié dans le presse-papiers';
	@override String get link_password_hint_text => 'Tapez le mot de passe pour le copier\nVous en aurez besoin pour voir les statistiques de ce lien';
	@override String get shorten_another_url => 'Raccourcir une autre URL';
	@override String get url_to_shorten => 'URL à raccourcir';
	@override String by_clicking_you_accept({required Object url}) => 'En cliquant sur le bouton « raccourcir », vous acceptez les conditions d\'utilisation de "${url}" disponibles via le lien ci-dessous.';
	@override String get terms_of_service => 'Conditions d\'utilisation (ToS)';
	@override String get shorten => 'Raccourcir';
	@override String get more_features => 'Plus de fonctionnalités';
	@override String get more_features_message => 'Utiliser des fonctions supplémentaires telles que le partage de texte, le profil link-in-bio, et plus via le site officiel JTU.ME';
	@override String get open => 'Ouvrir';
	@override String get options => 'Options (optionnel)';
	@override String get access_password => 'Mot de passe d\'accès';
	@override String get expiration_date => 'Date d\'expiration (UTC)';
	@override String get use_my_account => 'Utiliser mon compte';
	@override String get email => 'Email';
	@override String get password => 'Mot de passe';
	@override String get no_account => 'Pas de compte ?';
	@override String get no_account_message => 'Vous pouvez créer un compte gratuit sur le site officiel de JTU.ME';
	@override late final _TranslationsToolsUrlshortenerErrorFr error = _TranslationsToolsUrlshortenerErrorFr._(_root);
	@override String get management_info => 'Infos de gestion';
	@override String get manage_with_account => 'Pour consulter les statistiques et gérer ce lien, utilisez votre compte JTU.ME sur le site officiel';
}

// Path: tools.counter
class _TranslationsToolsCounterFr implements TranslationsToolsCounterEn {
	_TranslationsToolsCounterFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Compteur';
	@override String get add_button => 'Ajouter un bouton';
	@override String get remove_button => 'Supprimer un bouton';
	@override String get enter_number => 'Entrez un nombre';
	@override late final _TranslationsToolsCounterErrorFr error = _TranslationsToolsCounterErrorFr._(_root);
}

// Path: tools.bitwisecalculator
class _TranslationsToolsBitwisecalculatorFr implements TranslationsToolsBitwisecalculatorEn {
	_TranslationsToolsBitwisecalculatorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Calculatrice binaire';
	@override String get binary_values => 'Valeurs binaires';
	@override String get first_number => 'Premier nombre';
	@override String get second_number => 'Deuxième nombre';
	@override String get enter_a_binary_number => 'Entrez un nombre binaire';
	@override String get operations => 'Opérations';
	@override String get and => 'ET';
	@override String get or => 'OU';
	@override String get xor => 'OU exclusif';
	@override String get result => 'Résultat';
	@override late final _TranslationsToolsBitwisecalculatorErrorFr error = _TranslationsToolsBitwisecalculatorErrorFr._(_root);
}

// Path: tools.musicsearch
class _TranslationsToolsMusicsearchFr implements TranslationsToolsMusicsearchEn {
	_TranslationsToolsMusicsearchFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Recherche de musique';
	@override String get unknown_title => 'Titre inconnu';
	@override String get unknown_artist => 'Artiste inconnu';
	@override String get unknown_album => 'Album inconnu';
	@override String get loading => 'Chargement';
	@override String get loading_audio_preview => 'Chargement de l\'échantillon audio...';
	@override String get stop_audio_preview => 'Arrêter l\'échantillon audio';
	@override String get data_source => 'Source des données';
	@override String this_tool_uses_the_x_api({required Object service}) => 'Cet outil utilise l\'API "${service}" pour rechercher de la musique.\nLes échantillons audio sont fournis par "${service}".';
	@override String go_to_x({required Object service}) => 'Aller sur ${service}';
	@override String get search_for_music => 'Rechercher de la musique';
	@override String use_the_searchbar_to_search_music({required Object service}) => 'Utilisez la barre de recherche pour trouver de la musique.\nSi votre recherche ne donne aucun résultat, essayez un autre terme de recherche.\nSi vous n\'obtenez toujours aucun résultat, vérifiez que votre connexion internet fonctionne correctement et que ${service} est disponible dans votre pays ou région.';
	@override String open_in_x({required Object service}) => 'Ouvrir dans ${service}';
	@override String get play_preview => 'Lire l\'échantillon';
	@override late final _TranslationsToolsMusicsearchErrorFr error = _TranslationsToolsMusicsearchErrorFr._(_root);
}

// Path: tools.musicanalyser
class _TranslationsToolsMusicanalyserFr implements TranslationsToolsMusicanalyserEn {
	_TranslationsToolsMusicanalyserFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Analyse de musique';
	@override String get press_the_button_to_start_music_analysis => 'Appuyez sur le bouton pour démarrer l\'analyse de la musique';
	@override String get loading => 'Chargement...';
	@override String analyzing_music({required Object remainingSeconds}) => 'Analyse de la musique... (${remainingSeconds}s)';
	@override String get getting_results => 'Récupération des résultats...';
	@override String get unknown => 'Inconnu';
	@override String get api_used => 'API utilisée';
	@override String this_tool_uses_the_x_api({required Object service, required Object company}) => 'Cet outil utilise l\'API "${service}" via un serveur backend de Koizeay. "${service}" est une marque déposée de "${company}" et n\'est pas affiliée à cet outil.';
	@override String get start_analyzing_music => 'Démarrer l\'analyse de la musique';
	@override String get clear => 'Effacer';
	@override late final _TranslationsToolsMusicanalyserErrorFr error = _TranslationsToolsMusicanalyserErrorFr._(_root);
}

// Path: tools.textdifferences
class _TranslationsToolsTextdifferencesFr implements TranslationsToolsTextdifferencesEn {
	_TranslationsToolsTextdifferencesFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Différences de texte';
	@override String get old_text => 'Ancien texte';
	@override String get new_text => 'Nouveau texte';
	@override String get no_text_hint => 'Entrez du texte ci-dessus pour voir les différences';
	@override String get enter_old_text => 'Entrez l\'ancien texte...';
	@override String get enter_new_text => 'Entrez le nouveau texte...';
}

// Path: tools.characterscopy
class _TranslationsToolsCharacterscopyFr implements TranslationsToolsCharacterscopyEn {
	_TranslationsToolsCharacterscopyFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Copie de caractères';
	@override String get important => 'Important';
	@override String get important_description => 'Certains caractères peuvent ne pas s\'afficher correctement sur tous les appareils en fonction de votre système d\'exploitation. De même, certains caractères peuvent ne pas être pris en charge par toutes les applications et polices. Cliquez simplement sur le caractère que vous souhaitez copier et il sera copié dans votre presse-papiers.';
	@override String get copied_to_clipboard => 'Copié dans le presse-papiers';
}

// Path: tools.whoisdomain
class _TranslationsToolsWhoisdomainFr implements TranslationsToolsWhoisdomainEn {
	_TranslationsToolsWhoisdomainFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Whois de domaine';
	@override String get domain_name => 'Nom de domaine';
	@override String get whois_lookup => 'Recherche Whois';
	@override String get disclaimer => 'Avertissement';
	@override String get disclaimer_text => 'Toolbox fournit une fonction de recherche WHOIS à des fins d\'information uniquement. Les données récupérées peuvent ne pas être exactes, complètes ou à jour, et sont soumises aux conditions générales des registres de domaines respectifs. Il est interdit aux utilisateurs d\'utiliser les données WHOIS à des fins de spam, à des fins illégales ou de collecter des données de manière automatisée. En utilisant cet outil, vous acceptez de vous conformer aux lois applicables et aux conditions de service du registre. Toolbox et/ou Koizeay n\'assument aucune responsabilité en cas d\'erreurs, d\'omissions ou d\'utilisation abusive des données. Veuillez noter que certains TLD peuvent ne pas être pris en charge par cet outil.';
	@override String get loading => 'Chargement...';
	@override String get ip_address_not_supported => 'Adresse IP non prise en charge';
	@override String get ip_address_not_supported_description => 'Cet outil supporte uniquement les recherches de domaine, pas les recherches d\'adresse IP';
	@override String get no_result => 'Aucun résultat valide trouvé';
	@override String get view_pretty => 'Vue formatée';
	@override String get view_raw => 'Vue brute';
	@override String get raw_whois_data => 'Données WHOIS brutes';
	@override String get domain => 'Domaine';
	@override String get registrar => 'Registrar';
	@override String get dates => 'Dates';
	@override String get status => 'Statut';
	@override String get name_servers => 'Serveurs de noms';
	@override String get contact => 'Contact';
	@override String get other => 'Autre';
	@override late final _TranslationsToolsWhoisdomainErrorFr error = _TranslationsToolsWhoisdomainErrorFr._(_root);
}

// Path: tools.textcounter
class _TranslationsToolsTextcounterFr implements TranslationsToolsTextcounterEn {
	_TranslationsToolsTextcounterFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Compteur de texte';
	@override String get clear => 'Effacer';
	@override String get enter_text_here => 'Entrez du texte';
	@override String get length => 'Longueur';
	@override String get trimmed_length => 'Longueur tronquée';
	@override String get raw_length => 'Longueur brute';
	@override String get letters => 'Lettres';
	@override String get words => 'Mots';
	@override String get spaces => 'Espaces';
	@override String get digits => 'Chiffres';
	@override String get lines => 'Lignes';
	@override String get empty_lines => 'Lignes vides';
	@override String get total_lines => 'Total de lignes';
	@override String get text_input => 'Saisie de texte';
}

// Path: tools.romannumeral
class _TranslationsToolsRomannumeralFr implements TranslationsToolsRomannumeralEn {
	_TranslationsToolsRomannumeralFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chiffres romains';
	@override String get change_to => 'Passer en';
	@override String get roman_numeral => 'chiffre romain';
	@override String get number => 'nombre';
	@override String get number_input_hint => 'Nombre';
	@override String get roman_numeral_input_hint => 'Chiffre romains';
	@override String get tap_to_copy => 'Cliquez pour copier';
	@override String get copied_to_clipboard => 'Copié dans le presse-papiers';
	@override late final _TranslationsToolsRomannumeralErrorFr error = _TranslationsToolsRomannumeralErrorFr._(_root);
}

// Path: tools.areacalculator
class _TranslationsToolsAreacalculatorFr implements TranslationsToolsAreacalculatorEn {
	_TranslationsToolsAreacalculatorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Calculateur d\'aire';
	@override String get select_a_shape => 'Sélectionnez une forme';
	@override String get values => 'Valeurs';
	@override String get area => 'Aire';
	@override String get calculate => 'Calculer';
	@override late final _TranslationsToolsAreacalculatorShapesFr shapes = _TranslationsToolsAreacalculatorShapesFr._(_root);
	@override late final _TranslationsToolsAreacalculatorInputsFr inputs = _TranslationsToolsAreacalculatorInputsFr._(_root);
	@override late final _TranslationsToolsAreacalculatorErrorFr error = _TranslationsToolsAreacalculatorErrorFr._(_root);
}

// Path: tools.mathtex
class _TranslationsToolsMathtexFr implements TranslationsToolsMathtexEn {
	_TranslationsToolsMathtexFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'MathTeX';
	@override String get enter_a_mathematical_expression_in_tex_format => 'Entrez une expression mathématique au format TeX';
	@override String get texExpression => 'Expression TeX';
	@override String get export_to_image => 'Exporter en image';
	@override String get preview => 'Aperçu';
	@override String get color => 'Couleur';
	@override String get get_help => 'Obtenir de l\'aide';
	@override String get open_help_website => 'Ouvrir le site d\'aide';
	@override String get help_content => 'Entrez une expression mathématique au format TeX pour la rendre en formule mathématique. Par exemple, l\'expression TeX \'\\frac{a}{b}\' sera rendue comme une fraction avec \'a\' au-dessus de \'b\'. Vous pouvez utiliser n\'importe quelle syntaxe TeX prise en charge pour créer des expressions mathématiques complexes. Une fois que vous avez entré votre expression, vous pouvez la prévisualiser et l\'exporter en tant que fichier SVG.\nCompatible avec le format TeX de MathJax.';
	@override String get copied_to_clipboard => 'Copié dans le presse-papiers';
	@override late final _TranslationsToolsMathtexErrorFr error = _TranslationsToolsMathtexErrorFr._(_root);
}

// Path: tools.compass
class _TranslationsToolsCompassFr implements TranslationsToolsCompassEn {
	_TranslationsToolsCompassFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Boussole';
	@override late final _TranslationsToolsCompassErrorFr error = _TranslationsToolsCompassErrorFr._(_root);
}

// Path: tools.qrcreator
class _TranslationsToolsQrcreatorFr implements TranslationsToolsQrcreatorEn {
	_TranslationsToolsQrcreatorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Créateur de QR';
	@override String get qr_code_settings => 'Détails du QR code';
	@override String get ecc_low => 'Bas';
	@override String get ecc_medium => 'Moyen';
	@override String get ecc_quartile => 'Quartile';
	@override String get ecc_high => 'Haut';
	@override String get saved_successfully => 'QR code enregistré avec succès';
	@override String get shared_successfully => 'QR code partagé avec succès';
	@override String get enter_text_or_url => 'Entrez du texte ou une URL';
	@override String get error_correction_level => 'Niveau de correction d\'erreur';
	@override String get create => 'Créer';
	@override String get generated_qr_code => 'QR code généré';
	@override String get save => 'Enregistrer';
	@override String get share => 'Partager';
	@override late final _TranslationsToolsQrcreatorErrorFr error = _TranslationsToolsQrcreatorErrorFr._(_root);
}

// Path: tools.pastebin
class _TranslationsToolsPastebinFr implements TranslationsToolsPastebinEn {
	_TranslationsToolsPastebinFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pastebin';
	@override String get url => 'L\'URL';
	@override String get qr_code => 'Le code QR';
	@override String get share => 'Partager';
	@override String get share_dialog_message => 'Que souhaitez-vous partager ?';
	@override String get your_short_link_is => 'Votre lien court est';
	@override String get copy_to_clipboard => 'Copier dans le presse-papiers';
	@override String get copied_to_clipboard => 'Lien court copié dans le presse-papiers';
	@override String get the_link_id_is => 'The link ID is';
	@override String get link_id_copied_to_clipboard => 'Link ID copied to clipboard';
	@override String get the_link_password_is => 'The link password is';
	@override String get link_password_copied_to_clipboard => 'Link password copied to clipboard';
	@override String get link_password_hint_text => 'Tap the password to copy it\nYou will need it to view statistics about this link';
	@override String get paste_another_text => 'Coller un autre texte';
	@override String get text_to_paste => 'Texte à coller';
	@override String get text_paste_field_hint => 'Collez votre texte, code source ou autre contenu ici';
	@override String by_clicking_you_accept({required Object url}) => 'En cliquant sur le bouton « envoyer », vous acceptez les conditions d\'utilisation de "${url}" disponibles via le lien ci-dessous.';
	@override String get terms_of_service => 'Conditions d\'utilisation (ToS)';
	@override String get send => 'Envoyer';
	@override String get more_features => 'Plus de fonctionnalités';
	@override String get more_features_message => 'Utiliser des fonctions supplémentaires telles que le raccourcissement d\'URL, le profil link-in-bio, et plus via le site officiel JTU.ME';
	@override String get open => 'Ouvrir';
	@override String get options => 'Options (optionnel)';
	@override String get access_password => 'Mot de passe d\'accès';
	@override String get expiration_date => 'Date d\'expiration (UTC)';
	@override String get use_my_account => 'Utiliser mon compte';
	@override String get email => 'Email';
	@override String get password => 'Mot de passe';
	@override String get no_account => 'Pas de compte ?';
	@override String get no_account_message => 'Vous pouvez créer un compte gratuit sur le site officiel de JTU.ME pour gérer vos liens et vos pastes.';
	@override late final _TranslationsToolsPastebinErrorFr error = _TranslationsToolsPastebinErrorFr._(_root);
	@override String get management_info => 'Infos de gestion';
	@override String get manage_with_account => 'Pour consulter les statistiques et gérer ce lien, utilisez votre compte JTU.ME sur le site officiel';
}

// Path: tools.percentagecalculator
class _TranslationsToolsPercentagecalculatorFr implements TranslationsToolsPercentagecalculatorEn {
	_TranslationsToolsPercentagecalculatorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Calculateur de pourcentage';
	@override String get result => 'Résultat';
	@override String get percentage => 'Pourcentage';
	@override String get eg => 'ex.';
	@override String get total => 'Total';
	@override String get first_value => 'Première valeur';
	@override String get second_value => 'Seconde valeur';
	@override String get what_is => 'Quel est';
	@override String get of => 'de';
	@override String get is_what_percentage_of => 'est quel pourcentage de';
	@override String get what_is_the_percentage_difference => 'Quelle est la différence en pourcentage';
	@override String get from => 'de';
	@override String get to => 'à';
	@override String get calculate => 'Calculer';
	@override late final _TranslationsToolsPercentagecalculatorErrorFr error = _TranslationsToolsPercentagecalculatorErrorFr._(_root);
}

// Path: tools.passwordgenerator
class _TranslationsToolsPasswordgeneratorFr implements TranslationsToolsPasswordgeneratorEn {
	_TranslationsToolsPasswordgeneratorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Générateur de mot de passe';
	@override String get password_length => 'Longueur du mot de passe';
	@override String get number_of_digits => 'Nombre de chiffres';
	@override String get number_of_special_characters => 'Nombre de caractères spéciaux';
	@override String get generate_password => 'Générer un mot de passe';
	@override String get password_copied_to_clipboard => 'Mot de passe copié dans le presse-papiers';
	@override String get tap_to_copy => 'Cliquez pour copier';
	@override late final _TranslationsToolsPasswordgeneratorErrorFr error = _TranslationsToolsPasswordgeneratorErrorFr._(_root);
	@override String get generated_password => 'Mot de passe généré';
}

// Path: tools.portscanner
class _TranslationsToolsPortscannerFr implements TranslationsToolsPortscannerEn {
	_TranslationsToolsPortscannerFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Scanner de ports';
	@override String get host_to_scan => 'Hôte à scanner';
	@override String get start_port => 'Port de départ';
	@override String get end_port => 'Port de fin';
	@override String get start_scan => 'Démarrer le scan';
	@override String get stop_scan => 'Arrêter le scan';
	@override String get port => 'Port';
	@override late final _TranslationsToolsPortscannerErrorFr error = _TranslationsToolsPortscannerErrorFr._(_root);
	@override String get example_domain_or_ip => 'example.com ou 192.168.1.1';
	@override String get port_range => 'Plage de ports';
	@override String get scan_progress => 'Progression du scan';
}

// Path: tools.commons
class _TranslationsToolsCommonsFr implements TranslationsToolsCommonsEn {
	_TranslationsToolsCommonsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Commons';
	@override String get data_source_and_licensing => 'Source des données et licences';
	@override String get data_source_and_licensing_description => 'Tous les fichiers multimédias proviennent de Wikimedia Commons et sont soumis à leurs licences respectives. Veuillez vous assurer de respecter les conditions de chaque licence lorsque vous utilisez et téléchargez les fichiers multimédias.';
	@override String get open_wikimedia_commons => 'Ouvrir Wikimedia Commons';
	@override String get search_files => 'Rechercher des fichiers';
	@override String get enter_search_query_to_find_files => 'Entrez un terme de recherche pour trouver des fichiers sur Wikimedia Commons';
	@override String get view_on_wikimedia => 'Voir sur Wikimedia Commons';
	@override String get previous => 'Précédent';
	@override String get next => 'Suivant';
	@override String get bytes => 'octets';
	@override String get kilobytes => 'Ko';
	@override String get megabytes => 'Mo';
	@override String get gigabytes => 'Go';
	@override String get no_files_found => 'Aucun fichier trouvé';
	@override String get close_preview => 'Fermer l\'aperçu';
	@override String get view_license_details => 'Voir les détails de la licence';
	@override String get download_media => 'Télécharger le média';
	@override String get close => 'Fermer';
	@override String get file_information => 'Informations sur le fichier';
	@override String get unknown_license => 'Licence inconnue';
	@override String get mime_type => 'Type MIME';
	@override String get file_size => 'Taille';
	@override String get dimensions => 'Dimensions';
	@override String get duration => 'Durée';
	@override String get file_license => 'Licence';
	@override String get file_by => 'Fichier par';
	@override String get file_downloaded_successfully => 'Fichier téléchargé avec succès';
	@override String get downloading => 'Téléchargement...';
	@override late final _TranslationsToolsCommonsErrorFr error = _TranslationsToolsCommonsErrorFr._(_root);
	@override String get load_preview => 'Charger l\'aperçu';
	@override String page({required Object number}) => 'Page ${number}';
}

// Path: tools.crdeck
class _TranslationsToolsCrdeckFr implements TranslationsToolsCrdeckEn {
	_TranslationsToolsCrdeckFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Deck Clash Royale';
	@override String get clear_unlocked_deck_cards => 'Effacer les cartes non épinglées du deck';
	@override String get about_and_credits => 'À propos et crédits';
	@override String get about_and_credits_description => 'Cet outil utilise l\'API officielle Clash Royale fournie par Supercell (via un serveur backend Koizeay). Cet outil n\'est en aucun cas affilié à ou approuvé par Supercell. Tout le contenu Clash Royale, y compris, mais sans s\'y limiter, les images, les noms et les marques commerciales, sont la propriété de Supercell.';
	@override String get supercell_website => 'Site de Supercell';
	@override String get no_deck => 'Aucun deck';
	@override String get generate_new_deck => 'Générer un nouveau deck';
	@override String get open_deck_in_clash_royale => 'Ouvrir le deck dans Clash Royale';
	@override String get share_deck => 'Partager le deck';
	@override String get search_cards => 'Rechercher des cartes';
	@override String get import_cards_from_player_profile => 'Importer des cartes depuis le profil d\'un joueur';
	@override String get deselect_all_cards => 'Désélectionner toutes les cartes';
	@override String get select_all_cards => 'Sélectionner toutes les cartes';
	@override String x_elixirs({required Object elixirs}) => '${elixirs} élixirs';
	@override String get player_tag => 'Identifiant du joueur';
	@override String get import => 'Importer';
	@override String get importing_cards => 'Importation des cartes...';
	@override String share_deck_text_message({required Object url}) => 'Regarde mon deck Clash Royale créé avec Toolbox !\nOuvre-le dans Clash Royale en utilisant ce lien : ${url}';
	@override late final _TranslationsToolsCrdeckErrorFr error = _TranslationsToolsCrdeckErrorFr._(_root);
}

// Path: tools.iplocation
class _TranslationsToolsIplocationFr implements TranslationsToolsIplocationEn {
	_TranslationsToolsIplocationFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'IP location';
	@override String get api_used => 'API utilisée';
	@override String get about_the_api => 'À propos de l\'API';
	@override String about_the_api_description({required Object source}) => 'Cet outil utilise l\'API fournie par "${source}" pour récupérer les informations de localisation de l\'adresse IP indiquée';
	@override String get visit_website => 'Voir le site';
	@override String get ip_address => 'Adresse IP';
	@override String get get_ip_location => 'Obtenir la localisation de l\'IP';
	@override String get location_information => 'Informations de localisation';
	@override String get n_a => 'N/A';
	@override String get country => 'Pays';
	@override String get provider => 'Fournisseur';
	@override late final _TranslationsToolsIplocationErrorFr error = _TranslationsToolsIplocationErrorFr._(_root);
}

// Path: credits.translations
class _TranslationsCreditsTranslationsFr implements TranslationsCreditsTranslationsEn {
	_TranslationsCreditsTranslationsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Traductions';
	@override String english({required Object author}) => 'Anglais par ${author}';
	@override String french({required Object author}) => 'Français par ${author}';
	@override String japanese({required Object author}) => 'Japonais par ${author}';
}

// Path: tools.megaphone.error
class _TranslationsToolsMegaphoneErrorFr implements TranslationsToolsMegaphoneErrorEn {
	_TranslationsToolsMegaphoneErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get microphone_permission_denied => 'Permission refusée, veuillez autoriser l\'application à accéder au micro dans les paramètres de votre appareil';
}

// Path: tools.nslookup.error
class _TranslationsToolsNslookupErrorFr implements TranslationsToolsNslookupErrorEn {
	_TranslationsToolsNslookupErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get please_enter_a_domain_name => 'Veuillez entrer un nom de domaine';
	@override String get no_address_associated_with_domain => 'Aucune adresse IP n\'est associée au nom d\'hôte.\nVérifiez votre saisie et votre connexion internet puis réessayez.';
}

// Path: tools.ping.error
class _TranslationsToolsPingErrorFr implements TranslationsToolsPingErrorEn {
	_TranslationsToolsPingErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get please_enter_a_domain_name_or_ip => 'Veuillez entrer un nom de domaine ou une adresse IP';
	@override String get request_timeout => 'Délai d\'attente de la demande dépassé';
	@override String get unkown_host => 'Hôte inconnu';
	@override String get no_reply => 'Pas de réponse';
	@override String get unkown_error => 'Erreur inconnue';
}

// Path: tools.soundmeter.error
class _TranslationsToolsSoundmeterErrorFr implements TranslationsToolsSoundmeterErrorEn {
	_TranslationsToolsSoundmeterErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get impossible_to_start_the_sound_meter => 'Impossible de démarrer le sonomètre';
	@override String get no_sound_detected => 'Aucun son détecté, vérifiez que l\'application a accès au micro dans les paramètres de votre appareil.';
}

// Path: tools.qrreader.error
class _TranslationsToolsQrreaderErrorFr implements TranslationsToolsQrreaderErrorEn {
	_TranslationsToolsQrreaderErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get no_qr_code => 'Aucun code QR';
	@override String get error_no_result => 'Aucun résultat trouvé';
}

// Path: tools.roulette.warning
class _TranslationsToolsRouletteWarningFr implements TranslationsToolsRouletteWarningEn {
	_TranslationsToolsRouletteWarningFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String you_cant_add_more_than_x_items({required Object numberOfItems}) => 'Vous ne pouvez pas ajouter plus de ${numberOfItems} items dans la roulette';
	@override String you_must_have_at_least_x_items({required Object numberOfItems}) => 'Vous devez avoir au moins ${numberOfItems} items dans la roulette';
	@override String get you_must_enter_an_item_name => 'Vous devez entrer un nom d\'item';
}

// Path: tools.randomnumber.error
class _TranslationsToolsRandomnumberErrorFr implements TranslationsToolsRandomnumberErrorEn {
	_TranslationsToolsRandomnumberErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get invalid_number => 'Nombre invalide, veuillez réessayer.';
	@override String get min_must_be_lower_than_max => 'Le nombre minimum doit être inférieur au nombre maximum.';
	@override String min_and_max_must_be_between_x_and_y({required Object minNumberLimit, required Object maxNumberLimit}) => 'Les nombres minimum et maximum doivent être compris entre ${minNumberLimit} et ${maxNumberLimit}.';
}

// Path: tools.sshclient.error
class _TranslationsToolsSshclientErrorFr implements TranslationsToolsSshclientErrorEn {
	_TranslationsToolsSshclientErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get invalid_port => 'Port invalide';
	@override String get invalid_passphrase => 'Vous avez peut-être saisi une phrase de passe alors que votre clé n\'est pas cryptée, ou inversement';
	@override String get invalid_private_key => 'La clé que vous avez fournie n\'est pas une clé privée valide';
	@override String get authentication_failed => 'Échec de l\'authentification';
	@override String get connection_failed => 'Impossible de se connecter à l\'hôte';
	@override String get unknown_error => 'Une erreur inconnue s\'est produite, veuillez réessayer';
}

// Path: tools.uuidgenerator.error
class _TranslationsToolsUuidgeneratorErrorFr implements TranslationsToolsUuidgeneratorErrorEn {
	_TranslationsToolsUuidgeneratorErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get invalid_namespace => 'L\'espace de noms n\'est pas un UUID valide';
}

// Path: tools.texttospeech.error
class _TranslationsToolsTexttospeechErrorFr implements TranslationsToolsTexttospeechErrorEn {
	_TranslationsToolsTexttospeechErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get please_try_again => 'Veuillez réessayer plus tard.\nSi vous utilisez cette langue pour la première fois, veuillez patienter quelques secondes et réessayer.';
	@override String get please_select_a_language => 'Veuillez sélectionner une langue';
}

// Path: tools.nearbypublictransportstops.error
class _TranslationsToolsNearbypublictransportstopsErrorFr implements TranslationsToolsNearbypublictransportstopsErrorEn {
	_TranslationsToolsNearbypublictransportstopsErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get location_permission_denied => 'La permission de localisation a été refusée ou désactivée, veuillez l\'activer dans les paramètres afin de voir les arrêts de transport public à proximité.';
	@override String get check_internet_connection => 'Vérifiez votre connexion internet et réessayez.';
	@override String get api_empty_response => 'L\'API a renvoyé une réponse vide';
	@override String api_error_xxx({required Object errorCode}) => 'L\'API a renvoyé une erreur ${errorCode}';
	@override String get no_stops_found => 'Aucun arrêt trouvé avec cette recherche';
	@override String get no_maps_app => 'Aucune application de cartographie n\'est installée sur votre appareil';
}

// Path: tools.fileencryption.error
class _TranslationsToolsFileencryptionErrorFr implements TranslationsToolsFileencryptionErrorEn {
	_TranslationsToolsFileencryptionErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get failed_to_read_file => 'Échec de la lecture du fichier';
	@override String get failed_to_decrypt_file => 'Échec de déchiffrement du fichier, veuillez vérifier le mot de passe';
	@override String get please_enter_a_password => 'Veuillez entrer un mot de passe';
}

// Path: tools.youtubethumbnail.error
class _TranslationsToolsYoutubethumbnailErrorFr implements TranslationsToolsYoutubethumbnailErrorEn {
	_TranslationsToolsYoutubethumbnailErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get failed_to_download => 'Impossible de télécharger la miniature depuis YouTube';
	@override String get please_enter_a_valid_video_id => 'Veuillez saisir l\'URL d\'une vidéo YouTube valide\nVous avez également besoin d\'une connexion internet pour télécharger la miniature à partir de YouTube';
}

// Path: tools.nationalanthems.error
class _TranslationsToolsNationalanthemsErrorFr implements TranslationsToolsNationalanthemsErrorEn {
	_TranslationsToolsNationalanthemsErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get failed_to_load_list => 'Impossible de charger la liste des hymnes. Veuillez vérifier votre connexion internet et réessayer.';
	@override String get failed_to_play_anthem => 'Impossible de jouer l\'hymne. Veuillez vérifier votre connexion internet et réessayer.';
}

// Path: tools.httprequest.error
class _TranslationsToolsHttprequestErrorFr implements TranslationsToolsHttprequestErrorEn {
	_TranslationsToolsHttprequestErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get url_cannot_be_empty => 'L\'URL ne peut pas être vide';
	@override String get invalid_url => 'URL invalide';
	@override String get invalid_headers => 'En-têtes invalides';
	@override String get timeout => 'La requête a dépassé le temps de réponse.\nVeuillez vérifier votre saisie et votre connexion internet, puis réessayez.';
	@override String get other_error => 'Une erreur s\'est produite lors de l\'envoi de la requête.\nVeuillez vérifier votre saisie et votre connexion internet, puis réessayez.';
}

// Path: tools.osm.error
class _TranslationsToolsOsmErrorFr implements TranslationsToolsOsmErrorEn {
	_TranslationsToolsOsmErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get location_permission_denied => 'Vous devez autoriser l\'accès à la position pour utiliser cette fonction';
	@override String get location_services_disabled => 'Les services de position sont désactivés';
}

// Path: tools.gameoflife.error
class _TranslationsToolsGameoflifeErrorFr implements TranslationsToolsGameoflifeErrorEn {
	_TranslationsToolsGameoflifeErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get no_alive_cells => 'Pas de cellules vivantes';
	@override String get no_alive_cells_description => 'Il n\'y a pas de cellules vivantes.\nVeuillez toucher la grille pour en ajouter.';
	@override String get please_stop_simulation => 'Veuillez d\'abord arrêter la simulation';
}

// Path: tools.speedometer.error
class _TranslationsToolsSpeedometerErrorFr implements TranslationsToolsSpeedometerErrorEn {
	_TranslationsToolsSpeedometerErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get location_permission_denied_title => 'Position requise';
	@override String get location_permission_denied_description => 'Cet outil nécessite l\'accès à la position pour déterminer votre vitesse.';
	@override String get location_services_disabled_title => 'Services de position désactivés';
	@override String get location_services_disabled_description => 'Cet outil nécessite que les services de localisation soient activés pour déterminer votre vitesse.';
}

// Path: tools.mc_server_ping.error
class _TranslationsToolsMcServerPingErrorFr implements TranslationsToolsMcServerPingErrorEn {
	_TranslationsToolsMcServerPingErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get please_enter_a_server_ip => 'Veuillez entrer une adresse IP ou un nom de domaine valide';
	@override String get server_offline_or_does_not_exist => 'Le serveur est hors ligne ou n\'existe pas';
	@override String get please_check_your_internet_connection => 'Veuillez vérifier votre connexion internet et réessayer';
}

// Path: tools.timestampconverter.error
class _TranslationsToolsTimestampconverterErrorFr implements TranslationsToolsTimestampconverterErrorEn {
	_TranslationsToolsTimestampconverterErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get invalid_timestamp => 'Timestamp invalide';
}

// Path: tools.urlshortener.error
class _TranslationsToolsUrlshortenerErrorFr implements TranslationsToolsUrlshortenerErrorEn {
	_TranslationsToolsUrlshortenerErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get failed_to_shorten_url => 'Le raccourcissement de l\'URL a échoué, veuillez vérifier votre saisie et votre connexion internet.';
	@override String get impossible_to_connect_to_the_server => 'Impossible de se connecter au serveur';
	@override String get impossible_to_connect_to_the_server_message => 'Échec de la connexion au serveur, veuillez vérifier votre connexion internet et réessayer.';
	@override String get unauthorized => 'Non autorisé. Veuillez vérifier vos identifiants.';
	@override String get invalid_expiration_date => 'La date d\'expiration doit être dans le futur.';
}

// Path: tools.counter.error
class _TranslationsToolsCounterErrorFr implements TranslationsToolsCounterErrorEn {
	_TranslationsToolsCounterErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get invalid_number => 'Le nombre que vous avez entré n\'est pas valide';
	@override String the_number_must_be_between_x_and_y({required Object minNumberLimit, required Object maxNumberLimit}) => 'Le nombre doit être compris entre ${minNumberLimit} et ${maxNumberLimit}';
	@override String get you_must_have_at_least_one_button => 'Vous devez avoir au moins un bouton';
	@override String get this_button_already_exists => 'Ce bouton existe déjà';
}

// Path: tools.bitwisecalculator.error
class _TranslationsToolsBitwisecalculatorErrorFr implements TranslationsToolsBitwisecalculatorErrorEn {
	_TranslationsToolsBitwisecalculatorErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get invalid_input => 'Saisie invalide';
}

// Path: tools.musicsearch.error
class _TranslationsToolsMusicsearchErrorFr implements TranslationsToolsMusicsearchErrorEn {
	_TranslationsToolsMusicsearchErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get error_playing_audio_preview => 'Erreur lors de la lecture de l\'échantillon audio. Veuillez réessayer plus tard.';
	@override String get unable_to_connect_to_the_api => 'Impossible de se connecter à l\'API, veuillez vérifier votre connexion internet et réessayer.';
}

// Path: tools.musicanalyser.error
class _TranslationsToolsMusicanalyserErrorFr implements TranslationsToolsMusicanalyserErrorEn {
	_TranslationsToolsMusicanalyserErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get permission_denied => 'Permission refusée';
	@override String get permission_denied_description => 'L\'autorisation du microphone est nécessaire pour analyser la musique. Veuillez accorder cette autorisation et réessayer.';
	@override String get no_match_found => 'Aucune correspondance trouvée';
	@override String get no_match_found_description => 'Aucune correspondance musicale n\'a été trouvée. Veuillez réessayer.';
	@override String get error_occurred => 'Une erreur s\'est produite lors de l\'analyse de la musique. Veuillez vérifier votre connexion internet et réessayer.';
	@override String get please_update_the_app_and_try_again => 'Veuillez mettre à jour l\'application et réessayer. Si le problème persiste avec la dernière version, réessayez plus tard.';
}

// Path: tools.whoisdomain.error
class _TranslationsToolsWhoisdomainErrorFr implements TranslationsToolsWhoisdomainErrorEn {
	_TranslationsToolsWhoisdomainErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get impossible_to_get_whois_information => 'Impossible d\'obtenir les informations whois, veuillez vérifier votre saisie et votre connexion internet puis réessayez';
}

// Path: tools.romannumeral.error
class _TranslationsToolsRomannumeralErrorFr implements TranslationsToolsRomannumeralErrorEn {
	_TranslationsToolsRomannumeralErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get invalid_roman_numeral => 'Chiffre romain invalide ou non pris en charge';
}

// Path: tools.areacalculator.shapes
class _TranslationsToolsAreacalculatorShapesFr implements TranslationsToolsAreacalculatorShapesEn {
	_TranslationsToolsAreacalculatorShapesFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get circle => 'Cercle';
	@override String get ellipse => 'Ellipse';
	@override String get equilateral_triangle => 'Triangle équilatéral';
	@override String get kite => 'Cerf-volant';
	@override String get parallelogram => 'Parallélogramme';
	@override String get rectangle => 'Rectangle';
	@override String get rhombus => 'Losange';
	@override String get regular_hexagon => 'Hexagone régulier';
	@override String get regular_octagon => 'Octogone régulier';
	@override String get regular_pentagon => 'Pentagone régulier';
	@override String get regular_polygon => 'Polygone régulier';
	@override String get square => 'Carré';
	@override String get trapezoid => 'Trapèze';
	@override String get triangle => 'Triangle';
}

// Path: tools.areacalculator.inputs
class _TranslationsToolsAreacalculatorInputsFr implements TranslationsToolsAreacalculatorInputsEn {
	_TranslationsToolsAreacalculatorInputsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get radius => 'Rayon';
	@override String get major_axis => 'Grand axe';
	@override String get minor_axis => 'Petit axe';
	@override String get side => 'Côté';
	@override String get base => 'Base';
	@override String get height => 'Hauteur';
	@override String get diagonal_1 => 'Diagonale 1';
	@override String get diagonal_2 => 'Diagonale 2';
	@override String get length => 'Longueur';
	@override String get width => 'Largeur';
	@override String get number_of_sides => 'Nombre de côtés';
	@override String get side_length => 'Longueur du côté';
	@override String get apothem => 'Apotème';
	@override String get base_1 => 'Base 1';
	@override String get base_2 => 'Base 2';
}

// Path: tools.areacalculator.error
class _TranslationsToolsAreacalculatorErrorFr implements TranslationsToolsAreacalculatorErrorEn {
	_TranslationsToolsAreacalculatorErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get invalid_input => 'Entrée invalide';
	@override String get please_enter_a_value_for => 'Veuillez entrer une valeur pour';
	@override String get please_enter_a_valid_number_for => 'Veuillez entrer un nombre valide pour';
	@override String get please_enter_a_positive_number_for => 'Veuillez entrer un nombre positif pour';
	@override String get please_try_again_with_different_values => 'Veuillez réessayer avec des valeurs différentes';
	@override String get the_area_of_the_shape_is_zero => 'L\'aire de la forme est de zéro';
}

// Path: tools.mathtex.error
class _TranslationsToolsMathtexErrorFr implements TranslationsToolsMathtexErrorEn {
	_TranslationsToolsMathtexErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get an_error_occurred_while_rendering_the_mathtex => 'Une erreur s\'est produite lors du rendu de MathTeX';
	@override String get please_wait_until_the_preview_is_loaded => 'Veuillez attendre que l\'aperçu soit chargé';
	@override String get an_error_occurred_while_exporting_the_image => 'Une erreur s\'est produite lors de l\'exportation de l\'image';
	@override String get could_not_open_help_website => 'Impossible d\'ouvrir le site web d\'aide, veuillez vérifier votre configuration et réessayer';
}

// Path: tools.compass.error
class _TranslationsToolsCompassErrorFr implements TranslationsToolsCompassErrorEn {
	_TranslationsToolsCompassErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get please_grant_location_permission => 'Veuillez autoriser la permission de localisation pour utiliser la boussole. Cette autorisation est obligatoire pour accéder aux capteurs de l\'appareil.';
}

// Path: tools.qrcreator.error
class _TranslationsToolsQrcreatorErrorFr implements TranslationsToolsQrcreatorErrorEn {
	_TranslationsToolsQrcreatorErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get failed_to_create_qr_code => 'Échec de la création du QR code, veuillez vérifier votre saisie et réessayer';
}

// Path: tools.pastebin.error
class _TranslationsToolsPastebinErrorFr implements TranslationsToolsPastebinErrorEn {
	_TranslationsToolsPastebinErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get failed_to_obtain_short_link => 'Impossible d\'obtenir un lien court, veuillez vérifier votre connexion internet puis réessayer';
	@override String get impossible_to_connect_to_the_server => 'Impossible de se connecter au serveur';
	@override String get impossible_to_connect_to_the_server_message => 'Échec de la connexion au serveur, veuillez vérifier votre connexion internet et réessayer.';
	@override String get unauthorized => 'Non autorisé. Veuillez vérifier vos identifiants.';
	@override String get invalid_expiration_date => 'La date d\'expiration doit être dans le futur.';
}

// Path: tools.percentagecalculator.error
class _TranslationsToolsPercentagecalculatorErrorFr implements TranslationsToolsPercentagecalculatorErrorEn {
	_TranslationsToolsPercentagecalculatorErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get please_enter_valid_numbers_for_both_fields => 'Veuillez entrer des nombres valides pour les deux champs';
	@override String get total_cannot_be_zero => 'Le total ne peut pas être zéro';
	@override String get first_value_cannot_be_zero => 'La première valeur ne peut pas être zéro';
}

// Path: tools.passwordgenerator.error
class _TranslationsToolsPasswordgeneratorErrorFr implements TranslationsToolsPasswordgeneratorErrorEn {
	_TranslationsToolsPasswordgeneratorErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get password_length_must_be_greater_than_0 => 'La longueur du mot de passe doit être supérieure à 0';
	@override String password_length_cannot_exceed_x_characters({required Object maxLength}) => 'La longueur du mot de passe ne peut pas dépasser ${maxLength} caractères';
	@override String get password_length_cannot_be_less_than_the_sum_of_digits_and_special_characters => 'La longueur du mot de passe ne peut pas être inférieure à la somme du nombre de chiffres et de caractères spéciaux';
}

// Path: tools.portscanner.error
class _TranslationsToolsPortscannerErrorFr implements TranslationsToolsPortscannerErrorEn {
	_TranslationsToolsPortscannerErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get please_enter_a_valid_host => 'Veuillez entrer un hôte valide';
	@override String get please_enter_a_valid_port_number => 'Veuillez saisir un numéro de port valide (1-65535) dans les deux champs';
}

// Path: tools.commons.error
class _TranslationsToolsCommonsErrorFr implements TranslationsToolsCommonsErrorEn {
	_TranslationsToolsCommonsErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String error_downloading_file({required Object errorCode}) => 'Erreur lors du téléchargement du fichier (${errorCode})';
	@override String get error_download_file_check_internet => 'Erreur lors du téléchargement du fichier. Veuillez vérifier votre connexion Internet et réessayer.';
}

// Path: tools.crdeck.error
class _TranslationsToolsCrdeckErrorFr implements TranslationsToolsCrdeckErrorEn {
	_TranslationsToolsCrdeckErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get please_check_your_internet_connection => 'Veuillez vérifier votre connexion internet et réessayer';
	@override String get error_while_loading_cards_from_server => 'Une erreur s\'est produite lors du chargement des cartes de Clash Royale depuis le serveur.\nVeuillez vérifier votre connexion réseau et réessayer.';
	@override String failed_to_load_cards_from_server({required Object errorCode}) => 'Échec du chargement des cartes de Clash Royale depuis le serveur (${errorCode})';
	@override String get invalid_tag => 'Identifiant invalide';
	@override String get please_enter_a_valid_player_tag => 'Veuillez saisir un identifiant de joueur valide';
	@override String failed_to_import_cards_from_player_profile({required Object errorCode}) => 'Échec de l\'importation des cartes depuis le profil du joueur (${errorCode}), vous pouvez toujours importer les cartes manuellement';
	@override String get an_error_occurred_while_importing_cards => 'Une erreur s\'est produite lors de l\'importation des cartes, mais vous pouvez toujours les importer manuellement';
	@override String get not_enough_cards_selected => 'Pas assez de cartes sélectionnées';
	@override String please_select_at_least_x_more_cards({required Object numberOfCards}) => 'Veuillez sélectionner au moins ${numberOfCards} cartes supplémentaires pour créer un deck valide';
	@override String get deck_is_full => 'Deck plein';
	@override String you_can_only_add_up_to_x_cards_to_the_deck({required Object numberOfCards}) => 'Vous ne pouvez ajouter que ${numberOfCards} cartes au deck';
	@override String get card_already_in_deck => 'Carte déjà dans le deck';
	@override String get this_card_is_already_in_the_deck => 'Cette carte est déjà dans le deck';
	@override String get incomplete_deck => 'Deck incomplet';
	@override String please_add_x_more_cards_to_the_deck_before_opening_it_in_clash_royale({required Object numberOfCards}) => 'Veuillez ajouter ${numberOfCards} cartes supplémentaires au deck avant de l\'ouvrir dans Clash Royale';
	@override String please_add_x_more_cards_to_the_deck_before_sharing_it({required Object numberOfCards}) => 'Veuillez ajouter ${numberOfCards} cartes supplémentaires au deck avant de le partager';
}

// Path: tools.iplocation.error
class _TranslationsToolsIplocationErrorFr implements TranslationsToolsIplocationErrorEn {
	_TranslationsToolsIplocationErrorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get ip_required => 'Adresse IP requise';
	@override String get please_enter_an_ip_address => 'Veuillez entrer une adresse IP pour obtenir sa localisation';
	@override String get error_fetching_location => 'Impossible de récupérer la localisation';
	@override String get error_fetching_location_description => 'Il semble qu\'une erreur se soit produite lors de la récupération de la localisation. Vérifiez les informations entrées et votre connexion internet, puis réessayez';
}

/// The flat map containing all translations for locale <fr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		return _flatMapFunction$0(path)
			?? _flatMapFunction$1(path);
	}

	dynamic _flatMapFunction$0(String path) {
		switch (path) {
			case 'generic.app_name': return 'Toolbox';
			case 'generic.tools': return 'Outils';
			case 'generic.categories': return 'Catégories';
			case 'generic.error': return 'Erreur';
			case 'generic.warning': return 'Attention';
			case 'generic.ok': return 'OK';
			case 'generic.cancel': return 'Annuler';
			case 'generic.search': return 'Rechercher';
			case 'generic.enable': return 'Activer';
			case 'generic.reset': return 'Réinitialiser';
			case 'generic.yes': return 'Oui';
			case 'generic.no': return 'Non';
			case 'generic.copy': return 'Copier';
			case 'generic.share': return 'Partager';
			case 'generic.generate': return 'Générer';
			case 'homepage.update_available': return 'Mise à jour disponible';
			case 'homepage.update_available_message': return 'Une nouvelle version de Toolbox est disponible. Mettez à jour dès maintenant pour bénéficier des dernières fonctionnalités et améliorations.';
			case 'homepage.switch_view': return 'Changer de vue';
			case 'homepage.search_all_categories': return 'Rechercher dans toutes les catégories';
			case 'homepage.clear_search': return 'Effacer la recherche';
			case 'homepage.add': return 'Ajouter';
			case 'homepage.remove': return 'Supprimer';
			case 'homepage.favorites': return 'Favoris';
			case 'homepage.would_you_like_to_add_this_tool_to_favorites': return 'Voulez-vous ajouter cet outil aux favoris ?';
			case 'homepage.would_you_like_to_remove_this_tool_from_favorites': return 'Voulez-vous retirer cet outils des favoris ?';
			case 'categories.audio': return 'Audio';
			case 'categories.calculations': return 'Calculs';
			case 'categories.games': return 'Jeux';
			case 'categories.geography': return 'Géographie';
			case 'categories.miscellaneous': return 'Divers';
			case 'categories.network': return 'Réseau';
			case 'categories.random': return 'Aléatoire';
			case 'categories.time': return 'Temps';
			case 'categories.web': return 'Web';
			case 'tools.baseconverter.title': return 'Convertisseur de base';
			case 'tools.baseconverter.input': return 'Valeur d\'entrée';
			case 'tools.baseconverter.results': return 'Résultats';
			case 'tools.baseconverter.enter_a_dec_number': return 'Entrez un nombre décimal';
			case 'tools.baseconverter.enter_a_hex_number': return 'Entrez un nombre hexadécimal';
			case 'tools.baseconverter.enter_a_bin_number': return 'Entrez un nombre binaire';
			case 'tools.baseconverter.enter_a_oct_number': return 'Entrez un nombre octal';
			case 'tools.baseconverter.hexadecimal': return 'Hexadécimal';
			case 'tools.baseconverter.binary': return 'Binaire';
			case 'tools.baseconverter.octal': return 'Octal';
			case 'tools.baseconverter.decimal': return 'Décimal';
			case 'tools.baseconverter.incompatible_number': return 'Nombre incompatible';
			case 'tools.baseconverter.too_big_number': return 'Nombre trop grand';
			case 'tools.baseconverter.the_number_you_entered_is_not_a_valid_x_number': return ({required Object base}) => 'Le nombre que vous avez entré n\'est pas un nombre ${base} valide';
			case 'tools.baseconverter.the_number_you_entered_is_too_big_to_be_abble_to_convert_it': return 'Le nombre que vous avez entré est trop grand pour être converti';
			case 'tools.clock.title': return 'Horloge';
			case 'tools.clock.change_timezone': return 'Changer le fuseau horaire';
			case 'tools.clock.timezone': return 'Fuseau horaire';
			case 'tools.clock.choose_a_timezone': return 'Choisissez un fuseau horaire';
			case 'tools.clock.select_local': return 'Heure locale';
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
			case 'tools.nslookup.not_supported_by_system_dns': return 'Non supporté par le DNS système';
			case 'tools.nslookup.no_records_found': return 'Aucun enregistrement trouvé';
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
			case 'tools.qrreader.copy_password': return 'Copier le MDP';
			case 'tools.qrreader.copy': return 'Copier';
			case 'tools.qrreader.copied_to_clipboard': return 'Copié dans le presse-papiers';
			case 'tools.qrreader.wifi': return 'WiFi';
			case 'tools.qrreader.wifi_ssid': return 'SSID';
			case 'tools.qrreader.wifi_password': return 'Mot de passe';
			case 'tools.qrreader.error.no_qr_code': return 'Aucun code QR';
			case 'tools.qrreader.error.error_no_result': return 'Aucun résultat trouvé';
			case 'tools.timer.title': return 'Minuteur';
			case 'tools.timer.start': return 'Démarrer';
			case 'tools.timer.stop': return 'Arrêter';
			case 'tools.timer.pause': return 'Pause';
			case 'tools.timer.please_stop_the_timer_first': return 'Veuillez d\'abord arrêter le minuteur';
			case 'tools.timer.ios_warning_message': return 'Pour que le minuteur sonne sur iOS, vous ne devez pas quitter l\'application ni éteindre l\'écran de votre iPhone. Sinon, iOS empêchera le minuteur de sonner lorsqu\'il atteindra zéro.';
			case 'tools.timer.adjust_time': return 'Ajuster le temps';
			case 'tools.stopwatch.title': return 'Chronomètre';
			case 'tools.stopwatch.controls': return 'Contrôles';
			case 'tools.stopwatch.start': return 'Go';
			case 'tools.stopwatch.stop': return 'Stop';
			case 'tools.stopwatch.reset': return 'Effacer';
			case 'tools.stopwatch.laps': return 'Tours';
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
			case 'tools.flipcoins.change_coin_currency': return 'Changer la devise de la pièce';
			case 'tools.randomnumber.title': return 'Nombre aléatoire';
			case 'tools.randomnumber.settings': return 'Paramètres';
			case 'tools.randomnumber.min': return 'Min';
			case 'tools.randomnumber.max': return 'Max';
			case 'tools.randomnumber.error.invalid_number': return 'Nombre invalide, veuillez réessayer.';
			case 'tools.randomnumber.error.min_must_be_lower_than_max': return 'Le nombre minimum doit être inférieur au nombre maximum.';
			case 'tools.randomnumber.error.min_and_max_must_be_between_x_and_y': return ({required Object minNumberLimit, required Object maxNumberLimit}) => 'Les nombres minimum et maximum doivent être compris entre ${minNumberLimit} et ${maxNumberLimit}.';
			case 'tools.randomcolor.title': return 'Couleur aléatoire';
			case 'tools.randomcolor.hint': return 'Touchez la couleur pour la changer';
			case 'tools.randomcolor.tap_to_copy': return 'Cliquez pour copier';
			case 'tools.randomcolor.copied_to_clipboard': return 'Copié dans le presse-papier';
			case 'tools.sshclient.title': return 'Client SSH';
			case 'tools.sshclient.backspace': return 'Effacer';
			case 'tools.sshclient.use_password': return 'Utiliser un mot de passe';
			case 'tools.sshclient.use_ssh_key': return 'Utiliser une clé SSH';
			case 'tools.sshclient.connection': return 'Connexion';
			case 'tools.sshclient.host': return 'Hôte';
			case 'tools.sshclient.port': return 'Port';
			case 'tools.sshclient.username': return 'Nom d\'utilisateur';
			case 'tools.sshclient.password': return 'Mot de passe';
			case 'tools.sshclient.connect': return 'Se connecter';
			case 'tools.sshclient.ssh_key': return 'Clé SSH';
			case 'tools.sshclient.authentication': return 'Authentification';
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
			case 'tools.whiteboard.share_success': return 'Votre tableau blanc a été partagé avec succès';
			case 'tools.whiteboard.save_success': return 'Votre tableau blanc a été enregistré avec succès';
			case 'tools.networkinfo.title': return 'Informations réseau';
			case 'tools.networkinfo.loading': return 'Chargement...';
			case 'tools.networkinfo.unknown': return 'Inconnu';
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
			case 'tools.uuidgenerator.tap_to_copy': return 'Cliquez pour copier';
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
			case 'tools.nearbypublictransportstops.loading': return 'Chargement...';
			case 'tools.nearbypublictransportstops.refresh': return 'Rafraîchir';
			case 'tools.nearbypublictransportstops.data_source': return 'Source des données';
			case 'tools.nearbypublictransportstops.initial_dialog_title': return 'Information';
			case 'tools.nearbypublictransportstops.initial_dialog_message': return ({required Object source}) => 'Cet outil est destiné à être utilisé en Suisse. Il utilise les données de "${source}"';
			case 'tools.nearbypublictransportstops.data_license_dialog_open': return 'Ouvrir';
			case 'tools.nearbypublictransportstops.data_license_dialog_title': return 'Source des données';
			case 'tools.nearbypublictransportstops.data_license_dialog_message': return ({required Object source, required Object url}) => 'Les données utilisées dans cet outil proviennent de "${source}".\n${url}';
			case 'tools.nearbypublictransportstops.no_departures': return 'Aucun départ';
			case 'tools.nearbypublictransportstops.departure': return 'Départ';
			case 'tools.nearbypublictransportstops.arrival': return 'Arrivée';
			case 'tools.nearbypublictransportstops.platform': return 'Voie';
			case 'tools.nearbypublictransportstops.show_on_map': return 'Plan';
			case 'tools.nearbypublictransportstops.map_marker_title': return 'Arrêt de transport';
			case 'tools.nearbypublictransportstops.error.location_permission_denied': return 'La permission de localisation a été refusée ou désactivée, veuillez l\'activer dans les paramètres afin de voir les arrêts de transport public à proximité.';
			case 'tools.nearbypublictransportstops.error.check_internet_connection': return 'Vérifiez votre connexion internet et réessayez.';
			case 'tools.nearbypublictransportstops.error.api_empty_response': return 'L\'API a renvoyé une réponse vide';
			case 'tools.nearbypublictransportstops.error.api_error_xxx': return ({required Object errorCode}) => 'L\'API a renvoyé une erreur ${errorCode}';
			case 'tools.nearbypublictransportstops.error.no_stops_found': return 'Aucun arrêt trouvé avec cette recherche';
			case 'tools.nearbypublictransportstops.error.no_maps_app': return 'Aucune application de cartographie n\'est installée sur votre appareil';
			case 'tools.fileencryption.title': return 'Chiffrement de fichiers';
			case 'tools.fileencryption.home_hint': return 'Choisissez un fichier pour le chiffrer. Si vous souhaitez déchiffrer un fichier, choisissez un fichier chiffré ayant l\'extension .aes.';
			case 'tools.fileencryption.no_file_selected': return 'Aucun fichier sélectionné';
			case 'tools.fileencryption.enter_password': return 'Veuillez entrer un mot de passe';
			case 'tools.fileencryption.file_saved_successfully': return 'Fichier enregistré avec succès';
			case 'tools.fileencryption.pick_a_file': return 'Choisir un fichier';
			case 'tools.fileencryption.encryption_password': return 'Mot de passe de chiffrement';
			case 'tools.fileencryption.encrypt': return 'Chiffrer';
			case 'tools.fileencryption.decrypt': return 'Déchiffrer';
			case 'tools.fileencryption.error.failed_to_read_file': return 'Échec de la lecture du fichier';
			case 'tools.fileencryption.error.failed_to_decrypt_file': return 'Échec de déchiffrement du fichier, veuillez vérifier le mot de passe';
			case 'tools.fileencryption.error.please_enter_a_password': return 'Veuillez entrer un mot de passe';
			case 'tools.fileencryption.enter_password_hint': return 'Entrez le mot de passe...';
			case 'tools.fileencryption.file_selection': return 'Sélection de fichier';
			case 'tools.youtubethumbnail.title': return 'Miniature YouTube';
			case 'tools.youtubethumbnail.saved': return 'Miniature enregistrée avec succès';
			case 'tools.youtubethumbnail.youtube_video_id': return 'URL de la vidéo YouTube';
			case 'tools.youtubethumbnail.save_thumbnail': return 'Enregistrer la miniature';
			case 'tools.youtubethumbnail.please_enter_a_video_url': return 'Veuillez entrer l\'URL (ou l\'ID) d\'une vidéo YouTube afin de télécharger sa miniature';
			case 'tools.youtubethumbnail.error.failed_to_download': return 'Impossible de télécharger la miniature depuis YouTube';
			case 'tools.youtubethumbnail.error.please_enter_a_valid_video_id': return 'Veuillez saisir l\'URL d\'une vidéo YouTube valide\nVous avez également besoin d\'une connexion internet pour télécharger la miniature à partir de YouTube';
			case 'tools.youtubethumbnail.thumbnail_preview': return 'Aperçu de la miniature';
			case 'tools.nationalanthems.title': return 'Hymnes nationaux';
			case 'tools.nationalanthems.stop': return 'Arrêter l\'hymne';
			case 'tools.nationalanthems.search': return 'Rechercher (en anglais)';
			case 'tools.nationalanthems.license': return 'Licence';
			case 'tools.nationalanthems.license_text': return ({required Object source, required Object license}) => 'Les fichiers audio sont fournis par "${source}" sous la licence ${license}';
			case 'tools.nationalanthems.open': return 'Ouvrir';
			case 'tools.nationalanthems.view_license': return 'Voir la licence';
			case 'tools.nationalanthems.loading_audio_title': return 'Chargement';
			case 'tools.nationalanthems.loading_audio_text': return 'Chargement de l\'hymne en cours...';
			case 'tools.nationalanthems.error.failed_to_load_list': return 'Impossible de charger la liste des hymnes. Veuillez vérifier votre connexion internet et réessayer.';
			case 'tools.nationalanthems.error.failed_to_play_anthem': return 'Impossible de jouer l\'hymne. Veuillez vérifier votre connexion internet et réessayer.';
			case 'tools.nationalanthems.no_anthems_found': return 'Aucun hymne trouvé';
			case 'tools.httprequest.title': return 'Requête HTTP';
			case 'tools.httprequest.method': return 'Méthode';
			case 'tools.httprequest.custom_method': return 'Méthode personnalisée';
			case 'tools.httprequest.url': return 'URL';
			case 'tools.httprequest.headers': return 'En-têtes (headers)';
			case 'tools.httprequest.body': return 'Corps (body)';
			case 'tools.httprequest.allow_bad_certificates': return 'Autoriser les certificats non valides';
			case 'tools.httprequest.allow_bad_certificates_description': return 'L\'activation de cette option permet à l\'outil "Requête HTTP" d\'envoyer des requêtes HTTPS à des serveurs disposant de certificats SSL/TLS invalides, expirés ou auto-signés. Cela désactive d\'importants contrôles de sécurité et peut exposer vos données à l\'interception ou à la falsification par des tiers. N\'utilisez cette fonction que si vous comprenez parfaitement les risques encourus, et uniquement lorsque vous envoyez des requêtes à des serveurs que vous contrôlez et en lesquels vous avez confiance. Son utilisation générale n\'est pas recommandée. Veuillez considérer les requêtes effectuées avec cette option activée comme des requêtes non chiffrées (telles que HTTP) pouvant être manipulées et consultées par des tiers.';
			case 'tools.httprequest.i_know_what_i_am_doing': return 'Je sais ce que je fais';
			case 'tools.httprequest.send_request': return 'Envoyer la requête';
			case 'tools.httprequest.response': return 'Réponse';
			case 'tools.httprequest.render_html': return 'Rendre le HTML';
			case 'tools.httprequest.back_to_details': return 'Retour aux détails';
			case 'tools.httprequest.status_code': return 'Code d\'état';
			case 'tools.httprequest.error.url_cannot_be_empty': return 'L\'URL ne peut pas être vide';
			case 'tools.httprequest.error.invalid_url': return 'URL invalide';
			case 'tools.httprequest.error.invalid_headers': return 'En-têtes invalides';
			case 'tools.httprequest.error.timeout': return 'La requête a dépassé le temps de réponse.\nVeuillez vérifier votre saisie et votre connexion internet, puis réessayez.';
			case 'tools.httprequest.error.other_error': return 'Une erreur s\'est produite lors de l\'envoi de la requête.\nVeuillez vérifier votre saisie et votre connexion internet, puis réessayez.';
			case 'tools.httprequest.example_headers': return 'cle1: valeur1\ncle2: valeur2';
			case 'tools.httprequest.request_body_hint': return 'Corps de la requête (JSON, XML, etc.)';
			case 'tools.morsecode.title': return 'Code morse';
			case 'tools.morsecode.alphabet_field': return 'Alphabet (A-Z, 0-9)';
			case 'tools.morsecode.morse_field': return 'Code Morse (. and -)';
			case 'tools.morsecode.note_spaces': return 'Note : Utilisez 1 espace entre les lettres et 3 espaces entre les mots.';
			case 'tools.morsecode.alphabet_to_morse': return 'Alphabet vers morse';
			case 'tools.morsecode.morse_to_alphabet': return 'Morse vers alphabet';
			case 'tools.morsecode.play_audio': return 'Écouter l\'audio';
			case 'tools.morsecode.playing': return 'Lecture en cours...';
			case 'tools.morsecode.enter_text': return 'Entrez le texte ici...';
			case 'tools.osm.title': return 'Plan (OSM)';
			case 'tools.osm.go_to_my_location': return 'Aller à ma position';
			case 'tools.osm.loading_map': return 'Chargement de la carte...';
			case 'tools.osm.error.location_permission_denied': return 'Vous devez autoriser l\'accès à la position pour utiliser cette fonction';
			case 'tools.osm.error.location_services_disabled': return 'Les services de position sont désactivés';
			case 'tools.gameoflife.title': return 'Jeu de la vie';
			case 'tools.gameoflife.grid_size': return 'Taille de la grille';
			case 'tools.gameoflife.current_size_is_x': return ({required Object size}) => 'La taille actuelle est ${size}';
			case 'tools.gameoflife.waiting': return 'Attente';
			case 'tools.gameoflife.stop_simulation': return 'Arrêter la simulation';
			case 'tools.gameoflife.start_simulation': return 'Démarrer la simulation';
			case 'tools.gameoflife.randomize_grid': return 'Randomiser la grille';
			case 'tools.gameoflife.clear_grid': return 'Effacer la grille';
			case 'tools.gameoflife.error.no_alive_cells': return 'Pas de cellules vivantes';
			case 'tools.gameoflife.error.no_alive_cells_description': return 'Il n\'y a pas de cellules vivantes.\nVeuillez toucher la grille pour en ajouter.';
			case 'tools.gameoflife.error.please_stop_simulation': return 'Veuillez d\'abord arrêter la simulation';
			case 'tools.speedometer.title': return 'Compteur de vitesse';
			case 'tools.speedometer.reset': return 'Réinitialiser';
			case 'tools.speedometer.about_traveled_distance_title': return 'À propos de la distance parcourue';
			case 'tools.speedometer.about_traveled_distance_description': return 'La distance parcourue est calculée à partir de la vitesse détectée par le GPS.\nCela signifie que la distance n\'est pas exacte à 100%.';
			case 'tools.speedometer.kmh': return 'km/h';
			case 'tools.speedometer.km': return 'km';
			case 'tools.speedometer.mph': return 'mph';
			case 'tools.speedometer.mi': return 'mi';
			case 'tools.speedometer.change_speed_unit': return 'Changer d\'unité de vitesse';
			case 'tools.speedometer.change_speed_unit_description': return 'Choisissez l\'unité de vitesse que vous souhaitez utiliser avec le compteur de vitesse';
			case 'tools.speedometer.traveled_distance': return 'Distance parcourue';
			case 'tools.speedometer.error.location_permission_denied_title': return 'Position requise';
			case 'tools.speedometer.error.location_permission_denied_description': return 'Cet outil nécessite l\'accès à la position pour déterminer votre vitesse.';
			case 'tools.speedometer.error.location_services_disabled_title': return 'Services de position désactivés';
			case 'tools.speedometer.error.location_services_disabled_description': return 'Cet outil nécessite que les services de localisation soient activés pour déterminer votre vitesse.';
			case 'tools.mc_server_ping.title': return 'Ping serveur MC';
			case 'tools.mc_server_ping.java_edition': return 'Édition Java';
			case 'tools.mc_server_ping.information_java': return 'Information';
			case 'tools.mc_server_ping.information_java_description': return 'Cochez cette case si le serveur est disponible pour l\'édition Java de Minecraft. Si ce n\'est pas le cas, décochez-la et l\'outil utilisera l\'API de l\'édition Bedrock.';
			case 'tools.mc_server_ping.server_ip': return 'IP ou domaine du serveur Minecraft';
			case 'tools.mc_server_ping.ping': return 'Ping';
			case 'tools.mc_server_ping.ping_another_server': return 'Ping un autre serveur';
			case 'tools.mc_server_ping.api_used': return 'API utilisée';
			case 'tools.mc_server_ping.about_the_api': return 'À propos de l\'API';
			case 'tools.mc_server_ping.about_the_api_description': return ({required Object source, required Object website}) => 'Cet outil utilise "${source}" du site "${website}" pour ping les serveurs Minecraft';
			case 'tools.mc_server_ping.about_open': return 'Ouvrir';
			case 'tools.mc_server_ping.the_server_id_is': return ({required Object id}) => 'L\'ID du serveur est "${id}"';
			case 'tools.mc_server_ping.x_y_players_online': return ({required Object playersOnline, required Object playersMax}) => '${playersOnline}/${playersMax} joueur(s) en ligne';
			case 'tools.mc_server_ping.added_to_favorites': return 'Ajouté aux favoris';
			case 'tools.mc_server_ping.added_to_favorites_description': return 'Le serveur a été ajouté aux favoris';
			case 'tools.mc_server_ping.removed_from_favorites': return 'Retiré des favoris';
			case 'tools.mc_server_ping.removed_from_favorites_description': return 'Le serveur a été retiré des favoris';
			case 'tools.mc_server_ping.add_to_favorites': return 'Ajouter aux favoris';
			case 'tools.mc_server_ping.remove_from_favorites': return 'Retirer des favoris';
			case 'tools.mc_server_ping.remove_from_favorites_description': return 'Êtes-vous sûr de vouloir retirer ce serveur de vos favoris ?';
			case 'tools.mc_server_ping.from_favorites': return 'Depuis les favoris';
			case 'tools.mc_server_ping.pick_from_favorites': return 'Choisir depuis les favoris';
			case 'tools.mc_server_ping.no_favorites': return 'Aucun favori';
			case 'tools.mc_server_ping.no_favorites_description': return 'Vous n\'avez pas encore ajouté de serveurs aux favoris.';
			case 'tools.mc_server_ping.online_players': return 'Joueur(s) en ligne';
			case 'tools.mc_server_ping.online_players_description_no_players_to_show': return 'Le serveur a des joueurs en ligne, mais aucun nom de joueur n\'est visible';
			case 'tools.mc_server_ping.error.please_enter_a_server_ip': return 'Veuillez entrer une adresse IP ou un nom de domaine valide';
			case 'tools.mc_server_ping.error.server_offline_or_does_not_exist': return 'Le serveur est hors ligne ou n\'existe pas';
			case 'tools.mc_server_ping.error.please_check_your_internet_connection': return 'Veuillez vérifier votre connexion internet et réessayer';
			case 'tools.mc_server_ping.server_id': return 'ID du serveur';
			case 'tools.mc_server_ping.server_info': return 'Infos du serveur';
			case 'tools.timestampconverter.title': return 'Convertisseur de timestamp';
			case 'tools.timestampconverter.now_tooltip': return 'Maintenant';
			case 'tools.timestampconverter.utc': return 'UTC';
			case 'tools.timestampconverter.local': return 'Local';
			case 'tools.timestampconverter.local_or_utc_dialog_title': return 'Local ou UTC';
			case 'tools.timestampconverter.local_or_utc_dialog_message': return 'Allez-vous selectionner une date et une heure locale ou UTC ?';
			case 'tools.timestampconverter.unix_timestamp': return 'Timestamp Unix';
			case 'tools.timestampconverter.convert_timestamp_to_date': return 'Convertir le timestamp en date';
			case 'tools.timestampconverter.tap_the_date_to_change_it': return 'Appuyez sur la date pour la modifier';
			case 'tools.timestampconverter.select_seconds': return 'Sélectionner les secondes';
			case 'tools.timestampconverter.error.invalid_timestamp': return 'Timestamp invalide';
			case 'tools.timestampconverter.convert': return 'Convertir';
			case 'tools.urlshortener.title': return 'Raccourcisseur d\'URL';
			case 'tools.urlshortener.url': return 'L\'URL';
			case 'tools.urlshortener.qr_code': return 'Le code QR';
			case 'tools.urlshortener.share': return 'Partager';
			case 'tools.urlshortener.share_dialog_message': return 'Que souhaitez-vous partager ?';
			case 'tools.urlshortener.your_shortened_url_is': return 'Votre URL raccourcie est';
			case 'tools.urlshortener.copy_to_clipboard': return 'Copier dans le presse-papiers';
			case 'tools.urlshortener.the_link_id_is': return 'L\'ID du lien est';
			case 'tools.urlshortener.link_id_copied_to_clipboard': return 'ID du lien copié dans le presse-papiers';
			case 'tools.urlshortener.the_link_password_is': return 'Le mot de passe du lien est';
			case 'tools.urlshortener.link_password_copied_to_clipboard': return 'Mot de passe du lien copié dans le presse-papiers';
			case 'tools.urlshortener.link_password_hint_text': return 'Tapez le mot de passe pour le copier\nVous en aurez besoin pour voir les statistiques de ce lien';
			case 'tools.urlshortener.shorten_another_url': return 'Raccourcir une autre URL';
			case 'tools.urlshortener.url_to_shorten': return 'URL à raccourcir';
			case 'tools.urlshortener.by_clicking_you_accept': return ({required Object url}) => 'En cliquant sur le bouton « raccourcir », vous acceptez les conditions d\'utilisation de "${url}" disponibles via le lien ci-dessous.';
			case 'tools.urlshortener.terms_of_service': return 'Conditions d\'utilisation (ToS)';
			case 'tools.urlshortener.shorten': return 'Raccourcir';
			case 'tools.urlshortener.more_features': return 'Plus de fonctionnalités';
			case 'tools.urlshortener.more_features_message': return 'Utiliser des fonctions supplémentaires telles que le partage de texte, le profil link-in-bio, et plus via le site officiel JTU.ME';
			case 'tools.urlshortener.open': return 'Ouvrir';
			case 'tools.urlshortener.options': return 'Options (optionnel)';
			case 'tools.urlshortener.access_password': return 'Mot de passe d\'accès';
			case 'tools.urlshortener.expiration_date': return 'Date d\'expiration (UTC)';
			case 'tools.urlshortener.use_my_account': return 'Utiliser mon compte';
			case 'tools.urlshortener.email': return 'Email';
			case 'tools.urlshortener.password': return 'Mot de passe';
			case 'tools.urlshortener.no_account': return 'Pas de compte ?';
			case 'tools.urlshortener.no_account_message': return 'Vous pouvez créer un compte gratuit sur le site officiel de JTU.ME';
			case 'tools.urlshortener.error.failed_to_shorten_url': return 'Le raccourcissement de l\'URL a échoué, veuillez vérifier votre saisie et votre connexion internet.';
			case 'tools.urlshortener.error.impossible_to_connect_to_the_server': return 'Impossible de se connecter au serveur';
			case 'tools.urlshortener.error.impossible_to_connect_to_the_server_message': return 'Échec de la connexion au serveur, veuillez vérifier votre connexion internet et réessayer.';
			case 'tools.urlshortener.error.unauthorized': return 'Non autorisé. Veuillez vérifier vos identifiants.';
			case 'tools.urlshortener.error.invalid_expiration_date': return 'La date d\'expiration doit être dans le futur.';
			case 'tools.urlshortener.management_info': return 'Infos de gestion';
			case 'tools.urlshortener.manage_with_account': return 'Pour consulter les statistiques et gérer ce lien, utilisez votre compte JTU.ME sur le site officiel';
			case 'tools.counter.title': return 'Compteur';
			case 'tools.counter.add_button': return 'Ajouter un bouton';
			case 'tools.counter.remove_button': return 'Supprimer un bouton';
			case 'tools.counter.enter_number': return 'Entrez un nombre';
			case 'tools.counter.error.invalid_number': return 'Le nombre que vous avez entré n\'est pas valide';
			case 'tools.counter.error.the_number_must_be_between_x_and_y': return ({required Object minNumberLimit, required Object maxNumberLimit}) => 'Le nombre doit être compris entre ${minNumberLimit} et ${maxNumberLimit}';
			case 'tools.counter.error.you_must_have_at_least_one_button': return 'Vous devez avoir au moins un bouton';
			case 'tools.counter.error.this_button_already_exists': return 'Ce bouton existe déjà';
			case 'tools.bitwisecalculator.title': return 'Calculatrice binaire';
			case 'tools.bitwisecalculator.binary_values': return 'Valeurs binaires';
			case 'tools.bitwisecalculator.first_number': return 'Premier nombre';
			case 'tools.bitwisecalculator.second_number': return 'Deuxième nombre';
			case 'tools.bitwisecalculator.enter_a_binary_number': return 'Entrez un nombre binaire';
			case 'tools.bitwisecalculator.operations': return 'Opérations';
			case 'tools.bitwisecalculator.and': return 'ET';
			case 'tools.bitwisecalculator.or': return 'OU';
			case 'tools.bitwisecalculator.xor': return 'OU exclusif';
			case 'tools.bitwisecalculator.result': return 'Résultat';
			case 'tools.bitwisecalculator.error.invalid_input': return 'Saisie invalide';
			case 'tools.musicsearch.title': return 'Recherche de musique';
			case 'tools.musicsearch.unknown_title': return 'Titre inconnu';
			case 'tools.musicsearch.unknown_artist': return 'Artiste inconnu';
			case 'tools.musicsearch.unknown_album': return 'Album inconnu';
			case 'tools.musicsearch.loading': return 'Chargement';
			case 'tools.musicsearch.loading_audio_preview': return 'Chargement de l\'échantillon audio...';
			case 'tools.musicsearch.stop_audio_preview': return 'Arrêter l\'échantillon audio';
			case 'tools.musicsearch.data_source': return 'Source des données';
			case 'tools.musicsearch.this_tool_uses_the_x_api': return ({required Object service}) => 'Cet outil utilise l\'API "${service}" pour rechercher de la musique.\nLes échantillons audio sont fournis par "${service}".';
			case 'tools.musicsearch.go_to_x': return ({required Object service}) => 'Aller sur ${service}';
			case 'tools.musicsearch.search_for_music': return 'Rechercher de la musique';
			case 'tools.musicsearch.use_the_searchbar_to_search_music': return ({required Object service}) => 'Utilisez la barre de recherche pour trouver de la musique.\nSi votre recherche ne donne aucun résultat, essayez un autre terme de recherche.\nSi vous n\'obtenez toujours aucun résultat, vérifiez que votre connexion internet fonctionne correctement et que ${service} est disponible dans votre pays ou région.';
			case 'tools.musicsearch.open_in_x': return ({required Object service}) => 'Ouvrir dans ${service}';
			case 'tools.musicsearch.play_preview': return 'Lire l\'échantillon';
			case 'tools.musicsearch.error.error_playing_audio_preview': return 'Erreur lors de la lecture de l\'échantillon audio. Veuillez réessayer plus tard.';
			case 'tools.musicsearch.error.unable_to_connect_to_the_api': return 'Impossible de se connecter à l\'API, veuillez vérifier votre connexion internet et réessayer.';
			case 'tools.musicanalyser.title': return 'Analyse de musique';
			case 'tools.musicanalyser.press_the_button_to_start_music_analysis': return 'Appuyez sur le bouton pour démarrer l\'analyse de la musique';
			case 'tools.musicanalyser.loading': return 'Chargement...';
			case 'tools.musicanalyser.analyzing_music': return ({required Object remainingSeconds}) => 'Analyse de la musique... (${remainingSeconds}s)';
			case 'tools.musicanalyser.getting_results': return 'Récupération des résultats...';
			case 'tools.musicanalyser.unknown': return 'Inconnu';
			case 'tools.musicanalyser.api_used': return 'API utilisée';
			case 'tools.musicanalyser.this_tool_uses_the_x_api': return ({required Object service, required Object company}) => 'Cet outil utilise l\'API "${service}" via un serveur backend de Koizeay. "${service}" est une marque déposée de "${company}" et n\'est pas affiliée à cet outil.';
			case 'tools.musicanalyser.start_analyzing_music': return 'Démarrer l\'analyse de la musique';
			case 'tools.musicanalyser.clear': return 'Effacer';
			case 'tools.musicanalyser.error.permission_denied': return 'Permission refusée';
			case 'tools.musicanalyser.error.permission_denied_description': return 'L\'autorisation du microphone est nécessaire pour analyser la musique. Veuillez accorder cette autorisation et réessayer.';
			case 'tools.musicanalyser.error.no_match_found': return 'Aucune correspondance trouvée';
			case 'tools.musicanalyser.error.no_match_found_description': return 'Aucune correspondance musicale n\'a été trouvée. Veuillez réessayer.';
			case 'tools.musicanalyser.error.error_occurred': return 'Une erreur s\'est produite lors de l\'analyse de la musique. Veuillez vérifier votre connexion internet et réessayer.';
			case 'tools.musicanalyser.error.please_update_the_app_and_try_again': return 'Veuillez mettre à jour l\'application et réessayer. Si le problème persiste avec la dernière version, réessayez plus tard.';
			case 'tools.textdifferences.title': return 'Différences de texte';
			case 'tools.textdifferences.old_text': return 'Ancien texte';
			case 'tools.textdifferences.new_text': return 'Nouveau texte';
			case 'tools.textdifferences.no_text_hint': return 'Entrez du texte ci-dessus pour voir les différences';
			case 'tools.textdifferences.enter_old_text': return 'Entrez l\'ancien texte...';
			case 'tools.textdifferences.enter_new_text': return 'Entrez le nouveau texte...';
			case 'tools.characterscopy.title': return 'Copie de caractères';
			case 'tools.characterscopy.important': return 'Important';
			case 'tools.characterscopy.important_description': return 'Certains caractères peuvent ne pas s\'afficher correctement sur tous les appareils en fonction de votre système d\'exploitation. De même, certains caractères peuvent ne pas être pris en charge par toutes les applications et polices. Cliquez simplement sur le caractère que vous souhaitez copier et il sera copié dans votre presse-papiers.';
			case 'tools.characterscopy.copied_to_clipboard': return 'Copié dans le presse-papiers';
			case 'tools.whoisdomain.title': return 'Whois de domaine';
			case 'tools.whoisdomain.domain_name': return 'Nom de domaine';
			case 'tools.whoisdomain.whois_lookup': return 'Recherche Whois';
			case 'tools.whoisdomain.disclaimer': return 'Avertissement';
			case 'tools.whoisdomain.disclaimer_text': return 'Toolbox fournit une fonction de recherche WHOIS à des fins d\'information uniquement. Les données récupérées peuvent ne pas être exactes, complètes ou à jour, et sont soumises aux conditions générales des registres de domaines respectifs. Il est interdit aux utilisateurs d\'utiliser les données WHOIS à des fins de spam, à des fins illégales ou de collecter des données de manière automatisée. En utilisant cet outil, vous acceptez de vous conformer aux lois applicables et aux conditions de service du registre. Toolbox et/ou Koizeay n\'assument aucune responsabilité en cas d\'erreurs, d\'omissions ou d\'utilisation abusive des données. Veuillez noter que certains TLD peuvent ne pas être pris en charge par cet outil.';
			case 'tools.whoisdomain.loading': return 'Chargement...';
			case 'tools.whoisdomain.ip_address_not_supported': return 'Adresse IP non prise en charge';
			case 'tools.whoisdomain.ip_address_not_supported_description': return 'Cet outil supporte uniquement les recherches de domaine, pas les recherches d\'adresse IP';
			case 'tools.whoisdomain.no_result': return 'Aucun résultat valide trouvé';
			case 'tools.whoisdomain.view_pretty': return 'Vue formatée';
			case 'tools.whoisdomain.view_raw': return 'Vue brute';
			case 'tools.whoisdomain.raw_whois_data': return 'Données WHOIS brutes';
			case 'tools.whoisdomain.domain': return 'Domaine';
			case 'tools.whoisdomain.registrar': return 'Registrar';
			case 'tools.whoisdomain.dates': return 'Dates';
			case 'tools.whoisdomain.status': return 'Statut';
			case 'tools.whoisdomain.name_servers': return 'Serveurs de noms';
			case 'tools.whoisdomain.contact': return 'Contact';
			case 'tools.whoisdomain.other': return 'Autre';
			case 'tools.whoisdomain.error.impossible_to_get_whois_information': return 'Impossible d\'obtenir les informations whois, veuillez vérifier votre saisie et votre connexion internet puis réessayez';
			case 'tools.textcounter.title': return 'Compteur de texte';
			case 'tools.textcounter.clear': return 'Effacer';
			case 'tools.textcounter.enter_text_here': return 'Entrez du texte';
			case 'tools.textcounter.length': return 'Longueur';
			case 'tools.textcounter.trimmed_length': return 'Longueur tronquée';
			case 'tools.textcounter.raw_length': return 'Longueur brute';
			case 'tools.textcounter.letters': return 'Lettres';
			case 'tools.textcounter.words': return 'Mots';
			case 'tools.textcounter.spaces': return 'Espaces';
			case 'tools.textcounter.digits': return 'Chiffres';
			case 'tools.textcounter.lines': return 'Lignes';
			case 'tools.textcounter.empty_lines': return 'Lignes vides';
			case 'tools.textcounter.total_lines': return 'Total de lignes';
			case 'tools.textcounter.text_input': return 'Saisie de texte';
			case 'tools.romannumeral.title': return 'Chiffres romains';
			case 'tools.romannumeral.change_to': return 'Passer en';
			case 'tools.romannumeral.roman_numeral': return 'chiffre romain';
			case 'tools.romannumeral.number': return 'nombre';
			case 'tools.romannumeral.number_input_hint': return 'Nombre';
			case 'tools.romannumeral.roman_numeral_input_hint': return 'Chiffre romains';
			case 'tools.romannumeral.tap_to_copy': return 'Cliquez pour copier';
			case 'tools.romannumeral.copied_to_clipboard': return 'Copié dans le presse-papiers';
			case 'tools.romannumeral.error.invalid_roman_numeral': return 'Chiffre romain invalide ou non pris en charge';
			case 'tools.areacalculator.title': return 'Calculateur d\'aire';
			case 'tools.areacalculator.select_a_shape': return 'Sélectionnez une forme';
			case 'tools.areacalculator.values': return 'Valeurs';
			case 'tools.areacalculator.area': return 'Aire';
			case 'tools.areacalculator.calculate': return 'Calculer';
			case 'tools.areacalculator.shapes.circle': return 'Cercle';
			case 'tools.areacalculator.shapes.ellipse': return 'Ellipse';
			case 'tools.areacalculator.shapes.equilateral_triangle': return 'Triangle équilatéral';
			case 'tools.areacalculator.shapes.kite': return 'Cerf-volant';
			case 'tools.areacalculator.shapes.parallelogram': return 'Parallélogramme';
			case 'tools.areacalculator.shapes.rectangle': return 'Rectangle';
			case 'tools.areacalculator.shapes.rhombus': return 'Losange';
			case 'tools.areacalculator.shapes.regular_hexagon': return 'Hexagone régulier';
			case 'tools.areacalculator.shapes.regular_octagon': return 'Octogone régulier';
			case 'tools.areacalculator.shapes.regular_pentagon': return 'Pentagone régulier';
			case 'tools.areacalculator.shapes.regular_polygon': return 'Polygone régulier';
			case 'tools.areacalculator.shapes.square': return 'Carré';
			case 'tools.areacalculator.shapes.trapezoid': return 'Trapèze';
			case 'tools.areacalculator.shapes.triangle': return 'Triangle';
			case 'tools.areacalculator.inputs.radius': return 'Rayon';
			case 'tools.areacalculator.inputs.major_axis': return 'Grand axe';
			case 'tools.areacalculator.inputs.minor_axis': return 'Petit axe';
			case 'tools.areacalculator.inputs.side': return 'Côté';
			default: return null;
		}
	}

	dynamic _flatMapFunction$1(String path) {
		switch (path) {
			case 'tools.areacalculator.inputs.base': return 'Base';
			case 'tools.areacalculator.inputs.height': return 'Hauteur';
			case 'tools.areacalculator.inputs.diagonal_1': return 'Diagonale 1';
			case 'tools.areacalculator.inputs.diagonal_2': return 'Diagonale 2';
			case 'tools.areacalculator.inputs.length': return 'Longueur';
			case 'tools.areacalculator.inputs.width': return 'Largeur';
			case 'tools.areacalculator.inputs.number_of_sides': return 'Nombre de côtés';
			case 'tools.areacalculator.inputs.side_length': return 'Longueur du côté';
			case 'tools.areacalculator.inputs.apothem': return 'Apotème';
			case 'tools.areacalculator.inputs.base_1': return 'Base 1';
			case 'tools.areacalculator.inputs.base_2': return 'Base 2';
			case 'tools.areacalculator.error.invalid_input': return 'Entrée invalide';
			case 'tools.areacalculator.error.please_enter_a_value_for': return 'Veuillez entrer une valeur pour';
			case 'tools.areacalculator.error.please_enter_a_valid_number_for': return 'Veuillez entrer un nombre valide pour';
			case 'tools.areacalculator.error.please_enter_a_positive_number_for': return 'Veuillez entrer un nombre positif pour';
			case 'tools.areacalculator.error.please_try_again_with_different_values': return 'Veuillez réessayer avec des valeurs différentes';
			case 'tools.areacalculator.error.the_area_of_the_shape_is_zero': return 'L\'aire de la forme est de zéro';
			case 'tools.mathtex.title': return 'MathTeX';
			case 'tools.mathtex.enter_a_mathematical_expression_in_tex_format': return 'Entrez une expression mathématique au format TeX';
			case 'tools.mathtex.texExpression': return 'Expression TeX';
			case 'tools.mathtex.export_to_image': return 'Exporter en image';
			case 'tools.mathtex.preview': return 'Aperçu';
			case 'tools.mathtex.color': return 'Couleur';
			case 'tools.mathtex.get_help': return 'Obtenir de l\'aide';
			case 'tools.mathtex.open_help_website': return 'Ouvrir le site d\'aide';
			case 'tools.mathtex.help_content': return 'Entrez une expression mathématique au format TeX pour la rendre en formule mathématique. Par exemple, l\'expression TeX \'\\frac{a}{b}\' sera rendue comme une fraction avec \'a\' au-dessus de \'b\'. Vous pouvez utiliser n\'importe quelle syntaxe TeX prise en charge pour créer des expressions mathématiques complexes. Une fois que vous avez entré votre expression, vous pouvez la prévisualiser et l\'exporter en tant que fichier SVG.\nCompatible avec le format TeX de MathJax.';
			case 'tools.mathtex.copied_to_clipboard': return 'Copié dans le presse-papiers';
			case 'tools.mathtex.error.an_error_occurred_while_rendering_the_mathtex': return 'Une erreur s\'est produite lors du rendu de MathTeX';
			case 'tools.mathtex.error.please_wait_until_the_preview_is_loaded': return 'Veuillez attendre que l\'aperçu soit chargé';
			case 'tools.mathtex.error.an_error_occurred_while_exporting_the_image': return 'Une erreur s\'est produite lors de l\'exportation de l\'image';
			case 'tools.mathtex.error.could_not_open_help_website': return 'Impossible d\'ouvrir le site web d\'aide, veuillez vérifier votre configuration et réessayer';
			case 'tools.compass.title': return 'Boussole';
			case 'tools.compass.error.please_grant_location_permission': return 'Veuillez autoriser la permission de localisation pour utiliser la boussole. Cette autorisation est obligatoire pour accéder aux capteurs de l\'appareil.';
			case 'tools.qrcreator.title': return 'Créateur de QR';
			case 'tools.qrcreator.qr_code_settings': return 'Détails du QR code';
			case 'tools.qrcreator.ecc_low': return 'Bas';
			case 'tools.qrcreator.ecc_medium': return 'Moyen';
			case 'tools.qrcreator.ecc_quartile': return 'Quartile';
			case 'tools.qrcreator.ecc_high': return 'Haut';
			case 'tools.qrcreator.saved_successfully': return 'QR code enregistré avec succès';
			case 'tools.qrcreator.shared_successfully': return 'QR code partagé avec succès';
			case 'tools.qrcreator.enter_text_or_url': return 'Entrez du texte ou une URL';
			case 'tools.qrcreator.error_correction_level': return 'Niveau de correction d\'erreur';
			case 'tools.qrcreator.create': return 'Créer';
			case 'tools.qrcreator.generated_qr_code': return 'QR code généré';
			case 'tools.qrcreator.save': return 'Enregistrer';
			case 'tools.qrcreator.share': return 'Partager';
			case 'tools.qrcreator.error.failed_to_create_qr_code': return 'Échec de la création du QR code, veuillez vérifier votre saisie et réessayer';
			case 'tools.pastebin.title': return 'Pastebin';
			case 'tools.pastebin.url': return 'L\'URL';
			case 'tools.pastebin.qr_code': return 'Le code QR';
			case 'tools.pastebin.share': return 'Partager';
			case 'tools.pastebin.share_dialog_message': return 'Que souhaitez-vous partager ?';
			case 'tools.pastebin.your_short_link_is': return 'Votre lien court est';
			case 'tools.pastebin.copy_to_clipboard': return 'Copier dans le presse-papiers';
			case 'tools.pastebin.copied_to_clipboard': return 'Lien court copié dans le presse-papiers';
			case 'tools.pastebin.the_link_id_is': return 'The link ID is';
			case 'tools.pastebin.link_id_copied_to_clipboard': return 'Link ID copied to clipboard';
			case 'tools.pastebin.the_link_password_is': return 'The link password is';
			case 'tools.pastebin.link_password_copied_to_clipboard': return 'Link password copied to clipboard';
			case 'tools.pastebin.link_password_hint_text': return 'Tap the password to copy it\nYou will need it to view statistics about this link';
			case 'tools.pastebin.paste_another_text': return 'Coller un autre texte';
			case 'tools.pastebin.text_to_paste': return 'Texte à coller';
			case 'tools.pastebin.text_paste_field_hint': return 'Collez votre texte, code source ou autre contenu ici';
			case 'tools.pastebin.by_clicking_you_accept': return ({required Object url}) => 'En cliquant sur le bouton « envoyer », vous acceptez les conditions d\'utilisation de "${url}" disponibles via le lien ci-dessous.';
			case 'tools.pastebin.terms_of_service': return 'Conditions d\'utilisation (ToS)';
			case 'tools.pastebin.send': return 'Envoyer';
			case 'tools.pastebin.more_features': return 'Plus de fonctionnalités';
			case 'tools.pastebin.more_features_message': return 'Utiliser des fonctions supplémentaires telles que le raccourcissement d\'URL, le profil link-in-bio, et plus via le site officiel JTU.ME';
			case 'tools.pastebin.open': return 'Ouvrir';
			case 'tools.pastebin.options': return 'Options (optionnel)';
			case 'tools.pastebin.access_password': return 'Mot de passe d\'accès';
			case 'tools.pastebin.expiration_date': return 'Date d\'expiration (UTC)';
			case 'tools.pastebin.use_my_account': return 'Utiliser mon compte';
			case 'tools.pastebin.email': return 'Email';
			case 'tools.pastebin.password': return 'Mot de passe';
			case 'tools.pastebin.no_account': return 'Pas de compte ?';
			case 'tools.pastebin.no_account_message': return 'Vous pouvez créer un compte gratuit sur le site officiel de JTU.ME pour gérer vos liens et vos pastes.';
			case 'tools.pastebin.error.failed_to_obtain_short_link': return 'Impossible d\'obtenir un lien court, veuillez vérifier votre connexion internet puis réessayer';
			case 'tools.pastebin.error.impossible_to_connect_to_the_server': return 'Impossible de se connecter au serveur';
			case 'tools.pastebin.error.impossible_to_connect_to_the_server_message': return 'Échec de la connexion au serveur, veuillez vérifier votre connexion internet et réessayer.';
			case 'tools.pastebin.error.unauthorized': return 'Non autorisé. Veuillez vérifier vos identifiants.';
			case 'tools.pastebin.error.invalid_expiration_date': return 'La date d\'expiration doit être dans le futur.';
			case 'tools.pastebin.management_info': return 'Infos de gestion';
			case 'tools.pastebin.manage_with_account': return 'Pour consulter les statistiques et gérer ce lien, utilisez votre compte JTU.ME sur le site officiel';
			case 'tools.percentagecalculator.title': return 'Calculateur de pourcentage';
			case 'tools.percentagecalculator.result': return 'Résultat';
			case 'tools.percentagecalculator.percentage': return 'Pourcentage';
			case 'tools.percentagecalculator.eg': return 'ex.';
			case 'tools.percentagecalculator.total': return 'Total';
			case 'tools.percentagecalculator.first_value': return 'Première valeur';
			case 'tools.percentagecalculator.second_value': return 'Seconde valeur';
			case 'tools.percentagecalculator.what_is': return 'Quel est';
			case 'tools.percentagecalculator.of': return 'de';
			case 'tools.percentagecalculator.is_what_percentage_of': return 'est quel pourcentage de';
			case 'tools.percentagecalculator.what_is_the_percentage_difference': return 'Quelle est la différence en pourcentage';
			case 'tools.percentagecalculator.from': return 'de';
			case 'tools.percentagecalculator.to': return 'à';
			case 'tools.percentagecalculator.calculate': return 'Calculer';
			case 'tools.percentagecalculator.error.please_enter_valid_numbers_for_both_fields': return 'Veuillez entrer des nombres valides pour les deux champs';
			case 'tools.percentagecalculator.error.total_cannot_be_zero': return 'Le total ne peut pas être zéro';
			case 'tools.percentagecalculator.error.first_value_cannot_be_zero': return 'La première valeur ne peut pas être zéro';
			case 'tools.passwordgenerator.title': return 'Générateur de mot de passe';
			case 'tools.passwordgenerator.password_length': return 'Longueur du mot de passe';
			case 'tools.passwordgenerator.number_of_digits': return 'Nombre de chiffres';
			case 'tools.passwordgenerator.number_of_special_characters': return 'Nombre de caractères spéciaux';
			case 'tools.passwordgenerator.generate_password': return 'Générer un mot de passe';
			case 'tools.passwordgenerator.password_copied_to_clipboard': return 'Mot de passe copié dans le presse-papiers';
			case 'tools.passwordgenerator.tap_to_copy': return 'Cliquez pour copier';
			case 'tools.passwordgenerator.error.password_length_must_be_greater_than_0': return 'La longueur du mot de passe doit être supérieure à 0';
			case 'tools.passwordgenerator.error.password_length_cannot_exceed_x_characters': return ({required Object maxLength}) => 'La longueur du mot de passe ne peut pas dépasser ${maxLength} caractères';
			case 'tools.passwordgenerator.error.password_length_cannot_be_less_than_the_sum_of_digits_and_special_characters': return 'La longueur du mot de passe ne peut pas être inférieure à la somme du nombre de chiffres et de caractères spéciaux';
			case 'tools.passwordgenerator.generated_password': return 'Mot de passe généré';
			case 'tools.portscanner.title': return 'Scanner de ports';
			case 'tools.portscanner.host_to_scan': return 'Hôte à scanner';
			case 'tools.portscanner.start_port': return 'Port de départ';
			case 'tools.portscanner.end_port': return 'Port de fin';
			case 'tools.portscanner.start_scan': return 'Démarrer le scan';
			case 'tools.portscanner.stop_scan': return 'Arrêter le scan';
			case 'tools.portscanner.port': return 'Port';
			case 'tools.portscanner.error.please_enter_a_valid_host': return 'Veuillez entrer un hôte valide';
			case 'tools.portscanner.error.please_enter_a_valid_port_number': return 'Veuillez saisir un numéro de port valide (1-65535) dans les deux champs';
			case 'tools.portscanner.example_domain_or_ip': return 'example.com ou 192.168.1.1';
			case 'tools.portscanner.port_range': return 'Plage de ports';
			case 'tools.portscanner.scan_progress': return 'Progression du scan';
			case 'tools.commons.title': return 'Commons';
			case 'tools.commons.data_source_and_licensing': return 'Source des données et licences';
			case 'tools.commons.data_source_and_licensing_description': return 'Tous les fichiers multimédias proviennent de Wikimedia Commons et sont soumis à leurs licences respectives. Veuillez vous assurer de respecter les conditions de chaque licence lorsque vous utilisez et téléchargez les fichiers multimédias.';
			case 'tools.commons.open_wikimedia_commons': return 'Ouvrir Wikimedia Commons';
			case 'tools.commons.search_files': return 'Rechercher des fichiers';
			case 'tools.commons.enter_search_query_to_find_files': return 'Entrez un terme de recherche pour trouver des fichiers sur Wikimedia Commons';
			case 'tools.commons.view_on_wikimedia': return 'Voir sur Wikimedia Commons';
			case 'tools.commons.previous': return 'Précédent';
			case 'tools.commons.next': return 'Suivant';
			case 'tools.commons.bytes': return 'octets';
			case 'tools.commons.kilobytes': return 'Ko';
			case 'tools.commons.megabytes': return 'Mo';
			case 'tools.commons.gigabytes': return 'Go';
			case 'tools.commons.no_files_found': return 'Aucun fichier trouvé';
			case 'tools.commons.close_preview': return 'Fermer l\'aperçu';
			case 'tools.commons.view_license_details': return 'Voir les détails de la licence';
			case 'tools.commons.download_media': return 'Télécharger le média';
			case 'tools.commons.close': return 'Fermer';
			case 'tools.commons.file_information': return 'Informations sur le fichier';
			case 'tools.commons.unknown_license': return 'Licence inconnue';
			case 'tools.commons.mime_type': return 'Type MIME';
			case 'tools.commons.file_size': return 'Taille';
			case 'tools.commons.dimensions': return 'Dimensions';
			case 'tools.commons.duration': return 'Durée';
			case 'tools.commons.file_license': return 'Licence';
			case 'tools.commons.file_by': return 'Fichier par';
			case 'tools.commons.file_downloaded_successfully': return 'Fichier téléchargé avec succès';
			case 'tools.commons.downloading': return 'Téléchargement...';
			case 'tools.commons.error.error_downloading_file': return ({required Object errorCode}) => 'Erreur lors du téléchargement du fichier (${errorCode})';
			case 'tools.commons.error.error_download_file_check_internet': return 'Erreur lors du téléchargement du fichier. Veuillez vérifier votre connexion Internet et réessayer.';
			case 'tools.commons.load_preview': return 'Charger l\'aperçu';
			case 'tools.commons.page': return ({required Object number}) => 'Page ${number}';
			case 'tools.crdeck.title': return 'Deck Clash Royale';
			case 'tools.crdeck.clear_unlocked_deck_cards': return 'Effacer les cartes non épinglées du deck';
			case 'tools.crdeck.about_and_credits': return 'À propos et crédits';
			case 'tools.crdeck.about_and_credits_description': return 'Cet outil utilise l\'API officielle Clash Royale fournie par Supercell (via un serveur backend Koizeay). Cet outil n\'est en aucun cas affilié à ou approuvé par Supercell. Tout le contenu Clash Royale, y compris, mais sans s\'y limiter, les images, les noms et les marques commerciales, sont la propriété de Supercell.';
			case 'tools.crdeck.supercell_website': return 'Site de Supercell';
			case 'tools.crdeck.no_deck': return 'Aucun deck';
			case 'tools.crdeck.generate_new_deck': return 'Générer un nouveau deck';
			case 'tools.crdeck.open_deck_in_clash_royale': return 'Ouvrir le deck dans Clash Royale';
			case 'tools.crdeck.share_deck': return 'Partager le deck';
			case 'tools.crdeck.search_cards': return 'Rechercher des cartes';
			case 'tools.crdeck.import_cards_from_player_profile': return 'Importer des cartes depuis le profil d\'un joueur';
			case 'tools.crdeck.deselect_all_cards': return 'Désélectionner toutes les cartes';
			case 'tools.crdeck.select_all_cards': return 'Sélectionner toutes les cartes';
			case 'tools.crdeck.x_elixirs': return ({required Object elixirs}) => '${elixirs} élixirs';
			case 'tools.crdeck.player_tag': return 'Identifiant du joueur';
			case 'tools.crdeck.import': return 'Importer';
			case 'tools.crdeck.importing_cards': return 'Importation des cartes...';
			case 'tools.crdeck.share_deck_text_message': return ({required Object url}) => 'Regarde mon deck Clash Royale créé avec Toolbox !\nOuvre-le dans Clash Royale en utilisant ce lien : ${url}';
			case 'tools.crdeck.error.please_check_your_internet_connection': return 'Veuillez vérifier votre connexion internet et réessayer';
			case 'tools.crdeck.error.error_while_loading_cards_from_server': return 'Une erreur s\'est produite lors du chargement des cartes de Clash Royale depuis le serveur.\nVeuillez vérifier votre connexion réseau et réessayer.';
			case 'tools.crdeck.error.failed_to_load_cards_from_server': return ({required Object errorCode}) => 'Échec du chargement des cartes de Clash Royale depuis le serveur (${errorCode})';
			case 'tools.crdeck.error.invalid_tag': return 'Identifiant invalide';
			case 'tools.crdeck.error.please_enter_a_valid_player_tag': return 'Veuillez saisir un identifiant de joueur valide';
			case 'tools.crdeck.error.failed_to_import_cards_from_player_profile': return ({required Object errorCode}) => 'Échec de l\'importation des cartes depuis le profil du joueur (${errorCode}), vous pouvez toujours importer les cartes manuellement';
			case 'tools.crdeck.error.an_error_occurred_while_importing_cards': return 'Une erreur s\'est produite lors de l\'importation des cartes, mais vous pouvez toujours les importer manuellement';
			case 'tools.crdeck.error.not_enough_cards_selected': return 'Pas assez de cartes sélectionnées';
			case 'tools.crdeck.error.please_select_at_least_x_more_cards': return ({required Object numberOfCards}) => 'Veuillez sélectionner au moins ${numberOfCards} cartes supplémentaires pour créer un deck valide';
			case 'tools.crdeck.error.deck_is_full': return 'Deck plein';
			case 'tools.crdeck.error.you_can_only_add_up_to_x_cards_to_the_deck': return ({required Object numberOfCards}) => 'Vous ne pouvez ajouter que ${numberOfCards} cartes au deck';
			case 'tools.crdeck.error.card_already_in_deck': return 'Carte déjà dans le deck';
			case 'tools.crdeck.error.this_card_is_already_in_the_deck': return 'Cette carte est déjà dans le deck';
			case 'tools.crdeck.error.incomplete_deck': return 'Deck incomplet';
			case 'tools.crdeck.error.please_add_x_more_cards_to_the_deck_before_opening_it_in_clash_royale': return ({required Object numberOfCards}) => 'Veuillez ajouter ${numberOfCards} cartes supplémentaires au deck avant de l\'ouvrir dans Clash Royale';
			case 'tools.crdeck.error.please_add_x_more_cards_to_the_deck_before_sharing_it': return ({required Object numberOfCards}) => 'Veuillez ajouter ${numberOfCards} cartes supplémentaires au deck avant de le partager';
			case 'tools.iplocation.title': return 'IP location';
			case 'tools.iplocation.api_used': return 'API utilisée';
			case 'tools.iplocation.about_the_api': return 'À propos de l\'API';
			case 'tools.iplocation.about_the_api_description': return ({required Object source}) => 'Cet outil utilise l\'API fournie par "${source}" pour récupérer les informations de localisation de l\'adresse IP indiquée';
			case 'tools.iplocation.visit_website': return 'Voir le site';
			case 'tools.iplocation.ip_address': return 'Adresse IP';
			case 'tools.iplocation.get_ip_location': return 'Obtenir la localisation de l\'IP';
			case 'tools.iplocation.location_information': return 'Informations de localisation';
			case 'tools.iplocation.n_a': return 'N/A';
			case 'tools.iplocation.country': return 'Pays';
			case 'tools.iplocation.provider': return 'Fournisseur';
			case 'tools.iplocation.error.ip_required': return 'Adresse IP requise';
			case 'tools.iplocation.error.please_enter_an_ip_address': return 'Veuillez entrer une adresse IP pour obtenir sa localisation';
			case 'tools.iplocation.error.error_fetching_location': return 'Impossible de récupérer la localisation';
			case 'tools.iplocation.error.error_fetching_location_description': return 'Il semble qu\'une erreur se soit produite lors de la récupération de la localisation. Vérifiez les informations entrées et votre connexion internet, puis réessayez';
			case 'credits.title': return 'Crédits';
			case 'credits.app_icon': return ({required Object author}) => 'Icône de l\'application par ${author}';
			case 'credits.app_license': return ({required Object license}) => 'Application sous licence ${license}';
			case 'credits.tools_icons': return ({required Object author}) => 'Icônes des outils par ${author}';
			case 'credits.ads_disclaimer': return 'Les publicités sont là pour m\'aider à payer les coûts de serveur et à soutenir le développement de cette application. Seule une petite bannière est affichée en bas de l\'écran, rien qui ne bloque votre expérience avec Toolbox.';
			case 'credits.more_apps_and_services': return 'Plus d\'apps et services';
			case 'credits.view_licenses': return 'Voir les licences';
			case 'credits.special_thanks': return 'Remerciements spéciaux';
			case 'credits.contribute_on_github': return 'Contribuez sur GitHub';
			case 'credits.email_copied_to_clipboard': return 'Email copié dans le presse-papiers';
			case 'credits.made_with_love_in_switzerland': return 'Développé de tout cœur en Suisse';
			case 'credits.made_with_love_in_switzerland_description': return 'Développé en Suisse, utilisé dans le monde entier.\nMerci d\'utiliser Toolbox.\nSi vous l\'appréciez, n\'hésitez pas à laisser un commentaire sur le Play Store ou l\'App Store.\nCela m\'aide beaucoup et me motive à continuer à améliorer l\'application.';
			case 'credits.translations.title': return 'Traductions';
			case 'credits.translations.english': return ({required Object author}) => 'Anglais par ${author}';
			case 'credits.translations.french': return ({required Object author}) => 'Français par ${author}';
			case 'credits.translations.japanese': return ({required Object author}) => 'Japonais par ${author}';
			default: return null;
		}
	}
}

