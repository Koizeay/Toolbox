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
class TranslationsJa implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsJa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsJa _root = this; // ignore: unused_field

	@override 
	TranslationsJa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsJa(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsGenericJa generic = _TranslationsGenericJa._(_root);
	@override late final _TranslationsHomepageJa homepage = _TranslationsHomepageJa._(_root);
	@override late final _TranslationsCategoriesJa categories = _TranslationsCategoriesJa._(_root);
	@override late final _TranslationsToolsJa tools = _TranslationsToolsJa._(_root);
	@override late final _TranslationsCreditsJa credits = _TranslationsCreditsJa._(_root);
}

// Path: generic
class _TranslationsGenericJa implements TranslationsGenericEn {
	_TranslationsGenericJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get app_name => 'Toolbox';
	@override String get tools => 'ツール';
	@override String get categories => 'カテゴリ';
	@override String get error => 'エラー';
	@override String get warning => '警告';
	@override String get ok => 'OK';
	@override String get cancel => 'キャンセル';
	@override String get search => '検索';
	@override String get enable => '有効化';
	@override String get reset => 'リセット';
	@override String get yes => 'はい';
	@override String get no => 'いいえ';
	@override String get copy => 'コピー';
	@override String get share => '共有';
	@override String get generate => '生成';
}

// Path: homepage
class _TranslationsHomepageJa implements TranslationsHomepageEn {
	_TranslationsHomepageJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get update_available => 'アップデートあり';
	@override String get update_available_message => 'Toolboxの新しいバージョンが利用可能です。今すぐアップデートして最新の機能と改善を入手してください。';
	@override String get switch_view => '表示切替';
	@override String get search_all_categories => 'すべてのカテゴリで検索';
	@override String get clear_search => '検索をクリア';
	@override String get add => '追加';
	@override String get remove => '削除';
	@override String get favorites => 'お気に入り';
	@override String get would_you_like_to_add_this_tool_to_favorites => 'このツールをお気に入りに追加しますか？';
	@override String get would_you_like_to_remove_this_tool_from_favorites => 'このツールをお気に入りから削除しますか？';
}

// Path: categories
class _TranslationsCategoriesJa implements TranslationsCategoriesEn {
	_TranslationsCategoriesJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get audio => 'オーディオ';
	@override String get calculations => '計算';
	@override String get games => 'ゲーム';
	@override String get geography => '地理';
	@override String get miscellaneous => 'その他';
	@override String get network => 'ネットワーク';
	@override String get random => 'ランダム';
	@override String get time => '時間';
	@override String get web => 'Web';
}

// Path: tools
class _TranslationsToolsJa implements TranslationsToolsEn {
	_TranslationsToolsJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsToolsBaseconverterJa baseconverter = _TranslationsToolsBaseconverterJa._(_root);
	@override late final _TranslationsToolsClockJa clock = _TranslationsToolsClockJa._(_root);
	@override late final _TranslationsToolsMetronomeJa metronome = _TranslationsToolsMetronomeJa._(_root);
	@override late final _TranslationsToolsMegaphoneJa megaphone = _TranslationsToolsMegaphoneJa._(_root);
	@override late final _TranslationsToolsNslookupJa nslookup = _TranslationsToolsNslookupJa._(_root);
	@override late final _TranslationsToolsPingJa ping = _TranslationsToolsPingJa._(_root);
	@override late final _TranslationsToolsSoundmeterJa soundmeter = _TranslationsToolsSoundmeterJa._(_root);
	@override late final _TranslationsToolsQrreaderJa qrreader = _TranslationsToolsQrreaderJa._(_root);
	@override late final _TranslationsToolsTimerJa timer = _TranslationsToolsTimerJa._(_root);
	@override late final _TranslationsToolsStopwatchJa stopwatch = _TranslationsToolsStopwatchJa._(_root);
	@override late final _TranslationsToolsRouletteJa roulette = _TranslationsToolsRouletteJa._(_root);
	@override late final _TranslationsToolsFlipcoinsJa flipcoins = _TranslationsToolsFlipcoinsJa._(_root);
	@override late final _TranslationsToolsRandomnumberJa randomnumber = _TranslationsToolsRandomnumberJa._(_root);
	@override late final _TranslationsToolsRandomcolorJa randomcolor = _TranslationsToolsRandomcolorJa._(_root);
	@override late final _TranslationsToolsSshclientJa sshclient = _TranslationsToolsSshclientJa._(_root);
	@override late final _TranslationsToolsWhiteboardJa whiteboard = _TranslationsToolsWhiteboardJa._(_root);
	@override late final _TranslationsToolsNetworkinfoJa networkinfo = _TranslationsToolsNetworkinfoJa._(_root);
	@override late final _TranslationsToolsUuidgeneratorJa uuidgenerator = _TranslationsToolsUuidgeneratorJa._(_root);
	@override late final _TranslationsToolsTexttospeechJa texttospeech = _TranslationsToolsTexttospeechJa._(_root);
	@override late final _TranslationsToolsNearbypublictransportstopsJa nearbypublictransportstops = _TranslationsToolsNearbypublictransportstopsJa._(_root);
	@override late final _TranslationsToolsFileencryptionJa fileencryption = _TranslationsToolsFileencryptionJa._(_root);
	@override late final _TranslationsToolsYoutubethumbnailJa youtubethumbnail = _TranslationsToolsYoutubethumbnailJa._(_root);
	@override late final _TranslationsToolsNationalanthemsJa nationalanthems = _TranslationsToolsNationalanthemsJa._(_root);
	@override late final _TranslationsToolsHttprequestJa httprequest = _TranslationsToolsHttprequestJa._(_root);
	@override late final _TranslationsToolsMorsecodeJa morsecode = _TranslationsToolsMorsecodeJa._(_root);
	@override late final _TranslationsToolsOsmJa osm = _TranslationsToolsOsmJa._(_root);
	@override late final _TranslationsToolsGameoflifeJa gameoflife = _TranslationsToolsGameoflifeJa._(_root);
	@override late final _TranslationsToolsSpeedometerJa speedometer = _TranslationsToolsSpeedometerJa._(_root);
	@override late final _TranslationsToolsMcServerPingJa mc_server_ping = _TranslationsToolsMcServerPingJa._(_root);
	@override late final _TranslationsToolsTimestampconverterJa timestampconverter = _TranslationsToolsTimestampconverterJa._(_root);
	@override late final _TranslationsToolsUrlshortenerJa urlshortener = _TranslationsToolsUrlshortenerJa._(_root);
	@override late final _TranslationsToolsCounterJa counter = _TranslationsToolsCounterJa._(_root);
	@override late final _TranslationsToolsBitwisecalculatorJa bitwisecalculator = _TranslationsToolsBitwisecalculatorJa._(_root);
	@override late final _TranslationsToolsMusicsearchJa musicsearch = _TranslationsToolsMusicsearchJa._(_root);
	@override late final _TranslationsToolsMusicanalyserJa musicanalyser = _TranslationsToolsMusicanalyserJa._(_root);
	@override late final _TranslationsToolsTextdifferencesJa textdifferences = _TranslationsToolsTextdifferencesJa._(_root);
	@override late final _TranslationsToolsCharacterscopyJa characterscopy = _TranslationsToolsCharacterscopyJa._(_root);
	@override late final _TranslationsToolsWhoisdomainJa whoisdomain = _TranslationsToolsWhoisdomainJa._(_root);
	@override late final _TranslationsToolsTextcounterJa textcounter = _TranslationsToolsTextcounterJa._(_root);
	@override late final _TranslationsToolsRomannumeralJa romannumeral = _TranslationsToolsRomannumeralJa._(_root);
	@override late final _TranslationsToolsAreacalculatorJa areacalculator = _TranslationsToolsAreacalculatorJa._(_root);
	@override late final _TranslationsToolsMathtexJa mathtex = _TranslationsToolsMathtexJa._(_root);
	@override late final _TranslationsToolsCompassJa compass = _TranslationsToolsCompassJa._(_root);
	@override late final _TranslationsToolsQrcreatorJa qrcreator = _TranslationsToolsQrcreatorJa._(_root);
	@override late final _TranslationsToolsPastebinJa pastebin = _TranslationsToolsPastebinJa._(_root);
	@override late final _TranslationsToolsPercentagecalculatorJa percentagecalculator = _TranslationsToolsPercentagecalculatorJa._(_root);
	@override late final _TranslationsToolsPasswordgeneratorJa passwordgenerator = _TranslationsToolsPasswordgeneratorJa._(_root);
	@override late final _TranslationsToolsPortscannerJa portscanner = _TranslationsToolsPortscannerJa._(_root);
	@override late final _TranslationsToolsCommonsJa commons = _TranslationsToolsCommonsJa._(_root);
	@override late final _TranslationsToolsCrdeckJa crdeck = _TranslationsToolsCrdeckJa._(_root);
	@override late final _TranslationsToolsIplocationJa iplocation = _TranslationsToolsIplocationJa._(_root);
}

// Path: credits
class _TranslationsCreditsJa implements TranslationsCreditsEn {
	_TranslationsCreditsJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'クレジット';
	@override String app_icon({required Object author}) => 'アプリアイコン: ${author}';
	@override String app_license({required Object license}) => 'このアプリは ${license} ライセンスの下で提供されています';
	@override String tools_icons({required Object author}) => 'ツールアイコン: ${author}';
	@override String get ads_disclaimer => '広告はサーバー費用の支払いとアプリ開発のサポートのために表示しています。\n画面下部に小さなバナーが表示されるだけで、Toolboxの使用を妨げるものではありません。';
	@override String get more_apps_and_services => 'その他のアプリとサービス';
	@override String get view_licenses => 'ライセンスを見る';
	@override String get special_thanks => '特別感謝';
	@override String get contribute_on_github => 'GitHubで貢献';
	@override String get email_copied_to_clipboard => 'メールアドレスをクリップボードにコピーしました';
	@override String get made_with_love_in_switzerland => 'スイスから愛を込めて';
	@override String get made_with_love_in_switzerland_description => 'スイスで開発、世界中で使用。\nToolboxをご利用いただきありがとうございます。\n気に入っていただけたら、Play StoreまたはApp Storeにレビューを残していただけると大変励みになります。\nアプリの改善を続けるための大きなモチベーションになります。';
	@override late final _TranslationsCreditsTranslationsJa translations = _TranslationsCreditsTranslationsJa._(_root);
}

// Path: tools.baseconverter
class _TranslationsToolsBaseconverterJa implements TranslationsToolsBaseconverterEn {
	_TranslationsToolsBaseconverterJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '進数変換';
	@override String get input => '入力';
	@override String get results => '結果';
	@override String get enter_a_dec_number => '10進数を入力';
	@override String get enter_a_hex_number => '16進数を入力';
	@override String get enter_a_bin_number => '2進数を入力';
	@override String get enter_a_oct_number => '8進数を入力';
	@override String get hexadecimal => '16進数';
	@override String get binary => '2進数';
	@override String get octal => '8進数';
	@override String get decimal => '10進数';
	@override String get incompatible_number => '非対応の数値';
	@override String get too_big_number => '数値が大きすぎます';
	@override String the_number_you_entered_is_not_a_valid_x_number({required Object base}) => '入力した数値は有効な ${base} 進数ではありません';
	@override String get the_number_you_entered_is_too_big_to_be_abble_to_convert_it => '入力した数値は大きすぎて変換できません';
}

// Path: tools.clock
class _TranslationsToolsClockJa implements TranslationsToolsClockEn {
	_TranslationsToolsClockJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '時計';
	@override String get change_timezone => 'タイムゾーンを変更';
	@override String get timezone => 'タイムゾーン';
	@override String get choose_a_timezone => 'タイムゾーンを選択';
	@override String get select_local => '現地時間';
}

// Path: tools.metronome
class _TranslationsToolsMetronomeJa implements TranslationsToolsMetronomeEn {
	_TranslationsToolsMetronomeJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'メトロノーム';
	@override String get bpm => 'BPM';
	@override String get beats_per_measure => '1小節の拍数';
	@override String get start => '開始';
	@override String get stop => '停止';
}

// Path: tools.megaphone
class _TranslationsToolsMegaphoneJa implements TranslationsToolsMegaphoneEn {
	_TranslationsToolsMegaphoneJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'メガフォン';
	@override late final _TranslationsToolsMegaphoneErrorJa error = _TranslationsToolsMegaphoneErrorJa._(_root);
}

// Path: tools.nslookup
class _TranslationsToolsNslookupJa implements TranslationsToolsNslookupEn {
	_TranslationsToolsNslookupJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'NSLookup';
	@override String get enter_a_domain_name => 'ドメイン名を入力';
	@override String get lookup => '検索';
	@override late final _TranslationsToolsNslookupErrorJa error = _TranslationsToolsNslookupErrorJa._(_root);
	@override String get not_supported_by_system_dns => 'システムDNS非対応';
	@override String get no_records_found => 'レコードが見つかりません';
}

// Path: tools.ping
class _TranslationsToolsPingJa implements TranslationsToolsPingEn {
	_TranslationsToolsPingJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ping';
	@override String get ping => 'Ping';
	@override String get enter_a_domain_name_or_ip => 'ドメイン名またはIPアドレスを入力';
	@override String reply_from_host_time_ttl({required Object host, required Object time, required Object ttl}) => '${host} からの応答: time=${time}ms TTL=${ttl}';
	@override String x_packets_transmitted_y({required Object transmitted, required Object received}) => '${transmitted} パケット送信、${received} パケット受信';
	@override late final _TranslationsToolsPingErrorJa error = _TranslationsToolsPingErrorJa._(_root);
}

// Path: tools.soundmeter
class _TranslationsToolsSoundmeterJa implements TranslationsToolsSoundmeterEn {
	_TranslationsToolsSoundmeterJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '騒音計';
	@override String get decibels => 'dB';
	@override late final _TranslationsToolsSoundmeterErrorJa error = _TranslationsToolsSoundmeterErrorJa._(_root);
}

// Path: tools.qrreader
class _TranslationsToolsQrreaderJa implements TranslationsToolsQrreaderEn {
	_TranslationsToolsQrreaderJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'QRリーダー';
	@override String get scanned => 'スキャン済み';
	@override String get openurl => 'リンクを開く';
	@override String get copy_password => 'パスワードをコピー';
	@override String get copy => 'コピー';
	@override String get copied_to_clipboard => 'クリップボードにコピーしました';
	@override String get wifi => 'WiFi';
	@override String get wifi_ssid => 'SSID';
	@override String get wifi_password => 'パスワード';
	@override late final _TranslationsToolsQrreaderErrorJa error = _TranslationsToolsQrreaderErrorJa._(_root);
}

// Path: tools.timer
class _TranslationsToolsTimerJa implements TranslationsToolsTimerEn {
	_TranslationsToolsTimerJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'タイマー';
	@override String get start => '開始';
	@override String get stop => '停止';
	@override String get pause => '一時停止';
	@override String get please_stop_the_timer_first => '先にタイマーを停止してください';
	@override String get ios_warning_message => 'iOSでタイマーを鳴らすには、アプリを終了したりiPhoneの画面をオフにしないでください。そうしないと、タイマーがゼロになったときにiOSが鳴らさなくなります。';
	@override String get adjust_time => '時間を調整';
}

// Path: tools.stopwatch
class _TranslationsToolsStopwatchJa implements TranslationsToolsStopwatchEn {
	_TranslationsToolsStopwatchJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ストップウォッチ';
	@override String get controls => '操作';
	@override String get start => '開始';
	@override String get stop => '停止';
	@override String get reset => 'リセット';
	@override String get laps => 'ラップ';
	@override String get lap => 'ラップ';
}

// Path: tools.roulette
class _TranslationsToolsRouletteJa implements TranslationsToolsRouletteEn {
	_TranslationsToolsRouletteJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ルーレット';
	@override String get tap_to_roll_info => 'ホイールをタップして回す';
	@override String get default_1 => '勉強';
	@override String get default_2 => '遊ぶ';
	@override String get default_3 => '寝る';
	@override String get add => '追加';
	@override String get remove => '削除';
	@override String get add_item => 'アイテムを追加';
	@override String get item_name => 'アイテム名';
	@override String get remove_an_item => 'アイテムを削除';
	@override late final _TranslationsToolsRouletteWarningJa warning = _TranslationsToolsRouletteWarningJa._(_root);
}

// Path: tools.flipcoins
class _TranslationsToolsFlipcoinsJa implements TranslationsToolsFlipcoinsEn {
	_TranslationsToolsFlipcoinsJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'コインを投げる';
	@override String get change_coin_currency => 'コインの通貨を変更';
}

// Path: tools.randomnumber
class _TranslationsToolsRandomnumberJa implements TranslationsToolsRandomnumberEn {
	_TranslationsToolsRandomnumberJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '乱数';
	@override String get settings => '設定';
	@override String get min => '最小';
	@override String get max => '最大';
	@override late final _TranslationsToolsRandomnumberErrorJa error = _TranslationsToolsRandomnumberErrorJa._(_root);
}

// Path: tools.randomcolor
class _TranslationsToolsRandomcolorJa implements TranslationsToolsRandomcolorEn {
	_TranslationsToolsRandomcolorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ランダムカラー';
	@override String get hint => '色をタップして変更';
	@override String get tap_to_copy => 'タップしてコピー';
	@override String get copied_to_clipboard => 'クリップボードにコピーしました';
}

// Path: tools.sshclient
class _TranslationsToolsSshclientJa implements TranslationsToolsSshclientEn {
	_TranslationsToolsSshclientJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'SSHクライアント';
	@override String get backspace => 'バックスペース';
	@override String get use_password => 'パスワードを使用';
	@override String get use_ssh_key => 'SSHキーを使用';
	@override String get connection => '接続';
	@override String get host => 'ホスト';
	@override String get port => 'ポート';
	@override String get username => 'ユーザー名';
	@override String get password => 'パスワード';
	@override String get ssh_key => 'SSHキー';
	@override String get connect => '接続';
	@override String get authentication => '認証';
	@override String get select_private_key => '秘密鍵を選択';
	@override String get no_private_key_selected => '秘密鍵が選択されていません';
	@override String get passphrase => 'パスフレーズ（なければ空白のまま）';
	@override late final _TranslationsToolsSshclientErrorJa error = _TranslationsToolsSshclientErrorJa._(_root);
}

// Path: tools.whiteboard
class _TranslationsToolsWhiteboardJa implements TranslationsToolsWhiteboardEn {
	_TranslationsToolsWhiteboardJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ホワイトボード';
	@override String get share_success => 'ホワイトボードを共有しました';
	@override String get save_success => 'ホワイトボードを保存しました';
}

// Path: tools.networkinfo
class _TranslationsToolsNetworkinfoJa implements TranslationsToolsNetworkinfoEn {
	_TranslationsToolsNetworkinfoJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ネットワーク情報';
	@override String get loading => '読み込み中...';
	@override String get unknown => '不明';
	@override String get location_permission_required => 'WiFi情報の一部取得には位置情報の許可が必要です（OS上の制限）。\n許可しない場合、正確な情報が取得できない場合があります。';
	@override String get public_ip => 'パブリックIPアドレス';
	@override String get local_ip => 'ローカルIPアドレス';
	@override String get local_subnet_mask => 'ローカルネットワークサブネットマスク';
	@override String get local_gateway_ip => 'ローカルネットワークゲートウェイIP';
	@override String get local_broadcast_ip => 'ローカルネットワークブロードキャストIP';
	@override String get wifi_name => 'WiFi名';
	@override String get wifi_bssid => 'WiFi BSSID';
	@override String get not_available_on_ios => 'iOSでは利用不可';
	@override String get note_location_permission => '注意: 正確な位置情報の許可をしていない場合、一部の情報が正確でない場合があります。';
}

// Path: tools.uuidgenerator
class _TranslationsToolsUuidgeneratorJa implements TranslationsToolsUuidgeneratorEn {
	_TranslationsToolsUuidgeneratorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'UUIDジェネレーター';
	@override String get generate => '生成';
	@override String get default_uuid_text => 'ボタンを押してUUIDを生成';
	@override String get tap_to_copy => 'タップしてコピー';
	@override String get copied_to_clipboard => 'クリップボードにコピーしました';
	@override String get v1_uuid => 'v1（時刻ベース）';
	@override String get v4_uuid => 'v4（ランダム）';
	@override String get v5_uuid => 'v5（SHA1ベース）';
	@override String get v5_generate_title => 'UUID v5を生成';
	@override String get v5_namespace => '名前空間（ランダムにする場合は空白）';
	@override String get v5_name => '名前（なければ空白）';
	@override late final _TranslationsToolsUuidgeneratorErrorJa error = _TranslationsToolsUuidgeneratorErrorJa._(_root);
}

// Path: tools.texttospeech
class _TranslationsToolsTexttospeechJa implements TranslationsToolsTexttospeechEn {
	_TranslationsToolsTexttospeechJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'テキスト読み上げ';
	@override String get choose_a_language => '言語を選択';
	@override String get text_to_speak => '読み上げるテキスト';
	@override String get pitch => 'ピッチ';
	@override String get rate => '速度';
	@override String get play => '再生';
	@override String get stop => '停止';
	@override late final _TranslationsToolsTexttospeechErrorJa error = _TranslationsToolsTexttospeechErrorJa._(_root);
}

// Path: tools.nearbypublictransportstops
class _TranslationsToolsNearbypublictransportstopsJa implements TranslationsToolsNearbypublictransportstopsEn {
	_TranslationsToolsNearbypublictransportstopsJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '近くの交通機関';
	@override String get loading => '読み込み中...';
	@override String get refresh => '更新';
	@override String get data_source => 'データソース';
	@override String get initial_dialog_title => '案内';
	@override String initial_dialog_message({required Object source}) => 'このツールはスイスでの使用を想定しています。"${source}" のデータを使用しています';
	@override String get data_license_dialog_open => '開く';
	@override String get data_license_dialog_title => 'データソース';
	@override String data_license_dialog_message({required Object source, required Object url}) => 'このツールで使用するデータは "${source}" から提供されています。\n${url}';
	@override String get no_departures => '出発便なし';
	@override String get departure => '出発';
	@override String get arrival => '到着';
	@override String get platform => 'ホーム';
	@override String get show_on_map => '地図';
	@override String get map_marker_title => '停留所';
	@override late final _TranslationsToolsNearbypublictransportstopsErrorJa error = _TranslationsToolsNearbypublictransportstopsErrorJa._(_root);
}

// Path: tools.fileencryption
class _TranslationsToolsFileencryptionJa implements TranslationsToolsFileencryptionEn {
	_TranslationsToolsFileencryptionJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ファイル暗号化';
	@override String get home_hint => '暗号化するファイルを選択してください。復号化する場合は .aes 拡張子の暗号化済みファイルを選択してください';
	@override String get no_file_selected => 'ファイルが選択されていません';
	@override String get enter_password => 'パスワードを入力してください';
	@override String get file_saved_successfully => 'ファイルを保存しました';
	@override String get pick_a_file => 'ファイルを選択';
	@override String get encryption_password => '暗号化パスワード';
	@override String get encrypt => '暗号化';
	@override String get decrypt => '復号化';
	@override late final _TranslationsToolsFileencryptionErrorJa error = _TranslationsToolsFileencryptionErrorJa._(_root);
	@override String get enter_password_hint => 'パスワードを入力...';
	@override String get file_selection => 'ファイル選択';
}

// Path: tools.youtubethumbnail
class _TranslationsToolsYoutubethumbnailJa implements TranslationsToolsYoutubethumbnailEn {
	_TranslationsToolsYoutubethumbnailJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'YouTubeサムネイル';
	@override String get saved => 'サムネイルをデバイスに保存しました';
	@override String get youtube_video_id => 'YouTube動画URL';
	@override String get save_thumbnail => 'サムネイルを保存';
	@override String get please_enter_a_video_url => 'YouTubeのサムネイルをダウンロードするためにURL（またはID）を入力してください';
	@override late final _TranslationsToolsYoutubethumbnailErrorJa error = _TranslationsToolsYoutubethumbnailErrorJa._(_root);
	@override String get thumbnail_preview => 'サムネイルプレビュー';
}

// Path: tools.nationalanthems
class _TranslationsToolsNationalanthemsJa implements TranslationsToolsNationalanthemsEn {
	_TranslationsToolsNationalanthemsJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '国歌';
	@override String get stop => '国歌を停止';
	@override String get search => '検索（英語名）';
	@override String get license => 'ライセンス';
	@override String license_text({required Object source, required Object license}) => '音声ファイルは "${source}" により ${license} ライセンスのもとで提供されています';
	@override String get open => '開く';
	@override String get view_license => 'ライセンスを見る';
	@override String get loading_audio_title => '読み込み中';
	@override String get loading_audio_text => '国歌を読み込んでいます。お待ちください...';
	@override late final _TranslationsToolsNationalanthemsErrorJa error = _TranslationsToolsNationalanthemsErrorJa._(_root);
	@override String get no_anthems_found => '国歌が見つかりません';
}

// Path: tools.httprequest
class _TranslationsToolsHttprequestJa implements TranslationsToolsHttprequestEn {
	_TranslationsToolsHttprequestJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'HTTPリクエスト';
	@override String get method => 'メソッド';
	@override String get custom_method => 'カスタムメソッド';
	@override String get url => 'URL';
	@override String get headers => 'ヘッダー';
	@override String get body => 'ボディ';
	@override String get allow_bad_certificates => '無効な証明書を許可';
	@override String get allow_bad_certificates_description => 'このオプションを有効にすると、"HTTPリクエスト" ツールが無効・期限切れ・自己署名のSSL/TLS証明書を持つサーバーへHTTPSリクエストを送信できるようになります。これにより重要なセキュリティ制御が無効化され、第三者によるデータの傍受や改ざんのリスクがあります。このオプションは関連するリスクを十分理解した上で、信頼できる管理下のサーバーへのリクエストにのみ使用してください。一般的な使用は推奨しません。このオプションを有効にしたリクエストはHTTPと同様に第三者が閲覧・操作できるものとしてご認識ください。';
	@override String get i_know_what_i_am_doing => 'リスクを理解しています';
	@override String get render_html => 'HTMLをレンダリング';
	@override String get back_to_details => '詳細に戻る';
	@override String get send_request => 'リクエストを送信';
	@override String get response => 'レスポンス';
	@override String get status_code => 'ステータスコード';
	@override late final _TranslationsToolsHttprequestErrorJa error = _TranslationsToolsHttprequestErrorJa._(_root);
	@override String get example_headers => 'key1: value1\nkey2: value2';
	@override String get request_body_hint => 'リクエストボディ（JSON、XMLなど）';
}

// Path: tools.morsecode
class _TranslationsToolsMorsecodeJa implements TranslationsToolsMorsecodeEn {
	_TranslationsToolsMorsecodeJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'モールス信号';
	@override String get alphabet_field => 'アルファベット（A-Z、0-9）';
	@override String get morse_field => 'モールス信号（. と -）';
	@override String get note_spaces => '注意: 文字間は1スペース、単語間は3スペースを使用してください。';
	@override String get alphabet_to_morse => 'アルファベット → モールス';
	@override String get morse_to_alphabet => 'モールス → アルファベット';
	@override String get play_audio => '音声を再生';
	@override String get playing => '再生中...';
	@override String get enter_text => 'テキストを入力...';
}

// Path: tools.osm
class _TranslationsToolsOsmJa implements TranslationsToolsOsmEn {
	_TranslationsToolsOsmJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '地図（OSM）';
	@override String get go_to_my_location => '現在地へ';
	@override String get loading_map => '地図を読み込み中...';
	@override late final _TranslationsToolsOsmErrorJa error = _TranslationsToolsOsmErrorJa._(_root);
}

// Path: tools.gameoflife
class _TranslationsToolsGameoflifeJa implements TranslationsToolsGameoflifeEn {
	_TranslationsToolsGameoflifeJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ライフゲーム';
	@override String get grid_size => 'グリッドサイズ';
	@override String current_size_is_x({required Object size}) => '現在のサイズ: ${size}';
	@override String get waiting => '待機中';
	@override String get stop_simulation => 'シミュレーション停止';
	@override String get start_simulation => 'シミュレーション開始';
	@override String get randomize_grid => 'グリッドをランダム化';
	@override String get clear_grid => 'グリッドをクリア';
	@override late final _TranslationsToolsGameoflifeErrorJa error = _TranslationsToolsGameoflifeErrorJa._(_root);
}

// Path: tools.speedometer
class _TranslationsToolsSpeedometerJa implements TranslationsToolsSpeedometerEn {
	_TranslationsToolsSpeedometerJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '速度計';
	@override String get reset => 'リセット';
	@override String get about_traveled_distance_title => '走行距離について';
	@override String get about_traveled_distance_description => '走行距離はGPSで検出した速度をもとに計算されます。\nそのため距離は100%正確ではありません。';
	@override String get kmh => 'km/h';
	@override String get km => 'km';
	@override String get mph => 'mph';
	@override String get mi => 'mi';
	@override String get change_speed_unit => '速度単位を変更';
	@override String get change_speed_unit_description => '速度計で使用する速度の単位を選択してください';
	@override String get traveled_distance => '走行距離';
	@override late final _TranslationsToolsSpeedometerErrorJa error = _TranslationsToolsSpeedometerErrorJa._(_root);
}

// Path: tools.mc_server_ping
class _TranslationsToolsMcServerPingJa implements TranslationsToolsMcServerPingEn {
	_TranslationsToolsMcServerPingJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'MCサーバーPing';
	@override String get java_edition => 'Java Edition';
	@override String get information_java => '案内';
	@override String get information_java_description => 'サーバーがMinecraftのJava Editionで利用可能な場合はこのチェックボックスを有効にしてください。チェックを外すとBedrock Edition APIを使用します。';
	@override String get server_ip => 'MinecraftサーバーIP（またはドメイン）';
	@override String get ping => 'サーバーをPing';
	@override String get ping_another_server => '別のサーバーをPing';
	@override String get api_used => '使用API';
	@override String get about_the_api => 'APIについて';
	@override String about_the_api_description({required Object website, required Object source}) => 'このツールはMinecraftサーバーをPingするために "${website}" の "${source}" を使用しています';
	@override String get about_open => '開く';
	@override String the_server_id_is({required Object id}) => 'サーバーIDは "${id}" です';
	@override String x_y_players_online({required Object playersOnline, required Object playersMax}) => '${playersOnline}/${playersMax} 人がオンライン';
	@override String get added_to_favorites => 'お気に入りに追加しました';
	@override String get added_to_favorites_description => 'サーバーをお気に入りに追加しました';
	@override String get removed_from_favorites => 'お気に入りから削除しました';
	@override String get removed_from_favorites_description => 'サーバーをお気に入りから削除しました';
	@override String get add_to_favorites => 'お気に入りに追加';
	@override String get remove_from_favorites => 'お気に入りから削除';
	@override String get remove_from_favorites_description => 'このサーバーをお気に入りから削除しますか？';
	@override String get from_favorites => 'お気に入りから';
	@override String get pick_from_favorites => 'お気に入りから選択';
	@override String get no_favorites => 'お気に入りなし';
	@override String get no_favorites_description => 'お気に入りのサーバーがまだありません。';
	@override String get online_players => 'オンラインプレイヤー';
	@override String get online_players_description_no_players_to_show => 'サーバーにオンラインプレイヤーがいますが、プレイヤー名は表示できません';
	@override late final _TranslationsToolsMcServerPingErrorJa error = _TranslationsToolsMcServerPingErrorJa._(_root);
	@override String get server_id => 'サーバーID';
	@override String get server_info => 'サーバー情報';
}

// Path: tools.timestampconverter
class _TranslationsToolsTimestampconverterJa implements TranslationsToolsTimestampconverterEn {
	_TranslationsToolsTimestampconverterJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'タイムスタンプ変換';
	@override String get now_tooltip => '現在';
	@override String get utc => 'UTC';
	@override String get local => 'ローカル';
	@override String get local_or_utc_dialog_title => 'ローカルまたはUTC';
	@override String get local_or_utc_dialog_message => 'ローカル日時またはUTC日時を選択しますか？';
	@override String get unix_timestamp => 'Unixタイムスタンプ';
	@override String get convert_timestamp_to_date => 'タイムスタンプを日付に変換';
	@override String get tap_the_date_to_change_it => '日付をタップして変更';
	@override String get select_seconds => '秒を選択';
	@override late final _TranslationsToolsTimestampconverterErrorJa error = _TranslationsToolsTimestampconverterErrorJa._(_root);
	@override String get convert => '変換';
}

// Path: tools.urlshortener
class _TranslationsToolsUrlshortenerJa implements TranslationsToolsUrlshortenerEn {
	_TranslationsToolsUrlshortenerJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'URL短縮';
	@override String get url => 'URL';
	@override String get qr_code => 'QRコード';
	@override String get share => '共有';
	@override String get share_dialog_message => '何を共有しますか？';
	@override String get your_shortened_url_is => '短縮URLは';
	@override String get copy_to_clipboard => 'クリップボードにコピー';
	@override String get the_link_id_is => 'リンクIDは';
	@override String get link_id_copied_to_clipboard => 'リンクIDをクリップボードにコピーしました';
	@override String get the_link_password_is => 'リンクパスワードは';
	@override String get link_password_copied_to_clipboard => 'リンクパスワードをクリップボードにコピーしました';
	@override String get link_password_hint_text => 'パスワードをタップしてコピー\nこのリンクの統計を確認するために必要です';
	@override String get shorten_another_url => '別のURLを短縮';
	@override String get url_to_shorten => '短縮するURL';
	@override String by_clicking_you_accept({required Object url}) => '短縮ボタンをタップすると、以下のリンクから利用可能な "${url}" の利用規約に同意したことになります。';
	@override String get terms_of_service => '利用規約';
	@override String get shorten => '短縮';
	@override String get more_features => 'さらなる機能';
	@override String get more_features_message => '公式JTU.MEウェブサイトからテキスト共有、リンクインバイオプロフィールなどの追加機能を使用してください';
	@override String get open => '開く';
	@override String get options => 'オプション (任意)';
	@override String get access_password => 'アクセスパスワード';
	@override String get expiration_date => '有効期限 (UTC)';
	@override String get use_my_account => 'アカウントを使用する';
	@override String get email => 'メールアドレス';
	@override String get password => 'パスワード';
	@override String get no_account => 'アカウントをお持ちでない場合';
	@override String get no_account_message => '公式JTU.MEウェブサイトで無料アカウントを作成できます。';
	@override late final _TranslationsToolsUrlshortenerErrorJa error = _TranslationsToolsUrlshortenerErrorJa._(_root);
	@override String get management_info => '管理情報';
	@override String get manage_with_account => '統計情報を確認したり、このリンクを管理したりするには、公式サイトでJTU.MEアカウントをご利用ください。';
}

// Path: tools.counter
class _TranslationsToolsCounterJa implements TranslationsToolsCounterEn {
	_TranslationsToolsCounterJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'カウンター';
	@override String get add_button => 'ボタンを追加';
	@override String get remove_button => 'ボタンを削除';
	@override String get enter_number => '数値を入力';
	@override late final _TranslationsToolsCounterErrorJa error = _TranslationsToolsCounterErrorJa._(_root);
}

// Path: tools.bitwisecalculator
class _TranslationsToolsBitwisecalculatorJa implements TranslationsToolsBitwisecalculatorEn {
	_TranslationsToolsBitwisecalculatorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ビット演算電卓';
	@override String get binary_values => '2進数値';
	@override String get first_number => '1つ目の数';
	@override String get second_number => '2つ目の数';
	@override String get enter_a_binary_number => '2進数を入力';
	@override String get operations => '演算';
	@override String get and => 'AND';
	@override String get or => 'OR';
	@override String get xor => 'XOR';
	@override String get result => '結果';
	@override late final _TranslationsToolsBitwisecalculatorErrorJa error = _TranslationsToolsBitwisecalculatorErrorJa._(_root);
}

// Path: tools.musicsearch
class _TranslationsToolsMusicsearchJa implements TranslationsToolsMusicsearchEn {
	_TranslationsToolsMusicsearchJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '音楽検索';
	@override String get unknown_title => '不明なタイトル';
	@override String get unknown_artist => '不明なアーティスト';
	@override String get unknown_album => '不明なアルバム';
	@override String get loading => '読み込み中';
	@override String get loading_audio_preview => '音声プレビューを読み込み中...';
	@override String get stop_audio_preview => '音声プレビューを停止';
	@override String get data_source => 'データソース';
	@override String this_tool_uses_the_x_api({required Object service}) => 'このツールは音楽検索に "${service}" APIを使用しています。\n音声プレビューは "${service}" から提供されています。';
	@override String go_to_x({required Object service}) => '${service} へ';
	@override String get search_for_music => '音楽を検索';
	@override String use_the_searchbar_to_search_music({required Object service}) => '検索バーを使って音楽を検索してください。\n検索結果が出ない場合は別の検索ワードをお試しください。\nそれでも結果が出ない場合は、インターネット接続と ${service} がお住まいの国・地域で利用可能かどうかをご確認ください。';
	@override String open_in_x({required Object service}) => '${service} で開く';
	@override String get play_preview => 'プレビューを再生';
	@override late final _TranslationsToolsMusicsearchErrorJa error = _TranslationsToolsMusicsearchErrorJa._(_root);
}

// Path: tools.musicanalyser
class _TranslationsToolsMusicanalyserJa implements TranslationsToolsMusicanalyserEn {
	_TranslationsToolsMusicanalyserJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '音楽認識';
	@override String get press_the_button_to_start_music_analysis => 'ボタンを押して音楽認識を開始';
	@override String get loading => '読み込み中...';
	@override String analyzing_music({required Object remainingSeconds}) => '音楽を認識中... (${remainingSeconds}s)';
	@override String get getting_results => '結果を取得中...';
	@override String get unknown => '不明';
	@override String get api_used => '使用API';
	@override String this_tool_uses_the_x_api({required Object service, required Object company}) => 'このツールはKoizeayバックエンドサーバー経由で "${service}" APIを使用しています。"${service}" は "${company}" の登録商標であり、このツールとは無関係です。';
	@override String get start_analyzing_music => '音楽認識を開始';
	@override String get clear => 'クリア';
	@override late final _TranslationsToolsMusicanalyserErrorJa error = _TranslationsToolsMusicanalyserErrorJa._(_root);
}

// Path: tools.textdifferences
class _TranslationsToolsTextdifferencesJa implements TranslationsToolsTextdifferencesEn {
	_TranslationsToolsTextdifferencesJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'テキスト比較';
	@override String get old_text => '旧テキスト';
	@override String get new_text => '新テキスト';
	@override String get no_text_hint => '上のフィールドにテキストを入力すると差分が表示されます';
	@override String get enter_old_text => '旧テキストを入力...';
	@override String get enter_new_text => '新テキストを入力...';
}

// Path: tools.characterscopy
class _TranslationsToolsCharacterscopyJa implements TranslationsToolsCharacterscopyEn {
	_TranslationsToolsCharacterscopyJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '文字コピー';
	@override String get important => '重要';
	@override String get important_description => 'OSによっては一部の文字が正しく表示されないことがあります。またアプリやフォントによって対応していない文字もあります。コピーしたい文字をタップするとクリップボードにコピーされます。';
	@override String get copied_to_clipboard => 'クリップボードにコピーしました';
}

// Path: tools.whoisdomain
class _TranslationsToolsWhoisdomainJa implements TranslationsToolsWhoisdomainEn {
	_TranslationsToolsWhoisdomainJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'WHOISドメイン';
	@override String get domain_name => 'ドメイン名';
	@override String get whois_lookup => 'WHOIS検索';
	@override String get disclaimer => '免責事項';
	@override String get disclaimer_text => 'ToolboxはWHOISクエリ機能を情報提供のみを目的として提供しています。取得したデータは正確・完全・最新でない場合があり、各ドメインレジストリの利用規約に従います。WHOISデータをスパム、不法行為、または自動データ収集に使用することは禁止されています。このツールを使用することで、適用される法律およびレジストリの利用規約を遵守することに同意したものとみなされます。Toolboxおよびまたはkoizeayはデータの誤り、欠落、または不正使用について責任を負いません。一部のTLDはこのツールで対応していない場合があります。';
	@override String get loading => '読み込み中...';
	@override String get ip_address_not_supported => 'IPアドレスは非対応';
	@override String get ip_address_not_supported_description => 'このツールはドメイン名のみ対応しており、IPアドレスには対応していません';
	@override String get no_result => '有効な結果が見つかりません';
	@override String get view_pretty => '整形表示';
	@override String get view_raw => '生データ表示';
	@override String get raw_whois_data => '生WHOISデータ';
	@override String get domain => 'ドメイン';
	@override String get registrar => 'レジストラ';
	@override String get dates => '日付';
	@override String get status => 'ステータス';
	@override String get name_servers => 'ネームサーバー';
	@override String get contact => '連絡先';
	@override String get other => 'その他';
	@override late final _TranslationsToolsWhoisdomainErrorJa error = _TranslationsToolsWhoisdomainErrorJa._(_root);
}

// Path: tools.textcounter
class _TranslationsToolsTextcounterJa implements TranslationsToolsTextcounterEn {
	_TranslationsToolsTextcounterJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'テキストカウンター';
	@override String get clear => 'クリア';
	@override String get enter_text_here => 'テキストを入力';
	@override String get length => '長さ';
	@override String get trimmed_length => 'トリム後の長さ';
	@override String get raw_length => '元の長さ';
	@override String get letters => '文字';
	@override String get words => '単語';
	@override String get spaces => 'スペース';
	@override String get digits => '数字';
	@override String get lines => '行';
	@override String get empty_lines => '空行';
	@override String get total_lines => '合計行数';
	@override String get text_input => 'テキスト入力';
}

// Path: tools.romannumeral
class _TranslationsToolsRomannumeralJa implements TranslationsToolsRomannumeralEn {
	_TranslationsToolsRomannumeralJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ローマ数字';
	@override String get change_to => '変換先';
	@override String get roman_numeral => 'ローマ数字';
	@override String get number => '数値';
	@override String get number_input_hint => '数値';
	@override String get roman_numeral_input_hint => 'ローマ数字';
	@override String get tap_to_copy => 'タップしてコピー';
	@override String get copied_to_clipboard => 'クリップボードにコピーしました';
	@override late final _TranslationsToolsRomannumeralErrorJa error = _TranslationsToolsRomannumeralErrorJa._(_root);
}

// Path: tools.areacalculator
class _TranslationsToolsAreacalculatorJa implements TranslationsToolsAreacalculatorEn {
	_TranslationsToolsAreacalculatorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '面積計算';
	@override String get select_a_shape => '形状を選択';
	@override String get values => '値';
	@override String get area => '面積';
	@override String get calculate => '計算';
	@override late final _TranslationsToolsAreacalculatorShapesJa shapes = _TranslationsToolsAreacalculatorShapesJa._(_root);
	@override late final _TranslationsToolsAreacalculatorInputsJa inputs = _TranslationsToolsAreacalculatorInputsJa._(_root);
	@override late final _TranslationsToolsAreacalculatorErrorJa error = _TranslationsToolsAreacalculatorErrorJa._(_root);
}

// Path: tools.mathtex
class _TranslationsToolsMathtexJa implements TranslationsToolsMathtexEn {
	_TranslationsToolsMathtexJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'MathTeX';
	@override String get enter_a_mathematical_expression_in_tex_format => 'TeX形式で数式を入力';
	@override String get texExpression => 'TeX式';
	@override String get export_to_image => '画像として出力';
	@override String get preview => 'プレビュー';
	@override String get color => '色';
	@override String get get_help => 'ヘルプ';
	@override String get open_help_website => 'ヘルプサイトを開く';
	@override String get help_content => 'TeX形式で数式を入力すると数学的な数式として表示されます。例えば、TeX式 \'\\frac{a}{b}\' は \'a\' を \'b\' で割った分数として表示されます。サポートされているTeX構文を使って複雑な数式を作成できます。式を入力したらプレビューしてSVGファイルとして出力できます。\nMathJaxのTeX形式に対応しています。';
	@override String get copied_to_clipboard => 'クリップボードにコピーしました';
	@override late final _TranslationsToolsMathtexErrorJa error = _TranslationsToolsMathtexErrorJa._(_root);
}

// Path: tools.compass
class _TranslationsToolsCompassJa implements TranslationsToolsCompassEn {
	_TranslationsToolsCompassJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'コンパス';
	@override late final _TranslationsToolsCompassErrorJa error = _TranslationsToolsCompassErrorJa._(_root);
}

// Path: tools.qrcreator
class _TranslationsToolsQrcreatorJa implements TranslationsToolsQrcreatorEn {
	_TranslationsToolsQrcreatorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'QRコード作成';
	@override String get qr_code_settings => 'QRコード設定';
	@override String get ecc_low => '低';
	@override String get ecc_medium => '中';
	@override String get ecc_quartile => '中高';
	@override String get ecc_high => '高';
	@override String get saved_successfully => 'QRコードを保存しました';
	@override String get shared_successfully => 'QRコードを共有しました';
	@override String get enter_text_or_url => 'テキストまたはURLを入力';
	@override String get error_correction_level => '誤り訂正レベル';
	@override String get create => '作成';
	@override String get generated_qr_code => '生成したQRコード';
	@override String get save => '保存';
	@override String get share => '共有';
	@override late final _TranslationsToolsQrcreatorErrorJa error = _TranslationsToolsQrcreatorErrorJa._(_root);
}

// Path: tools.pastebin
class _TranslationsToolsPastebinJa implements TranslationsToolsPastebinEn {
	_TranslationsToolsPastebinJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pastebin';
	@override String get url => 'URL';
	@override String get qr_code => 'QRコード';
	@override String get share => '共有';
	@override String get share_dialog_message => '何を共有しますか？';
	@override String get your_short_link_is => '短縮リンクは';
	@override String get copy_to_clipboard => 'クリップボードにコピー';
	@override String get copied_to_clipboard => '短縮リンクをクリップボードにコピーしました';
	@override String get the_link_id_is => 'リンクIDは';
	@override String get link_id_copied_to_clipboard => 'リンクIDをクリップボードにコピーしました';
	@override String get the_link_password_is => 'リンクパスワードは';
	@override String get link_password_copied_to_clipboard => 'リンクパスワードをクリップボードにコピーしました';
	@override String get link_password_hint_text => 'パスワードをタップしてコピー\nこのリンクの統計を確認するために必要です';
	@override String get paste_another_text => '別のテキストを貼り付け';
	@override String get text_to_paste => '貼り付けるテキスト';
	@override String get text_paste_field_hint => 'テキスト、ソースコード、その他のコンテンツをここに貼り付けてください';
	@override String by_clicking_you_accept({required Object url}) => '送信ボタンをタップすると、以下のリンクから利用可能な "${url}" の利用規約に同意したことになります。';
	@override String get terms_of_service => '利用規約';
	@override String get send => '送信';
	@override String get more_features => 'さらなる機能';
	@override String get more_features_message => '公式JTU.MEウェブサイトからURL短縮、リンクインバイオプロフィールなどの追加機能を使用してください';
	@override String get open => '開く';
	@override String get options => 'オプション (任意)';
	@override String get access_password => 'アクセスパスワード';
	@override String get expiration_date => '有効期限 (UTC)';
	@override String get use_my_account => 'アカウントを使用する';
	@override String get email => 'メールアドレス';
	@override String get password => 'パスワード';
	@override String get no_account => 'アカウントをお持ちでない場合';
	@override String get no_account_message => '公式JTU.MEウェブサイトで無料アカウントを作成して、リンクやペーストを管理できます。';
	@override late final _TranslationsToolsPastebinErrorJa error = _TranslationsToolsPastebinErrorJa._(_root);
	@override String get management_info => '管理情報';
	@override String get manage_with_account => '統計情報を確認したり、このリンクを管理したりするには、公式サイトでJTU.MEアカウントをご利用ください。';
}

// Path: tools.percentagecalculator
class _TranslationsToolsPercentagecalculatorJa implements TranslationsToolsPercentagecalculatorEn {
	_TranslationsToolsPercentagecalculatorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'パーセント計算';
	@override String get result => '結果';
	@override String get percentage => 'パーセント';
	@override String get eg => '例)';
	@override String get total => '合計';
	@override String get first_value => '1つ目の値';
	@override String get second_value => '2つ目の値';
	@override String get what_is => '何パーセント？';
	@override String get of => 'の';
	@override String get is_what_percentage_of => '割合を求める';
	@override String get what_is_the_percentage_difference => 'パーセントの差は';
	@override String get from => 'から';
	@override String get to => 'まで';
	@override String get calculate => '計算';
	@override late final _TranslationsToolsPercentagecalculatorErrorJa error = _TranslationsToolsPercentagecalculatorErrorJa._(_root);
}

// Path: tools.passwordgenerator
class _TranslationsToolsPasswordgeneratorJa implements TranslationsToolsPasswordgeneratorEn {
	_TranslationsToolsPasswordgeneratorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'パスワードジェネレーター';
	@override String get password_length => 'パスワードの長さ';
	@override String get number_of_digits => '数字の数';
	@override String get number_of_special_characters => '特殊文字の数';
	@override String get generate_password => 'パスワードを生成';
	@override String get password_copied_to_clipboard => 'パスワードをクリップボードにコピーしました';
	@override String get tap_to_copy => 'タップしてコピー';
	@override late final _TranslationsToolsPasswordgeneratorErrorJa error = _TranslationsToolsPasswordgeneratorErrorJa._(_root);
	@override String get generated_password => '生成されたパスワード';
}

// Path: tools.portscanner
class _TranslationsToolsPortscannerJa implements TranslationsToolsPortscannerEn {
	_TranslationsToolsPortscannerJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ポートスキャナー';
	@override String get host_to_scan => 'スキャンするホスト';
	@override String get start_port => '開始ポート';
	@override String get end_port => '終了ポート';
	@override String get start_scan => 'スキャン開始';
	@override String get stop_scan => 'スキャン停止';
	@override String get port => 'ポート';
	@override late final _TranslationsToolsPortscannerErrorJa error = _TranslationsToolsPortscannerErrorJa._(_root);
	@override String get example_domain_or_ip => 'example.com または 192.168.1.1';
	@override String get port_range => 'ポート範囲';
	@override String get scan_progress => 'スキャン進捗';
}

// Path: tools.commons
class _TranslationsToolsCommonsJa implements TranslationsToolsCommonsEn {
	_TranslationsToolsCommonsJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Commons';
	@override String get data_source_and_licensing => 'データソースとライセンス';
	@override String get data_source_and_licensing_description => 'すべてのメディアファイルはWikimedia Commonsから提供されており、各ライセンスに従います。メディアファイルを使用・ダウンロードする際は各ライセンスの条件を遵守してください。';
	@override String get open_wikimedia_commons => 'Wikimedia Commonsを開く';
	@override String get search_files => 'ファイルを検索';
	@override String get enter_search_query_to_find_files => 'Wikimedia Commons上のメディアファイルを検索するキーワードを入力してください';
	@override String get view_on_wikimedia => 'Wikimedia Commonsで見る';
	@override String get previous => '前へ';
	@override String get next => '次へ';
	@override String get bytes => 'B';
	@override String get kilobytes => 'KB';
	@override String get megabytes => 'MB';
	@override String get gigabytes => 'GB';
	@override String get no_files_found => 'ファイルが見つかりません';
	@override String get close_preview => 'プレビューを閉じる';
	@override String get view_license_details => 'ライセンス詳細を見る';
	@override String get download_media => 'メディアをダウンロード';
	@override String get close => '閉じる';
	@override String get file_information => 'ファイル情報';
	@override String get unknown_license => '不明なライセンス';
	@override String get mime_type => 'MIMEタイプ';
	@override String get file_size => 'ファイルサイズ';
	@override String get dimensions => '縦横サイズ';
	@override String get duration => '長さ';
	@override String get file_license => 'ファイルライセンス';
	@override String get file_by => '作成者';
	@override String get file_downloaded_successfully => 'ファイルをダウンロードしました';
	@override String get downloading => 'ダウンロード中...';
	@override late final _TranslationsToolsCommonsErrorJa error = _TranslationsToolsCommonsErrorJa._(_root);
	@override String get load_preview => 'プレビューを読み込む';
	@override String page({required Object number}) => 'ページ ${number}';
}

// Path: tools.crdeck
class _TranslationsToolsCrdeckJa implements TranslationsToolsCrdeckEn {
	_TranslationsToolsCrdeckJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Clash Royaleデッキ';
	@override String get clear_unlocked_deck_cards => '未固定カードをクリア';
	@override String get about_and_credits => '概要とクレジット';
	@override String get about_and_credits_description => 'このツールはSupercell（Koizeayバックエンドサーバー経由）が提供する公式Clash Royale APIを使用しています。このツールはSupercellとは一切関係ありません。画像、名前、商標などを含むすべてのClash RoyaleのコンテンツはSupercellの所有物です。';
	@override String get supercell_website => 'Supercellウェブサイト';
	@override String get no_deck => 'デッキなし';
	@override String get generate_new_deck => '新しいデッキを生成';
	@override String get open_deck_in_clash_royale => 'Clash Royaleでデッキを開く';
	@override String get share_deck => 'デッキを共有';
	@override String get search_cards => 'カードを検索';
	@override String get import_cards_from_player_profile => 'プレイヤープロフィールからカードをインポート';
	@override String get deselect_all_cards => 'すべてのカードの選択を解除';
	@override String get select_all_cards => 'すべてのカードを選択';
	@override String x_elixirs({required Object elixirs}) => '${elixirs} エリクサー';
	@override String get player_tag => 'プレイヤータグ';
	@override String get import => 'インポート';
	@override String get importing_cards => 'カードをインポート中...';
	@override String share_deck_text_message({required Object url}) => 'Toolboxで作ったClash Royaleのデッキをチェックしてね！\nこのリンクからClash Royaleで開いてみて: ${url}';
	@override late final _TranslationsToolsCrdeckErrorJa error = _TranslationsToolsCrdeckErrorJa._(_root);
}

// Path: tools.iplocation
class _TranslationsToolsIplocationJa implements TranslationsToolsIplocationEn {
	_TranslationsToolsIplocationJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'IPアドレスの位置情報';
	@override String get api_used => '使用API';
	@override String get about_the_api => 'APIについて';
	@override String about_the_api_description({required Object source}) => 'このツールは指定されたIPアドレスの位置情報を取得するために "${source}" のAPIを使用しています';
	@override String get visit_website => 'ウェブサイトにアクセス';
	@override String get ip_address => 'IPアドレス';
	@override String get get_ip_location => '位置情報を取得';
	@override String get location_information => '位置情報';
	@override String get n_a => 'N/A';
	@override String get country => '国';
	@override String get provider => 'プロバイダー';
	@override late final _TranslationsToolsIplocationErrorJa error = _TranslationsToolsIplocationErrorJa._(_root);
}

// Path: credits.translations
class _TranslationsCreditsTranslationsJa implements TranslationsCreditsTranslationsEn {
	_TranslationsCreditsTranslationsJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '翻訳';
	@override String english({required Object author}) => '英語: ${author}';
	@override String french({required Object author}) => 'フランス語: ${author}';
	@override String japanese({required Object author}) => '日本語: ${author}';
}

// Path: tools.megaphone.error
class _TranslationsToolsMegaphoneErrorJa implements TranslationsToolsMegaphoneErrorEn {
	_TranslationsToolsMegaphoneErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get microphone_permission_denied => '権限が拒否されました。デバイスの設定でアプリのマイクアクセスを許可してください';
}

// Path: tools.nslookup.error
class _TranslationsToolsNslookupErrorJa implements TranslationsToolsNslookupErrorEn {
	_TranslationsToolsNslookupErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get please_enter_a_domain_name => 'ドメイン名を入力してください';
	@override String get no_address_associated_with_domain => 'ホスト名に関連するアドレスがありません。\n入力内容とインターネット接続を確認して再試行してください。';
}

// Path: tools.ping.error
class _TranslationsToolsPingErrorJa implements TranslationsToolsPingErrorEn {
	_TranslationsToolsPingErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get please_enter_a_domain_name_or_ip => 'ドメイン名またはIPアドレスを入力してください';
	@override String get request_timeout => 'リクエストタイムアウト';
	@override String get unkown_host => '不明なホスト';
	@override String get no_reply => '応答なし';
	@override String get unkown_error => '不明なエラー';
}

// Path: tools.soundmeter.error
class _TranslationsToolsSoundmeterErrorJa implements TranslationsToolsSoundmeterErrorEn {
	_TranslationsToolsSoundmeterErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get impossible_to_start_the_sound_meter => '騒音計を開始できません';
	@override String get no_sound_detected => '音が検出されません。デバイスの設定でアプリのマイクアクセスを確認してください。';
}

// Path: tools.qrreader.error
class _TranslationsToolsQrreaderErrorJa implements TranslationsToolsQrreaderErrorEn {
	_TranslationsToolsQrreaderErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get no_qr_code => 'QRコードなし';
	@override String get error_no_result => '結果が見つかりません';
}

// Path: tools.roulette.warning
class _TranslationsToolsRouletteWarningJa implements TranslationsToolsRouletteWarningEn {
	_TranslationsToolsRouletteWarningJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String you_cant_add_more_than_x_items({required Object numberOfItems}) => 'ルーレットには ${numberOfItems} 件以上追加できません。';
	@override String you_must_have_at_least_x_items({required Object numberOfItems}) => 'ルーレットには最低 ${numberOfItems} 件必要です。';
	@override String get you_must_enter_an_item_name => 'アイテム名を入力してください。';
}

// Path: tools.randomnumber.error
class _TranslationsToolsRandomnumberErrorJa implements TranslationsToolsRandomnumberErrorEn {
	_TranslationsToolsRandomnumberErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get invalid_number => '無効な数値です。再試行してください。';
	@override String get min_must_be_lower_than_max => '最小値は最大値より小さくする必要があります。';
	@override String min_and_max_must_be_between_x_and_y({required Object minNumberLimit, required Object maxNumberLimit}) => '最小値と最大値は ${minNumberLimit} から ${maxNumberLimit} の間にする必要があります。';
}

// Path: tools.sshclient.error
class _TranslationsToolsSshclientErrorJa implements TranslationsToolsSshclientErrorEn {
	_TranslationsToolsSshclientErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get invalid_port => '無効なポート';
	@override String get invalid_passphrase => '鍵が暗号化されていないのにパスフレーズを入力したか、またはその逆の可能性があります';
	@override String get invalid_private_key => '指定された鍵は有効な秘密鍵ではありません';
	@override String get authentication_failed => '認証に失敗しました';
	@override String get connection_failed => 'ホストに接続できませんでした';
	@override String get unknown_error => '不明なエラーが発生しました。再試行してください';
}

// Path: tools.uuidgenerator.error
class _TranslationsToolsUuidgeneratorErrorJa implements TranslationsToolsUuidgeneratorErrorEn {
	_TranslationsToolsUuidgeneratorErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get invalid_namespace => '名前空間が有効なUUIDではありません';
}

// Path: tools.texttospeech.error
class _TranslationsToolsTexttospeechErrorJa implements TranslationsToolsTexttospeechErrorEn {
	_TranslationsToolsTexttospeechErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get please_try_again => '後でもう一度試してください。\nこの言語を初めて使用する場合は、数秒待ってから再試行してください。';
	@override String get please_select_a_language => '言語を選択してください';
}

// Path: tools.nearbypublictransportstops.error
class _TranslationsToolsNearbypublictransportstopsErrorJa implements TranslationsToolsNearbypublictransportstopsErrorEn {
	_TranslationsToolsNearbypublictransportstopsErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get location_permission_denied => '位置情報の権限が拒否または無効です。設定で有効にして近くの停留所を表示してください。';
	@override String get check_internet_connection => 'インターネット接続を確認して再試行してください。';
	@override String get api_empty_response => 'APIが空のレスポンスを返しました';
	@override String api_error_xxx({required Object errorCode}) => 'APIがエラーを返しました: ${errorCode}';
	@override String get no_stops_found => 'この検索では停留所が見つかりませんでした';
	@override String get no_maps_app => 'デバイスに地図アプリが見つかりません';
}

// Path: tools.fileencryption.error
class _TranslationsToolsFileencryptionErrorJa implements TranslationsToolsFileencryptionErrorEn {
	_TranslationsToolsFileencryptionErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get failed_to_read_file => 'ファイルの読み込みに失敗しました';
	@override String get failed_to_decrypt_file => 'ファイルの復号化に失敗しました。パスワードを確認してください';
	@override String get please_enter_a_password => 'パスワードを入力してください';
}

// Path: tools.youtubethumbnail.error
class _TranslationsToolsYoutubethumbnailErrorJa implements TranslationsToolsYoutubethumbnailErrorEn {
	_TranslationsToolsYoutubethumbnailErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get failed_to_download => 'YouTubeからサムネイルのダウンロードに失敗しました';
	@override String get please_enter_a_valid_video_id => '有効なYouTube動画URLを入力してください\nサムネイルのダウンロードにはインターネット接続も必要です';
}

// Path: tools.nationalanthems.error
class _TranslationsToolsNationalanthemsErrorJa implements TranslationsToolsNationalanthemsErrorEn {
	_TranslationsToolsNationalanthemsErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get failed_to_load_list => '国歌リストを読み込めません。インターネット接続を確認して再試行してください。';
	@override String get failed_to_play_anthem => '国歌を再生できません。インターネット接続を確認して再試行してください。';
}

// Path: tools.httprequest.error
class _TranslationsToolsHttprequestErrorJa implements TranslationsToolsHttprequestErrorEn {
	_TranslationsToolsHttprequestErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get url_cannot_be_empty => 'URLを入力してください';
	@override String get invalid_url => '無効なURL';
	@override String get invalid_headers => '無効なヘッダー';
	@override String get timeout => 'リクエストがタイムアウトしました。\n入力内容とインターネット接続を確認して再試行してください。';
	@override String get other_error => 'リクエスト送信中にエラーが発生しました。\n入力内容とインターネット接続を確認して再試行してください。';
}

// Path: tools.osm.error
class _TranslationsToolsOsmErrorJa implements TranslationsToolsOsmErrorEn {
	_TranslationsToolsOsmErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get location_permission_denied => 'この機能を使用するには位置情報の許可が必要です';
	@override String get location_services_disabled => '位置情報サービスが無効です';
}

// Path: tools.gameoflife.error
class _TranslationsToolsGameoflifeErrorJa implements TranslationsToolsGameoflifeErrorEn {
	_TranslationsToolsGameoflifeErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get no_alive_cells => '生存セルなし';
	@override String get no_alive_cells_description => '生存セルがありません。\nグリッドをタップして追加してください。';
	@override String get please_stop_simulation => '先にシミュレーションを停止してください';
}

// Path: tools.speedometer.error
class _TranslationsToolsSpeedometerErrorJa implements TranslationsToolsSpeedometerErrorEn {
	_TranslationsToolsSpeedometerErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get location_permission_denied_title => '位置情報が必要';
	@override String get location_permission_denied_description => 'このツールは速度を測定するために位置情報の許可が必要です。';
	@override String get location_services_disabled_title => '位置情報サービスが無効';
	@override String get location_services_disabled_description => 'このツールは速度を測定するために位置情報サービスの有効化が必要です。';
}

// Path: tools.mc_server_ping.error
class _TranslationsToolsMcServerPingErrorJa implements TranslationsToolsMcServerPingErrorEn {
	_TranslationsToolsMcServerPingErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get please_enter_a_server_ip => 'サーバーIPまたはドメインを入力してください';
	@override String get server_offline_or_does_not_exist => 'サーバーはオフラインか存在しません';
	@override String get please_check_your_internet_connection => 'インターネット接続を確認して再試行してください';
}

// Path: tools.timestampconverter.error
class _TranslationsToolsTimestampconverterErrorJa implements TranslationsToolsTimestampconverterErrorEn {
	_TranslationsToolsTimestampconverterErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get invalid_timestamp => '無効なタイムスタンプ';
}

// Path: tools.urlshortener.error
class _TranslationsToolsUrlshortenerErrorJa implements TranslationsToolsUrlshortenerErrorEn {
	_TranslationsToolsUrlshortenerErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get failed_to_shorten_url => 'URLの短縮に失敗しました。入力内容とインターネット接続を確認してください。';
	@override String get impossible_to_connect_to_the_server => 'サーバーに接続できません';
	@override String get impossible_to_connect_to_the_server_message => 'サーバーへの接続に失敗しました。インターネット接続を確認して再試行してください。';
	@override String get unauthorized => '認証に失敗しました。認証情報を確認してください。';
	@override String get invalid_expiration_date => '有効期限は未来の日付である必要があります。';
}

// Path: tools.counter.error
class _TranslationsToolsCounterErrorJa implements TranslationsToolsCounterErrorEn {
	_TranslationsToolsCounterErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get invalid_number => '入力した数値が無効です';
	@override String the_number_must_be_between_x_and_y({required Object minNumberLimit, required Object maxNumberLimit}) => '数値は ${minNumberLimit} から ${maxNumberLimit} の間にする必要があります';
	@override String get you_must_have_at_least_one_button => 'ボタンが最低1つ必要です';
	@override String get this_button_already_exists => 'このボタンはすでに存在します';
}

// Path: tools.bitwisecalculator.error
class _TranslationsToolsBitwisecalculatorErrorJa implements TranslationsToolsBitwisecalculatorErrorEn {
	_TranslationsToolsBitwisecalculatorErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get invalid_input => '無効な入力';
}

// Path: tools.musicsearch.error
class _TranslationsToolsMusicsearchErrorJa implements TranslationsToolsMusicsearchErrorEn {
	_TranslationsToolsMusicsearchErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get error_playing_audio_preview => '音声プレビューの再生エラー。後でもう一度試してください。';
	@override String get unable_to_connect_to_the_api => 'APIに接続できません。インターネット接続を確認して再試行してください。';
}

// Path: tools.musicanalyser.error
class _TranslationsToolsMusicanalyserErrorJa implements TranslationsToolsMusicanalyserErrorEn {
	_TranslationsToolsMusicanalyserErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get permission_denied => '権限が拒否されました';
	@override String get permission_denied_description => '音楽の認識にはマイクの許可が必要です。許可を付与して再試行してください。';
	@override String get no_match_found => '一致なし';
	@override String get no_match_found_description => '音楽の一致が見つかりませんでした。再試行してください。';
	@override String get error_occurred => '音楽の認識中にエラーが発生しました。インターネット接続を確認して再試行してください。';
	@override String get please_update_the_app_and_try_again => 'アプリをアップデートして再試行してください。最新版でも問題が続く場合は、後でもう一度試してください。';
}

// Path: tools.whoisdomain.error
class _TranslationsToolsWhoisdomainErrorJa implements TranslationsToolsWhoisdomainErrorEn {
	_TranslationsToolsWhoisdomainErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get impossible_to_get_whois_information => 'WHOIS情報を取得できません。入力内容とインターネット接続を確認して再試行してください';
}

// Path: tools.romannumeral.error
class _TranslationsToolsRomannumeralErrorJa implements TranslationsToolsRomannumeralErrorEn {
	_TranslationsToolsRomannumeralErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get invalid_roman_numeral => '無効またはサポートされていないローマ数字';
}

// Path: tools.areacalculator.shapes
class _TranslationsToolsAreacalculatorShapesJa implements TranslationsToolsAreacalculatorShapesEn {
	_TranslationsToolsAreacalculatorShapesJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get circle => '円';
	@override String get ellipse => '楕円';
	@override String get equilateral_triangle => '正三角形';
	@override String get kite => '凧形';
	@override String get parallelogram => '平行四辺形';
	@override String get rectangle => '長方形';
	@override String get rhombus => '菱形';
	@override String get regular_hexagon => '正六角形';
	@override String get regular_octagon => '正八角形';
	@override String get regular_pentagon => '正五角形';
	@override String get regular_polygon => '正多角形';
	@override String get square => '正方形';
	@override String get trapezoid => '台形';
	@override String get triangle => '三角形';
}

// Path: tools.areacalculator.inputs
class _TranslationsToolsAreacalculatorInputsJa implements TranslationsToolsAreacalculatorInputsEn {
	_TranslationsToolsAreacalculatorInputsJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get radius => '半径';
	@override String get major_axis => '長軸';
	@override String get minor_axis => '短軸';
	@override String get side => '辺';
	@override String get base => '底辺';
	@override String get height => '高さ';
	@override String get diagonal_1 => '対角線1';
	@override String get diagonal_2 => '対角線2';
	@override String get length => '長さ';
	@override String get width => '幅';
	@override String get number_of_sides => '辺の数';
	@override String get side_length => '辺の長さ';
	@override String get apothem => 'アポテム';
	@override String get base_1 => '底辺1';
	@override String get base_2 => '底辺2';
}

// Path: tools.areacalculator.error
class _TranslationsToolsAreacalculatorErrorJa implements TranslationsToolsAreacalculatorErrorEn {
	_TranslationsToolsAreacalculatorErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get invalid_input => '無効な入力';
	@override String get please_enter_a_value_for => '値を入力してください';
	@override String get please_enter_a_valid_number_for => '有効な数値を入力してください';
	@override String get please_enter_a_positive_number_for => '正の数値を入力してください';
	@override String get please_try_again_with_different_values => '別の値で再試行してください';
	@override String get the_area_of_the_shape_is_zero => 'この形状の面積はゼロです';
}

// Path: tools.mathtex.error
class _TranslationsToolsMathtexErrorJa implements TranslationsToolsMathtexErrorEn {
	_TranslationsToolsMathtexErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get an_error_occurred_while_rendering_the_mathtex => 'MathTeXのレンダリング中にエラーが発生しました';
	@override String get please_wait_until_the_preview_is_loaded => 'プレビューが読み込まれるまでお待ちください';
	@override String get an_error_occurred_while_exporting_the_image => '画像の出力中にエラーが発生しました';
	@override String get could_not_open_help_website => 'ヘルプサイトを開けませんでした。設定を確認して再試行してください';
}

// Path: tools.compass.error
class _TranslationsToolsCompassErrorJa implements TranslationsToolsCompassErrorEn {
	_TranslationsToolsCompassErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get please_grant_location_permission => 'コンパスを使用するには位置情報の許可が必要です。デバイスのセンサーにアクセスするために必須です。';
}

// Path: tools.qrcreator.error
class _TranslationsToolsQrcreatorErrorJa implements TranslationsToolsQrcreatorErrorEn {
	_TranslationsToolsQrcreatorErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get failed_to_create_qr_code => 'QRコードの作成に失敗しました。入力内容を確認して再試行してください';
}

// Path: tools.pastebin.error
class _TranslationsToolsPastebinErrorJa implements TranslationsToolsPastebinErrorEn {
	_TranslationsToolsPastebinErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get failed_to_obtain_short_link => '短縮リンクの取得に失敗しました。インターネット接続を確認して再試行してください';
	@override String get impossible_to_connect_to_the_server => 'サーバーに接続できません';
	@override String get impossible_to_connect_to_the_server_message => 'サーバーへの接続に失敗しました。インターネット接続を確認して再試行してください。';
	@override String get unauthorized => '認証に失敗しました。認証情報を確認してください。';
	@override String get invalid_expiration_date => '有効期限は未来の日付である必要があります。';
}

// Path: tools.percentagecalculator.error
class _TranslationsToolsPercentagecalculatorErrorJa implements TranslationsToolsPercentagecalculatorErrorEn {
	_TranslationsToolsPercentagecalculatorErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get please_enter_valid_numbers_for_both_fields => '両方のフィールドに有効な数値を入力してください';
	@override String get total_cannot_be_zero => '合計はゼロにできません';
	@override String get first_value_cannot_be_zero => '1つ目の値はゼロにできません';
}

// Path: tools.passwordgenerator.error
class _TranslationsToolsPasswordgeneratorErrorJa implements TranslationsToolsPasswordgeneratorErrorEn {
	_TranslationsToolsPasswordgeneratorErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get password_length_must_be_greater_than_0 => 'パスワードの長さは0より大きくする必要があります';
	@override String password_length_cannot_exceed_x_characters({required Object maxLength}) => 'パスワードの長さは ${maxLength} 文字を超えることはできません';
	@override String get password_length_cannot_be_less_than_the_sum_of_digits_and_special_characters => 'パスワードの長さは数字と特殊文字の合計より小さくできません';
}

// Path: tools.portscanner.error
class _TranslationsToolsPortscannerErrorJa implements TranslationsToolsPortscannerErrorEn {
	_TranslationsToolsPortscannerErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get please_enter_a_valid_host => '有効なホストを入力してください';
	@override String get please_enter_a_valid_port_number => '両方のフィールドに有効なポート番号（1-65535）を入力してください';
}

// Path: tools.commons.error
class _TranslationsToolsCommonsErrorJa implements TranslationsToolsCommonsErrorEn {
	_TranslationsToolsCommonsErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String error_downloading_file({required Object errorCode}) => 'ファイルのダウンロードエラー (${errorCode})';
	@override String get error_download_file_check_internet => 'ファイルのダウンロードエラー。インターネット接続を確認して再試行してください。';
}

// Path: tools.crdeck.error
class _TranslationsToolsCrdeckErrorJa implements TranslationsToolsCrdeckErrorEn {
	_TranslationsToolsCrdeckErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get please_check_your_internet_connection => 'インターネット接続を確認して再試行してください。';
	@override String get error_while_loading_cards_from_server => 'サーバーからClash Royaleカードの読み込み中にエラーが発生しました。\nネットワーク接続を確認して再試行してください。';
	@override String failed_to_load_cards_from_server({required Object errorCode}) => 'サーバーからのClash Royaleカードの読み込みに失敗しました (${errorCode})';
	@override String get invalid_tag => '無効なタグ';
	@override String get please_enter_a_valid_player_tag => '有効なプレイヤータグを入力してください';
	@override String failed_to_import_cards_from_player_profile({required Object errorCode}) => 'プレイヤープロフィールからのカードインポートに失敗しました (${errorCode})。手動でカードをインポートすることもできます';
	@override String get an_error_occurred_while_importing_cards => 'カードのインポート中にエラーが発生しました。手動でカードをインポートすることもできます';
	@override String get not_enough_cards_selected => '選択したカードが不足しています';
	@override String please_select_at_least_x_more_cards({required Object numberOfCards}) => '有効なデッキを作成するにはあと ${numberOfCards} 枚以上のカードを選択してください';
	@override String get deck_is_full => 'デッキが満杯';
	@override String you_can_only_add_up_to_x_cards_to_the_deck({required Object numberOfCards}) => 'デッキに追加できるカードは ${numberOfCards} 枚までです';
	@override String get card_already_in_deck => 'カードはすでにデッキにあります';
	@override String get this_card_is_already_in_the_deck => 'このカードはすでにデッキにあります';
	@override String get incomplete_deck => 'デッキが不完全';
	@override String please_add_x_more_cards_to_the_deck_before_opening_it_in_clash_royale({required Object numberOfCards}) => 'Clash Royaleで開く前にあと ${numberOfCards} 枚のカードをデッキに追加してください';
	@override String please_add_x_more_cards_to_the_deck_before_sharing_it({required Object numberOfCards}) => '共有する前にあと ${numberOfCards} 枚のカードをデッキに追加してください';
}

// Path: tools.iplocation.error
class _TranslationsToolsIplocationErrorJa implements TranslationsToolsIplocationErrorEn {
	_TranslationsToolsIplocationErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get ip_required => 'IPアドレスが必要です';
	@override String get please_enter_an_ip_address => '位置情報を取得するIPアドレスを入力してください';
	@override String get error_fetching_location => '位置情報の取得エラー';
	@override String get error_fetching_location_description => '位置情報の取得中にエラーが発生したようです。入力内容とインターネット接続を確認して再試行してください';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJa {
	dynamic _flatMapFunction(String path) {
		return _flatMapFunction$0(path)
			?? _flatMapFunction$1(path);
	}

	dynamic _flatMapFunction$0(String path) {
		switch (path) {
			case 'generic.app_name': return 'Toolbox';
			case 'generic.tools': return 'ツール';
			case 'generic.categories': return 'カテゴリ';
			case 'generic.error': return 'エラー';
			case 'generic.warning': return '警告';
			case 'generic.ok': return 'OK';
			case 'generic.cancel': return 'キャンセル';
			case 'generic.search': return '検索';
			case 'generic.enable': return '有効化';
			case 'generic.reset': return 'リセット';
			case 'generic.yes': return 'はい';
			case 'generic.no': return 'いいえ';
			case 'generic.copy': return 'コピー';
			case 'generic.share': return '共有';
			case 'generic.generate': return '生成';
			case 'homepage.update_available': return 'アップデートあり';
			case 'homepage.update_available_message': return 'Toolboxの新しいバージョンが利用可能です。今すぐアップデートして最新の機能と改善を入手してください。';
			case 'homepage.switch_view': return '表示切替';
			case 'homepage.search_all_categories': return 'すべてのカテゴリで検索';
			case 'homepage.clear_search': return '検索をクリア';
			case 'homepage.add': return '追加';
			case 'homepage.remove': return '削除';
			case 'homepage.favorites': return 'お気に入り';
			case 'homepage.would_you_like_to_add_this_tool_to_favorites': return 'このツールをお気に入りに追加しますか？';
			case 'homepage.would_you_like_to_remove_this_tool_from_favorites': return 'このツールをお気に入りから削除しますか？';
			case 'categories.audio': return 'オーディオ';
			case 'categories.calculations': return '計算';
			case 'categories.games': return 'ゲーム';
			case 'categories.geography': return '地理';
			case 'categories.miscellaneous': return 'その他';
			case 'categories.network': return 'ネットワーク';
			case 'categories.random': return 'ランダム';
			case 'categories.time': return '時間';
			case 'categories.web': return 'Web';
			case 'tools.baseconverter.title': return '進数変換';
			case 'tools.baseconverter.input': return '入力';
			case 'tools.baseconverter.results': return '結果';
			case 'tools.baseconverter.enter_a_dec_number': return '10進数を入力';
			case 'tools.baseconverter.enter_a_hex_number': return '16進数を入力';
			case 'tools.baseconverter.enter_a_bin_number': return '2進数を入力';
			case 'tools.baseconverter.enter_a_oct_number': return '8進数を入力';
			case 'tools.baseconverter.hexadecimal': return '16進数';
			case 'tools.baseconverter.binary': return '2進数';
			case 'tools.baseconverter.octal': return '8進数';
			case 'tools.baseconverter.decimal': return '10進数';
			case 'tools.baseconverter.incompatible_number': return '非対応の数値';
			case 'tools.baseconverter.too_big_number': return '数値が大きすぎます';
			case 'tools.baseconverter.the_number_you_entered_is_not_a_valid_x_number': return ({required Object base}) => '入力した数値は有効な ${base} 進数ではありません';
			case 'tools.baseconverter.the_number_you_entered_is_too_big_to_be_abble_to_convert_it': return '入力した数値は大きすぎて変換できません';
			case 'tools.clock.title': return '時計';
			case 'tools.clock.change_timezone': return 'タイムゾーンを変更';
			case 'tools.clock.timezone': return 'タイムゾーン';
			case 'tools.clock.choose_a_timezone': return 'タイムゾーンを選択';
			case 'tools.clock.select_local': return '現地時間';
			case 'tools.metronome.title': return 'メトロノーム';
			case 'tools.metronome.bpm': return 'BPM';
			case 'tools.metronome.beats_per_measure': return '1小節の拍数';
			case 'tools.metronome.start': return '開始';
			case 'tools.metronome.stop': return '停止';
			case 'tools.megaphone.title': return 'メガフォン';
			case 'tools.megaphone.error.microphone_permission_denied': return '権限が拒否されました。デバイスの設定でアプリのマイクアクセスを許可してください';
			case 'tools.nslookup.title': return 'NSLookup';
			case 'tools.nslookup.enter_a_domain_name': return 'ドメイン名を入力';
			case 'tools.nslookup.lookup': return '検索';
			case 'tools.nslookup.error.please_enter_a_domain_name': return 'ドメイン名を入力してください';
			case 'tools.nslookup.error.no_address_associated_with_domain': return 'ホスト名に関連するアドレスがありません。\n入力内容とインターネット接続を確認して再試行してください。';
			case 'tools.nslookup.not_supported_by_system_dns': return 'システムDNS非対応';
			case 'tools.nslookup.no_records_found': return 'レコードが見つかりません';
			case 'tools.ping.title': return 'Ping';
			case 'tools.ping.ping': return 'Ping';
			case 'tools.ping.enter_a_domain_name_or_ip': return 'ドメイン名またはIPアドレスを入力';
			case 'tools.ping.reply_from_host_time_ttl': return ({required Object host, required Object time, required Object ttl}) => '${host} からの応答: time=${time}ms TTL=${ttl}';
			case 'tools.ping.x_packets_transmitted_y': return ({required Object transmitted, required Object received}) => '${transmitted} パケット送信、${received} パケット受信';
			case 'tools.ping.error.please_enter_a_domain_name_or_ip': return 'ドメイン名またはIPアドレスを入力してください';
			case 'tools.ping.error.request_timeout': return 'リクエストタイムアウト';
			case 'tools.ping.error.unkown_host': return '不明なホスト';
			case 'tools.ping.error.no_reply': return '応答なし';
			case 'tools.ping.error.unkown_error': return '不明なエラー';
			case 'tools.soundmeter.title': return '騒音計';
			case 'tools.soundmeter.decibels': return 'dB';
			case 'tools.soundmeter.error.impossible_to_start_the_sound_meter': return '騒音計を開始できません';
			case 'tools.soundmeter.error.no_sound_detected': return '音が検出されません。デバイスの設定でアプリのマイクアクセスを確認してください。';
			case 'tools.qrreader.title': return 'QRリーダー';
			case 'tools.qrreader.scanned': return 'スキャン済み';
			case 'tools.qrreader.openurl': return 'リンクを開く';
			case 'tools.qrreader.copy_password': return 'パスワードをコピー';
			case 'tools.qrreader.copy': return 'コピー';
			case 'tools.qrreader.copied_to_clipboard': return 'クリップボードにコピーしました';
			case 'tools.qrreader.wifi': return 'WiFi';
			case 'tools.qrreader.wifi_ssid': return 'SSID';
			case 'tools.qrreader.wifi_password': return 'パスワード';
			case 'tools.qrreader.error.no_qr_code': return 'QRコードなし';
			case 'tools.qrreader.error.error_no_result': return '結果が見つかりません';
			case 'tools.timer.title': return 'タイマー';
			case 'tools.timer.start': return '開始';
			case 'tools.timer.stop': return '停止';
			case 'tools.timer.pause': return '一時停止';
			case 'tools.timer.please_stop_the_timer_first': return '先にタイマーを停止してください';
			case 'tools.timer.ios_warning_message': return 'iOSでタイマーを鳴らすには、アプリを終了したりiPhoneの画面をオフにしないでください。そうしないと、タイマーがゼロになったときにiOSが鳴らさなくなります。';
			case 'tools.timer.adjust_time': return '時間を調整';
			case 'tools.stopwatch.title': return 'ストップウォッチ';
			case 'tools.stopwatch.controls': return '操作';
			case 'tools.stopwatch.start': return '開始';
			case 'tools.stopwatch.stop': return '停止';
			case 'tools.stopwatch.reset': return 'リセット';
			case 'tools.stopwatch.laps': return 'ラップ';
			case 'tools.stopwatch.lap': return 'ラップ';
			case 'tools.roulette.title': return 'ルーレット';
			case 'tools.roulette.tap_to_roll_info': return 'ホイールをタップして回す';
			case 'tools.roulette.default_1': return '勉強';
			case 'tools.roulette.default_2': return '遊ぶ';
			case 'tools.roulette.default_3': return '寝る';
			case 'tools.roulette.add': return '追加';
			case 'tools.roulette.remove': return '削除';
			case 'tools.roulette.add_item': return 'アイテムを追加';
			case 'tools.roulette.item_name': return 'アイテム名';
			case 'tools.roulette.remove_an_item': return 'アイテムを削除';
			case 'tools.roulette.warning.you_cant_add_more_than_x_items': return ({required Object numberOfItems}) => 'ルーレットには ${numberOfItems} 件以上追加できません。';
			case 'tools.roulette.warning.you_must_have_at_least_x_items': return ({required Object numberOfItems}) => 'ルーレットには最低 ${numberOfItems} 件必要です。';
			case 'tools.roulette.warning.you_must_enter_an_item_name': return 'アイテム名を入力してください。';
			case 'tools.flipcoins.title': return 'コインを投げる';
			case 'tools.flipcoins.change_coin_currency': return 'コインの通貨を変更';
			case 'tools.randomnumber.title': return '乱数';
			case 'tools.randomnumber.settings': return '設定';
			case 'tools.randomnumber.min': return '最小';
			case 'tools.randomnumber.max': return '最大';
			case 'tools.randomnumber.error.invalid_number': return '無効な数値です。再試行してください。';
			case 'tools.randomnumber.error.min_must_be_lower_than_max': return '最小値は最大値より小さくする必要があります。';
			case 'tools.randomnumber.error.min_and_max_must_be_between_x_and_y': return ({required Object minNumberLimit, required Object maxNumberLimit}) => '最小値と最大値は ${minNumberLimit} から ${maxNumberLimit} の間にする必要があります。';
			case 'tools.randomcolor.title': return 'ランダムカラー';
			case 'tools.randomcolor.hint': return '色をタップして変更';
			case 'tools.randomcolor.tap_to_copy': return 'タップしてコピー';
			case 'tools.randomcolor.copied_to_clipboard': return 'クリップボードにコピーしました';
			case 'tools.sshclient.title': return 'SSHクライアント';
			case 'tools.sshclient.backspace': return 'バックスペース';
			case 'tools.sshclient.use_password': return 'パスワードを使用';
			case 'tools.sshclient.use_ssh_key': return 'SSHキーを使用';
			case 'tools.sshclient.connection': return '接続';
			case 'tools.sshclient.host': return 'ホスト';
			case 'tools.sshclient.port': return 'ポート';
			case 'tools.sshclient.username': return 'ユーザー名';
			case 'tools.sshclient.password': return 'パスワード';
			case 'tools.sshclient.ssh_key': return 'SSHキー';
			case 'tools.sshclient.connect': return '接続';
			case 'tools.sshclient.authentication': return '認証';
			case 'tools.sshclient.select_private_key': return '秘密鍵を選択';
			case 'tools.sshclient.no_private_key_selected': return '秘密鍵が選択されていません';
			case 'tools.sshclient.passphrase': return 'パスフレーズ（なければ空白のまま）';
			case 'tools.sshclient.error.invalid_port': return '無効なポート';
			case 'tools.sshclient.error.invalid_passphrase': return '鍵が暗号化されていないのにパスフレーズを入力したか、またはその逆の可能性があります';
			case 'tools.sshclient.error.invalid_private_key': return '指定された鍵は有効な秘密鍵ではありません';
			case 'tools.sshclient.error.authentication_failed': return '認証に失敗しました';
			case 'tools.sshclient.error.connection_failed': return 'ホストに接続できませんでした';
			case 'tools.sshclient.error.unknown_error': return '不明なエラーが発生しました。再試行してください';
			case 'tools.whiteboard.title': return 'ホワイトボード';
			case 'tools.whiteboard.share_success': return 'ホワイトボードを共有しました';
			case 'tools.whiteboard.save_success': return 'ホワイトボードを保存しました';
			case 'tools.networkinfo.title': return 'ネットワーク情報';
			case 'tools.networkinfo.loading': return '読み込み中...';
			case 'tools.networkinfo.unknown': return '不明';
			case 'tools.networkinfo.location_permission_required': return 'WiFi情報の一部取得には位置情報の許可が必要です（OS上の制限）。\n許可しない場合、正確な情報が取得できない場合があります。';
			case 'tools.networkinfo.public_ip': return 'パブリックIPアドレス';
			case 'tools.networkinfo.local_ip': return 'ローカルIPアドレス';
			case 'tools.networkinfo.local_subnet_mask': return 'ローカルネットワークサブネットマスク';
			case 'tools.networkinfo.local_gateway_ip': return 'ローカルネットワークゲートウェイIP';
			case 'tools.networkinfo.local_broadcast_ip': return 'ローカルネットワークブロードキャストIP';
			case 'tools.networkinfo.wifi_name': return 'WiFi名';
			case 'tools.networkinfo.wifi_bssid': return 'WiFi BSSID';
			case 'tools.networkinfo.not_available_on_ios': return 'iOSでは利用不可';
			case 'tools.networkinfo.note_location_permission': return '注意: 正確な位置情報の許可をしていない場合、一部の情報が正確でない場合があります。';
			case 'tools.uuidgenerator.title': return 'UUIDジェネレーター';
			case 'tools.uuidgenerator.generate': return '生成';
			case 'tools.uuidgenerator.default_uuid_text': return 'ボタンを押してUUIDを生成';
			case 'tools.uuidgenerator.tap_to_copy': return 'タップしてコピー';
			case 'tools.uuidgenerator.copied_to_clipboard': return 'クリップボードにコピーしました';
			case 'tools.uuidgenerator.v1_uuid': return 'v1（時刻ベース）';
			case 'tools.uuidgenerator.v4_uuid': return 'v4（ランダム）';
			case 'tools.uuidgenerator.v5_uuid': return 'v5（SHA1ベース）';
			case 'tools.uuidgenerator.v5_generate_title': return 'UUID v5を生成';
			case 'tools.uuidgenerator.v5_namespace': return '名前空間（ランダムにする場合は空白）';
			case 'tools.uuidgenerator.v5_name': return '名前（なければ空白）';
			case 'tools.uuidgenerator.error.invalid_namespace': return '名前空間が有効なUUIDではありません';
			case 'tools.texttospeech.title': return 'テキスト読み上げ';
			case 'tools.texttospeech.choose_a_language': return '言語を選択';
			case 'tools.texttospeech.text_to_speak': return '読み上げるテキスト';
			case 'tools.texttospeech.pitch': return 'ピッチ';
			case 'tools.texttospeech.rate': return '速度';
			case 'tools.texttospeech.play': return '再生';
			case 'tools.texttospeech.stop': return '停止';
			case 'tools.texttospeech.error.please_try_again': return '後でもう一度試してください。\nこの言語を初めて使用する場合は、数秒待ってから再試行してください。';
			case 'tools.texttospeech.error.please_select_a_language': return '言語を選択してください';
			case 'tools.nearbypublictransportstops.title': return '近くの交通機関';
			case 'tools.nearbypublictransportstops.loading': return '読み込み中...';
			case 'tools.nearbypublictransportstops.refresh': return '更新';
			case 'tools.nearbypublictransportstops.data_source': return 'データソース';
			case 'tools.nearbypublictransportstops.initial_dialog_title': return '案内';
			case 'tools.nearbypublictransportstops.initial_dialog_message': return ({required Object source}) => 'このツールはスイスでの使用を想定しています。"${source}" のデータを使用しています';
			case 'tools.nearbypublictransportstops.data_license_dialog_open': return '開く';
			case 'tools.nearbypublictransportstops.data_license_dialog_title': return 'データソース';
			case 'tools.nearbypublictransportstops.data_license_dialog_message': return ({required Object source, required Object url}) => 'このツールで使用するデータは "${source}" から提供されています。\n${url}';
			case 'tools.nearbypublictransportstops.no_departures': return '出発便なし';
			case 'tools.nearbypublictransportstops.departure': return '出発';
			case 'tools.nearbypublictransportstops.arrival': return '到着';
			case 'tools.nearbypublictransportstops.platform': return 'ホーム';
			case 'tools.nearbypublictransportstops.show_on_map': return '地図';
			case 'tools.nearbypublictransportstops.map_marker_title': return '停留所';
			case 'tools.nearbypublictransportstops.error.location_permission_denied': return '位置情報の権限が拒否または無効です。設定で有効にして近くの停留所を表示してください。';
			case 'tools.nearbypublictransportstops.error.check_internet_connection': return 'インターネット接続を確認して再試行してください。';
			case 'tools.nearbypublictransportstops.error.api_empty_response': return 'APIが空のレスポンスを返しました';
			case 'tools.nearbypublictransportstops.error.api_error_xxx': return ({required Object errorCode}) => 'APIがエラーを返しました: ${errorCode}';
			case 'tools.nearbypublictransportstops.error.no_stops_found': return 'この検索では停留所が見つかりませんでした';
			case 'tools.nearbypublictransportstops.error.no_maps_app': return 'デバイスに地図アプリが見つかりません';
			case 'tools.fileencryption.title': return 'ファイル暗号化';
			case 'tools.fileencryption.home_hint': return '暗号化するファイルを選択してください。復号化する場合は .aes 拡張子の暗号化済みファイルを選択してください';
			case 'tools.fileencryption.no_file_selected': return 'ファイルが選択されていません';
			case 'tools.fileencryption.enter_password': return 'パスワードを入力してください';
			case 'tools.fileencryption.file_saved_successfully': return 'ファイルを保存しました';
			case 'tools.fileencryption.pick_a_file': return 'ファイルを選択';
			case 'tools.fileencryption.encryption_password': return '暗号化パスワード';
			case 'tools.fileencryption.encrypt': return '暗号化';
			case 'tools.fileencryption.decrypt': return '復号化';
			case 'tools.fileencryption.error.failed_to_read_file': return 'ファイルの読み込みに失敗しました';
			case 'tools.fileencryption.error.failed_to_decrypt_file': return 'ファイルの復号化に失敗しました。パスワードを確認してください';
			case 'tools.fileencryption.error.please_enter_a_password': return 'パスワードを入力してください';
			case 'tools.fileencryption.enter_password_hint': return 'パスワードを入力...';
			case 'tools.fileencryption.file_selection': return 'ファイル選択';
			case 'tools.youtubethumbnail.title': return 'YouTubeサムネイル';
			case 'tools.youtubethumbnail.saved': return 'サムネイルをデバイスに保存しました';
			case 'tools.youtubethumbnail.youtube_video_id': return 'YouTube動画URL';
			case 'tools.youtubethumbnail.save_thumbnail': return 'サムネイルを保存';
			case 'tools.youtubethumbnail.please_enter_a_video_url': return 'YouTubeのサムネイルをダウンロードするためにURL（またはID）を入力してください';
			case 'tools.youtubethumbnail.error.failed_to_download': return 'YouTubeからサムネイルのダウンロードに失敗しました';
			case 'tools.youtubethumbnail.error.please_enter_a_valid_video_id': return '有効なYouTube動画URLを入力してください\nサムネイルのダウンロードにはインターネット接続も必要です';
			case 'tools.youtubethumbnail.thumbnail_preview': return 'サムネイルプレビュー';
			case 'tools.nationalanthems.title': return '国歌';
			case 'tools.nationalanthems.stop': return '国歌を停止';
			case 'tools.nationalanthems.search': return '検索（英語名）';
			case 'tools.nationalanthems.license': return 'ライセンス';
			case 'tools.nationalanthems.license_text': return ({required Object source, required Object license}) => '音声ファイルは "${source}" により ${license} ライセンスのもとで提供されています';
			case 'tools.nationalanthems.open': return '開く';
			case 'tools.nationalanthems.view_license': return 'ライセンスを見る';
			case 'tools.nationalanthems.loading_audio_title': return '読み込み中';
			case 'tools.nationalanthems.loading_audio_text': return '国歌を読み込んでいます。お待ちください...';
			case 'tools.nationalanthems.error.failed_to_load_list': return '国歌リストを読み込めません。インターネット接続を確認して再試行してください。';
			case 'tools.nationalanthems.error.failed_to_play_anthem': return '国歌を再生できません。インターネット接続を確認して再試行してください。';
			case 'tools.nationalanthems.no_anthems_found': return '国歌が見つかりません';
			case 'tools.httprequest.title': return 'HTTPリクエスト';
			case 'tools.httprequest.method': return 'メソッド';
			case 'tools.httprequest.custom_method': return 'カスタムメソッド';
			case 'tools.httprequest.url': return 'URL';
			case 'tools.httprequest.headers': return 'ヘッダー';
			case 'tools.httprequest.body': return 'ボディ';
			case 'tools.httprequest.allow_bad_certificates': return '無効な証明書を許可';
			case 'tools.httprequest.allow_bad_certificates_description': return 'このオプションを有効にすると、"HTTPリクエスト" ツールが無効・期限切れ・自己署名のSSL/TLS証明書を持つサーバーへHTTPSリクエストを送信できるようになります。これにより重要なセキュリティ制御が無効化され、第三者によるデータの傍受や改ざんのリスクがあります。このオプションは関連するリスクを十分理解した上で、信頼できる管理下のサーバーへのリクエストにのみ使用してください。一般的な使用は推奨しません。このオプションを有効にしたリクエストはHTTPと同様に第三者が閲覧・操作できるものとしてご認識ください。';
			case 'tools.httprequest.i_know_what_i_am_doing': return 'リスクを理解しています';
			case 'tools.httprequest.render_html': return 'HTMLをレンダリング';
			case 'tools.httprequest.back_to_details': return '詳細に戻る';
			case 'tools.httprequest.send_request': return 'リクエストを送信';
			case 'tools.httprequest.response': return 'レスポンス';
			case 'tools.httprequest.status_code': return 'ステータスコード';
			case 'tools.httprequest.error.url_cannot_be_empty': return 'URLを入力してください';
			case 'tools.httprequest.error.invalid_url': return '無効なURL';
			case 'tools.httprequest.error.invalid_headers': return '無効なヘッダー';
			case 'tools.httprequest.error.timeout': return 'リクエストがタイムアウトしました。\n入力内容とインターネット接続を確認して再試行してください。';
			case 'tools.httprequest.error.other_error': return 'リクエスト送信中にエラーが発生しました。\n入力内容とインターネット接続を確認して再試行してください。';
			case 'tools.httprequest.example_headers': return 'key1: value1\nkey2: value2';
			case 'tools.httprequest.request_body_hint': return 'リクエストボディ（JSON、XMLなど）';
			case 'tools.morsecode.title': return 'モールス信号';
			case 'tools.morsecode.alphabet_field': return 'アルファベット（A-Z、0-9）';
			case 'tools.morsecode.morse_field': return 'モールス信号（. と -）';
			case 'tools.morsecode.note_spaces': return '注意: 文字間は1スペース、単語間は3スペースを使用してください。';
			case 'tools.morsecode.alphabet_to_morse': return 'アルファベット → モールス';
			case 'tools.morsecode.morse_to_alphabet': return 'モールス → アルファベット';
			case 'tools.morsecode.play_audio': return '音声を再生';
			case 'tools.morsecode.playing': return '再生中...';
			case 'tools.morsecode.enter_text': return 'テキストを入力...';
			case 'tools.osm.title': return '地図（OSM）';
			case 'tools.osm.go_to_my_location': return '現在地へ';
			case 'tools.osm.loading_map': return '地図を読み込み中...';
			case 'tools.osm.error.location_permission_denied': return 'この機能を使用するには位置情報の許可が必要です';
			case 'tools.osm.error.location_services_disabled': return '位置情報サービスが無効です';
			case 'tools.gameoflife.title': return 'ライフゲーム';
			case 'tools.gameoflife.grid_size': return 'グリッドサイズ';
			case 'tools.gameoflife.current_size_is_x': return ({required Object size}) => '現在のサイズ: ${size}';
			case 'tools.gameoflife.waiting': return '待機中';
			case 'tools.gameoflife.stop_simulation': return 'シミュレーション停止';
			case 'tools.gameoflife.start_simulation': return 'シミュレーション開始';
			case 'tools.gameoflife.randomize_grid': return 'グリッドをランダム化';
			case 'tools.gameoflife.clear_grid': return 'グリッドをクリア';
			case 'tools.gameoflife.error.no_alive_cells': return '生存セルなし';
			case 'tools.gameoflife.error.no_alive_cells_description': return '生存セルがありません。\nグリッドをタップして追加してください。';
			case 'tools.gameoflife.error.please_stop_simulation': return '先にシミュレーションを停止してください';
			case 'tools.speedometer.title': return '速度計';
			case 'tools.speedometer.reset': return 'リセット';
			case 'tools.speedometer.about_traveled_distance_title': return '走行距離について';
			case 'tools.speedometer.about_traveled_distance_description': return '走行距離はGPSで検出した速度をもとに計算されます。\nそのため距離は100%正確ではありません。';
			case 'tools.speedometer.kmh': return 'km/h';
			case 'tools.speedometer.km': return 'km';
			case 'tools.speedometer.mph': return 'mph';
			case 'tools.speedometer.mi': return 'mi';
			case 'tools.speedometer.change_speed_unit': return '速度単位を変更';
			case 'tools.speedometer.change_speed_unit_description': return '速度計で使用する速度の単位を選択してください';
			case 'tools.speedometer.traveled_distance': return '走行距離';
			case 'tools.speedometer.error.location_permission_denied_title': return '位置情報が必要';
			case 'tools.speedometer.error.location_permission_denied_description': return 'このツールは速度を測定するために位置情報の許可が必要です。';
			case 'tools.speedometer.error.location_services_disabled_title': return '位置情報サービスが無効';
			case 'tools.speedometer.error.location_services_disabled_description': return 'このツールは速度を測定するために位置情報サービスの有効化が必要です。';
			case 'tools.mc_server_ping.title': return 'MCサーバーPing';
			case 'tools.mc_server_ping.java_edition': return 'Java Edition';
			case 'tools.mc_server_ping.information_java': return '案内';
			case 'tools.mc_server_ping.information_java_description': return 'サーバーがMinecraftのJava Editionで利用可能な場合はこのチェックボックスを有効にしてください。チェックを外すとBedrock Edition APIを使用します。';
			case 'tools.mc_server_ping.server_ip': return 'MinecraftサーバーIP（またはドメイン）';
			case 'tools.mc_server_ping.ping': return 'サーバーをPing';
			case 'tools.mc_server_ping.ping_another_server': return '別のサーバーをPing';
			case 'tools.mc_server_ping.api_used': return '使用API';
			case 'tools.mc_server_ping.about_the_api': return 'APIについて';
			case 'tools.mc_server_ping.about_the_api_description': return ({required Object website, required Object source}) => 'このツールはMinecraftサーバーをPingするために "${website}" の "${source}" を使用しています';
			case 'tools.mc_server_ping.about_open': return '開く';
			case 'tools.mc_server_ping.the_server_id_is': return ({required Object id}) => 'サーバーIDは "${id}" です';
			case 'tools.mc_server_ping.x_y_players_online': return ({required Object playersOnline, required Object playersMax}) => '${playersOnline}/${playersMax} 人がオンライン';
			case 'tools.mc_server_ping.added_to_favorites': return 'お気に入りに追加しました';
			case 'tools.mc_server_ping.added_to_favorites_description': return 'サーバーをお気に入りに追加しました';
			case 'tools.mc_server_ping.removed_from_favorites': return 'お気に入りから削除しました';
			case 'tools.mc_server_ping.removed_from_favorites_description': return 'サーバーをお気に入りから削除しました';
			case 'tools.mc_server_ping.add_to_favorites': return 'お気に入りに追加';
			case 'tools.mc_server_ping.remove_from_favorites': return 'お気に入りから削除';
			case 'tools.mc_server_ping.remove_from_favorites_description': return 'このサーバーをお気に入りから削除しますか？';
			case 'tools.mc_server_ping.from_favorites': return 'お気に入りから';
			case 'tools.mc_server_ping.pick_from_favorites': return 'お気に入りから選択';
			case 'tools.mc_server_ping.no_favorites': return 'お気に入りなし';
			case 'tools.mc_server_ping.no_favorites_description': return 'お気に入りのサーバーがまだありません。';
			case 'tools.mc_server_ping.online_players': return 'オンラインプレイヤー';
			case 'tools.mc_server_ping.online_players_description_no_players_to_show': return 'サーバーにオンラインプレイヤーがいますが、プレイヤー名は表示できません';
			case 'tools.mc_server_ping.error.please_enter_a_server_ip': return 'サーバーIPまたはドメインを入力してください';
			case 'tools.mc_server_ping.error.server_offline_or_does_not_exist': return 'サーバーはオフラインか存在しません';
			case 'tools.mc_server_ping.error.please_check_your_internet_connection': return 'インターネット接続を確認して再試行してください';
			case 'tools.mc_server_ping.server_id': return 'サーバーID';
			case 'tools.mc_server_ping.server_info': return 'サーバー情報';
			case 'tools.timestampconverter.title': return 'タイムスタンプ変換';
			case 'tools.timestampconverter.now_tooltip': return '現在';
			case 'tools.timestampconverter.utc': return 'UTC';
			case 'tools.timestampconverter.local': return 'ローカル';
			case 'tools.timestampconverter.local_or_utc_dialog_title': return 'ローカルまたはUTC';
			case 'tools.timestampconverter.local_or_utc_dialog_message': return 'ローカル日時またはUTC日時を選択しますか？';
			case 'tools.timestampconverter.unix_timestamp': return 'Unixタイムスタンプ';
			case 'tools.timestampconverter.convert_timestamp_to_date': return 'タイムスタンプを日付に変換';
			case 'tools.timestampconverter.tap_the_date_to_change_it': return '日付をタップして変更';
			case 'tools.timestampconverter.select_seconds': return '秒を選択';
			case 'tools.timestampconverter.error.invalid_timestamp': return '無効なタイムスタンプ';
			case 'tools.timestampconverter.convert': return '変換';
			case 'tools.urlshortener.title': return 'URL短縮';
			case 'tools.urlshortener.url': return 'URL';
			case 'tools.urlshortener.qr_code': return 'QRコード';
			case 'tools.urlshortener.share': return '共有';
			case 'tools.urlshortener.share_dialog_message': return '何を共有しますか？';
			case 'tools.urlshortener.your_shortened_url_is': return '短縮URLは';
			case 'tools.urlshortener.copy_to_clipboard': return 'クリップボードにコピー';
			case 'tools.urlshortener.the_link_id_is': return 'リンクIDは';
			case 'tools.urlshortener.link_id_copied_to_clipboard': return 'リンクIDをクリップボードにコピーしました';
			case 'tools.urlshortener.the_link_password_is': return 'リンクパスワードは';
			case 'tools.urlshortener.link_password_copied_to_clipboard': return 'リンクパスワードをクリップボードにコピーしました';
			case 'tools.urlshortener.link_password_hint_text': return 'パスワードをタップしてコピー\nこのリンクの統計を確認するために必要です';
			case 'tools.urlshortener.shorten_another_url': return '別のURLを短縮';
			case 'tools.urlshortener.url_to_shorten': return '短縮するURL';
			case 'tools.urlshortener.by_clicking_you_accept': return ({required Object url}) => '短縮ボタンをタップすると、以下のリンクから利用可能な "${url}" の利用規約に同意したことになります。';
			case 'tools.urlshortener.terms_of_service': return '利用規約';
			case 'tools.urlshortener.shorten': return '短縮';
			case 'tools.urlshortener.more_features': return 'さらなる機能';
			case 'tools.urlshortener.more_features_message': return '公式JTU.MEウェブサイトからテキスト共有、リンクインバイオプロフィールなどの追加機能を使用してください';
			case 'tools.urlshortener.open': return '開く';
			case 'tools.urlshortener.options': return 'オプション (任意)';
			case 'tools.urlshortener.access_password': return 'アクセスパスワード';
			case 'tools.urlshortener.expiration_date': return '有効期限 (UTC)';
			case 'tools.urlshortener.use_my_account': return 'アカウントを使用する';
			case 'tools.urlshortener.email': return 'メールアドレス';
			case 'tools.urlshortener.password': return 'パスワード';
			case 'tools.urlshortener.no_account': return 'アカウントをお持ちでない場合';
			case 'tools.urlshortener.no_account_message': return '公式JTU.MEウェブサイトで無料アカウントを作成できます。';
			case 'tools.urlshortener.error.failed_to_shorten_url': return 'URLの短縮に失敗しました。入力内容とインターネット接続を確認してください。';
			case 'tools.urlshortener.error.impossible_to_connect_to_the_server': return 'サーバーに接続できません';
			case 'tools.urlshortener.error.impossible_to_connect_to_the_server_message': return 'サーバーへの接続に失敗しました。インターネット接続を確認して再試行してください。';
			case 'tools.urlshortener.error.unauthorized': return '認証に失敗しました。認証情報を確認してください。';
			case 'tools.urlshortener.error.invalid_expiration_date': return '有効期限は未来の日付である必要があります。';
			case 'tools.urlshortener.management_info': return '管理情報';
			case 'tools.urlshortener.manage_with_account': return '統計情報を確認したり、このリンクを管理したりするには、公式サイトでJTU.MEアカウントをご利用ください。';
			case 'tools.counter.title': return 'カウンター';
			case 'tools.counter.add_button': return 'ボタンを追加';
			case 'tools.counter.remove_button': return 'ボタンを削除';
			case 'tools.counter.enter_number': return '数値を入力';
			case 'tools.counter.error.invalid_number': return '入力した数値が無効です';
			case 'tools.counter.error.the_number_must_be_between_x_and_y': return ({required Object minNumberLimit, required Object maxNumberLimit}) => '数値は ${minNumberLimit} から ${maxNumberLimit} の間にする必要があります';
			case 'tools.counter.error.you_must_have_at_least_one_button': return 'ボタンが最低1つ必要です';
			case 'tools.counter.error.this_button_already_exists': return 'このボタンはすでに存在します';
			case 'tools.bitwisecalculator.title': return 'ビット演算電卓';
			case 'tools.bitwisecalculator.binary_values': return '2進数値';
			case 'tools.bitwisecalculator.first_number': return '1つ目の数';
			case 'tools.bitwisecalculator.second_number': return '2つ目の数';
			case 'tools.bitwisecalculator.enter_a_binary_number': return '2進数を入力';
			case 'tools.bitwisecalculator.operations': return '演算';
			case 'tools.bitwisecalculator.and': return 'AND';
			case 'tools.bitwisecalculator.or': return 'OR';
			case 'tools.bitwisecalculator.xor': return 'XOR';
			case 'tools.bitwisecalculator.result': return '結果';
			case 'tools.bitwisecalculator.error.invalid_input': return '無効な入力';
			case 'tools.musicsearch.title': return '音楽検索';
			case 'tools.musicsearch.unknown_title': return '不明なタイトル';
			case 'tools.musicsearch.unknown_artist': return '不明なアーティスト';
			case 'tools.musicsearch.unknown_album': return '不明なアルバム';
			case 'tools.musicsearch.loading': return '読み込み中';
			case 'tools.musicsearch.loading_audio_preview': return '音声プレビューを読み込み中...';
			case 'tools.musicsearch.stop_audio_preview': return '音声プレビューを停止';
			case 'tools.musicsearch.data_source': return 'データソース';
			case 'tools.musicsearch.this_tool_uses_the_x_api': return ({required Object service}) => 'このツールは音楽検索に "${service}" APIを使用しています。\n音声プレビューは "${service}" から提供されています。';
			case 'tools.musicsearch.go_to_x': return ({required Object service}) => '${service} へ';
			case 'tools.musicsearch.search_for_music': return '音楽を検索';
			case 'tools.musicsearch.use_the_searchbar_to_search_music': return ({required Object service}) => '検索バーを使って音楽を検索してください。\n検索結果が出ない場合は別の検索ワードをお試しください。\nそれでも結果が出ない場合は、インターネット接続と ${service} がお住まいの国・地域で利用可能かどうかをご確認ください。';
			case 'tools.musicsearch.open_in_x': return ({required Object service}) => '${service} で開く';
			case 'tools.musicsearch.play_preview': return 'プレビューを再生';
			case 'tools.musicsearch.error.error_playing_audio_preview': return '音声プレビューの再生エラー。後でもう一度試してください。';
			case 'tools.musicsearch.error.unable_to_connect_to_the_api': return 'APIに接続できません。インターネット接続を確認して再試行してください。';
			case 'tools.musicanalyser.title': return '音楽認識';
			case 'tools.musicanalyser.press_the_button_to_start_music_analysis': return 'ボタンを押して音楽認識を開始';
			case 'tools.musicanalyser.loading': return '読み込み中...';
			case 'tools.musicanalyser.analyzing_music': return ({required Object remainingSeconds}) => '音楽を認識中... (${remainingSeconds}s)';
			case 'tools.musicanalyser.getting_results': return '結果を取得中...';
			case 'tools.musicanalyser.unknown': return '不明';
			case 'tools.musicanalyser.api_used': return '使用API';
			case 'tools.musicanalyser.this_tool_uses_the_x_api': return ({required Object service, required Object company}) => 'このツールはKoizeayバックエンドサーバー経由で "${service}" APIを使用しています。"${service}" は "${company}" の登録商標であり、このツールとは無関係です。';
			case 'tools.musicanalyser.start_analyzing_music': return '音楽認識を開始';
			case 'tools.musicanalyser.clear': return 'クリア';
			case 'tools.musicanalyser.error.permission_denied': return '権限が拒否されました';
			case 'tools.musicanalyser.error.permission_denied_description': return '音楽の認識にはマイクの許可が必要です。許可を付与して再試行してください。';
			case 'tools.musicanalyser.error.no_match_found': return '一致なし';
			case 'tools.musicanalyser.error.no_match_found_description': return '音楽の一致が見つかりませんでした。再試行してください。';
			case 'tools.musicanalyser.error.error_occurred': return '音楽の認識中にエラーが発生しました。インターネット接続を確認して再試行してください。';
			case 'tools.musicanalyser.error.please_update_the_app_and_try_again': return 'アプリをアップデートして再試行してください。最新版でも問題が続く場合は、後でもう一度試してください。';
			case 'tools.textdifferences.title': return 'テキスト比較';
			case 'tools.textdifferences.old_text': return '旧テキスト';
			case 'tools.textdifferences.new_text': return '新テキスト';
			case 'tools.textdifferences.no_text_hint': return '上のフィールドにテキストを入力すると差分が表示されます';
			case 'tools.textdifferences.enter_old_text': return '旧テキストを入力...';
			case 'tools.textdifferences.enter_new_text': return '新テキストを入力...';
			case 'tools.characterscopy.title': return '文字コピー';
			case 'tools.characterscopy.important': return '重要';
			case 'tools.characterscopy.important_description': return 'OSによっては一部の文字が正しく表示されないことがあります。またアプリやフォントによって対応していない文字もあります。コピーしたい文字をタップするとクリップボードにコピーされます。';
			case 'tools.characterscopy.copied_to_clipboard': return 'クリップボードにコピーしました';
			case 'tools.whoisdomain.title': return 'WHOISドメイン';
			case 'tools.whoisdomain.domain_name': return 'ドメイン名';
			case 'tools.whoisdomain.whois_lookup': return 'WHOIS検索';
			case 'tools.whoisdomain.disclaimer': return '免責事項';
			case 'tools.whoisdomain.disclaimer_text': return 'ToolboxはWHOISクエリ機能を情報提供のみを目的として提供しています。取得したデータは正確・完全・最新でない場合があり、各ドメインレジストリの利用規約に従います。WHOISデータをスパム、不法行為、または自動データ収集に使用することは禁止されています。このツールを使用することで、適用される法律およびレジストリの利用規約を遵守することに同意したものとみなされます。Toolboxおよびまたはkoizeayはデータの誤り、欠落、または不正使用について責任を負いません。一部のTLDはこのツールで対応していない場合があります。';
			case 'tools.whoisdomain.loading': return '読み込み中...';
			case 'tools.whoisdomain.ip_address_not_supported': return 'IPアドレスは非対応';
			case 'tools.whoisdomain.ip_address_not_supported_description': return 'このツールはドメイン名のみ対応しており、IPアドレスには対応していません';
			case 'tools.whoisdomain.no_result': return '有効な結果が見つかりません';
			case 'tools.whoisdomain.view_pretty': return '整形表示';
			case 'tools.whoisdomain.view_raw': return '生データ表示';
			case 'tools.whoisdomain.raw_whois_data': return '生WHOISデータ';
			case 'tools.whoisdomain.domain': return 'ドメイン';
			case 'tools.whoisdomain.registrar': return 'レジストラ';
			case 'tools.whoisdomain.dates': return '日付';
			case 'tools.whoisdomain.status': return 'ステータス';
			case 'tools.whoisdomain.name_servers': return 'ネームサーバー';
			case 'tools.whoisdomain.contact': return '連絡先';
			case 'tools.whoisdomain.other': return 'その他';
			case 'tools.whoisdomain.error.impossible_to_get_whois_information': return 'WHOIS情報を取得できません。入力内容とインターネット接続を確認して再試行してください';
			case 'tools.textcounter.title': return 'テキストカウンター';
			case 'tools.textcounter.clear': return 'クリア';
			case 'tools.textcounter.enter_text_here': return 'テキストを入力';
			case 'tools.textcounter.length': return '長さ';
			case 'tools.textcounter.trimmed_length': return 'トリム後の長さ';
			case 'tools.textcounter.raw_length': return '元の長さ';
			case 'tools.textcounter.letters': return '文字';
			case 'tools.textcounter.words': return '単語';
			case 'tools.textcounter.spaces': return 'スペース';
			case 'tools.textcounter.digits': return '数字';
			case 'tools.textcounter.lines': return '行';
			case 'tools.textcounter.empty_lines': return '空行';
			case 'tools.textcounter.total_lines': return '合計行数';
			case 'tools.textcounter.text_input': return 'テキスト入力';
			case 'tools.romannumeral.title': return 'ローマ数字';
			case 'tools.romannumeral.change_to': return '変換先';
			case 'tools.romannumeral.roman_numeral': return 'ローマ数字';
			case 'tools.romannumeral.number': return '数値';
			case 'tools.romannumeral.number_input_hint': return '数値';
			case 'tools.romannumeral.roman_numeral_input_hint': return 'ローマ数字';
			case 'tools.romannumeral.tap_to_copy': return 'タップしてコピー';
			case 'tools.romannumeral.copied_to_clipboard': return 'クリップボードにコピーしました';
			case 'tools.romannumeral.error.invalid_roman_numeral': return '無効またはサポートされていないローマ数字';
			case 'tools.areacalculator.title': return '面積計算';
			case 'tools.areacalculator.select_a_shape': return '形状を選択';
			case 'tools.areacalculator.values': return '値';
			case 'tools.areacalculator.area': return '面積';
			case 'tools.areacalculator.calculate': return '計算';
			case 'tools.areacalculator.shapes.circle': return '円';
			case 'tools.areacalculator.shapes.ellipse': return '楕円';
			case 'tools.areacalculator.shapes.equilateral_triangle': return '正三角形';
			case 'tools.areacalculator.shapes.kite': return '凧形';
			case 'tools.areacalculator.shapes.parallelogram': return '平行四辺形';
			case 'tools.areacalculator.shapes.rectangle': return '長方形';
			case 'tools.areacalculator.shapes.rhombus': return '菱形';
			case 'tools.areacalculator.shapes.regular_hexagon': return '正六角形';
			case 'tools.areacalculator.shapes.regular_octagon': return '正八角形';
			case 'tools.areacalculator.shapes.regular_pentagon': return '正五角形';
			case 'tools.areacalculator.shapes.regular_polygon': return '正多角形';
			case 'tools.areacalculator.shapes.square': return '正方形';
			case 'tools.areacalculator.shapes.trapezoid': return '台形';
			case 'tools.areacalculator.shapes.triangle': return '三角形';
			case 'tools.areacalculator.inputs.radius': return '半径';
			case 'tools.areacalculator.inputs.major_axis': return '長軸';
			case 'tools.areacalculator.inputs.minor_axis': return '短軸';
			case 'tools.areacalculator.inputs.side': return '辺';
			default: return null;
		}
	}

	dynamic _flatMapFunction$1(String path) {
		switch (path) {
			case 'tools.areacalculator.inputs.base': return '底辺';
			case 'tools.areacalculator.inputs.height': return '高さ';
			case 'tools.areacalculator.inputs.diagonal_1': return '対角線1';
			case 'tools.areacalculator.inputs.diagonal_2': return '対角線2';
			case 'tools.areacalculator.inputs.length': return '長さ';
			case 'tools.areacalculator.inputs.width': return '幅';
			case 'tools.areacalculator.inputs.number_of_sides': return '辺の数';
			case 'tools.areacalculator.inputs.side_length': return '辺の長さ';
			case 'tools.areacalculator.inputs.apothem': return 'アポテム';
			case 'tools.areacalculator.inputs.base_1': return '底辺1';
			case 'tools.areacalculator.inputs.base_2': return '底辺2';
			case 'tools.areacalculator.error.invalid_input': return '無効な入力';
			case 'tools.areacalculator.error.please_enter_a_value_for': return '値を入力してください';
			case 'tools.areacalculator.error.please_enter_a_valid_number_for': return '有効な数値を入力してください';
			case 'tools.areacalculator.error.please_enter_a_positive_number_for': return '正の数値を入力してください';
			case 'tools.areacalculator.error.please_try_again_with_different_values': return '別の値で再試行してください';
			case 'tools.areacalculator.error.the_area_of_the_shape_is_zero': return 'この形状の面積はゼロです';
			case 'tools.mathtex.title': return 'MathTeX';
			case 'tools.mathtex.enter_a_mathematical_expression_in_tex_format': return 'TeX形式で数式を入力';
			case 'tools.mathtex.texExpression': return 'TeX式';
			case 'tools.mathtex.export_to_image': return '画像として出力';
			case 'tools.mathtex.preview': return 'プレビュー';
			case 'tools.mathtex.color': return '色';
			case 'tools.mathtex.get_help': return 'ヘルプ';
			case 'tools.mathtex.open_help_website': return 'ヘルプサイトを開く';
			case 'tools.mathtex.help_content': return 'TeX形式で数式を入力すると数学的な数式として表示されます。例えば、TeX式 \'\\frac{a}{b}\' は \'a\' を \'b\' で割った分数として表示されます。サポートされているTeX構文を使って複雑な数式を作成できます。式を入力したらプレビューしてSVGファイルとして出力できます。\nMathJaxのTeX形式に対応しています。';
			case 'tools.mathtex.copied_to_clipboard': return 'クリップボードにコピーしました';
			case 'tools.mathtex.error.an_error_occurred_while_rendering_the_mathtex': return 'MathTeXのレンダリング中にエラーが発生しました';
			case 'tools.mathtex.error.please_wait_until_the_preview_is_loaded': return 'プレビューが読み込まれるまでお待ちください';
			case 'tools.mathtex.error.an_error_occurred_while_exporting_the_image': return '画像の出力中にエラーが発生しました';
			case 'tools.mathtex.error.could_not_open_help_website': return 'ヘルプサイトを開けませんでした。設定を確認して再試行してください';
			case 'tools.compass.title': return 'コンパス';
			case 'tools.compass.error.please_grant_location_permission': return 'コンパスを使用するには位置情報の許可が必要です。デバイスのセンサーにアクセスするために必須です。';
			case 'tools.qrcreator.title': return 'QRコード作成';
			case 'tools.qrcreator.qr_code_settings': return 'QRコード設定';
			case 'tools.qrcreator.ecc_low': return '低';
			case 'tools.qrcreator.ecc_medium': return '中';
			case 'tools.qrcreator.ecc_quartile': return '中高';
			case 'tools.qrcreator.ecc_high': return '高';
			case 'tools.qrcreator.saved_successfully': return 'QRコードを保存しました';
			case 'tools.qrcreator.shared_successfully': return 'QRコードを共有しました';
			case 'tools.qrcreator.enter_text_or_url': return 'テキストまたはURLを入力';
			case 'tools.qrcreator.error_correction_level': return '誤り訂正レベル';
			case 'tools.qrcreator.create': return '作成';
			case 'tools.qrcreator.generated_qr_code': return '生成したQRコード';
			case 'tools.qrcreator.save': return '保存';
			case 'tools.qrcreator.share': return '共有';
			case 'tools.qrcreator.error.failed_to_create_qr_code': return 'QRコードの作成に失敗しました。入力内容を確認して再試行してください';
			case 'tools.pastebin.title': return 'Pastebin';
			case 'tools.pastebin.url': return 'URL';
			case 'tools.pastebin.qr_code': return 'QRコード';
			case 'tools.pastebin.share': return '共有';
			case 'tools.pastebin.share_dialog_message': return '何を共有しますか？';
			case 'tools.pastebin.your_short_link_is': return '短縮リンクは';
			case 'tools.pastebin.copy_to_clipboard': return 'クリップボードにコピー';
			case 'tools.pastebin.copied_to_clipboard': return '短縮リンクをクリップボードにコピーしました';
			case 'tools.pastebin.the_link_id_is': return 'リンクIDは';
			case 'tools.pastebin.link_id_copied_to_clipboard': return 'リンクIDをクリップボードにコピーしました';
			case 'tools.pastebin.the_link_password_is': return 'リンクパスワードは';
			case 'tools.pastebin.link_password_copied_to_clipboard': return 'リンクパスワードをクリップボードにコピーしました';
			case 'tools.pastebin.link_password_hint_text': return 'パスワードをタップしてコピー\nこのリンクの統計を確認するために必要です';
			case 'tools.pastebin.paste_another_text': return '別のテキストを貼り付け';
			case 'tools.pastebin.text_to_paste': return '貼り付けるテキスト';
			case 'tools.pastebin.text_paste_field_hint': return 'テキスト、ソースコード、その他のコンテンツをここに貼り付けてください';
			case 'tools.pastebin.by_clicking_you_accept': return ({required Object url}) => '送信ボタンをタップすると、以下のリンクから利用可能な "${url}" の利用規約に同意したことになります。';
			case 'tools.pastebin.terms_of_service': return '利用規約';
			case 'tools.pastebin.send': return '送信';
			case 'tools.pastebin.more_features': return 'さらなる機能';
			case 'tools.pastebin.more_features_message': return '公式JTU.MEウェブサイトからURL短縮、リンクインバイオプロフィールなどの追加機能を使用してください';
			case 'tools.pastebin.open': return '開く';
			case 'tools.pastebin.options': return 'オプション (任意)';
			case 'tools.pastebin.access_password': return 'アクセスパスワード';
			case 'tools.pastebin.expiration_date': return '有効期限 (UTC)';
			case 'tools.pastebin.use_my_account': return 'アカウントを使用する';
			case 'tools.pastebin.email': return 'メールアドレス';
			case 'tools.pastebin.password': return 'パスワード';
			case 'tools.pastebin.no_account': return 'アカウントをお持ちでない場合';
			case 'tools.pastebin.no_account_message': return '公式JTU.MEウェブサイトで無料アカウントを作成して、リンクやペーストを管理できます。';
			case 'tools.pastebin.error.failed_to_obtain_short_link': return '短縮リンクの取得に失敗しました。インターネット接続を確認して再試行してください';
			case 'tools.pastebin.error.impossible_to_connect_to_the_server': return 'サーバーに接続できません';
			case 'tools.pastebin.error.impossible_to_connect_to_the_server_message': return 'サーバーへの接続に失敗しました。インターネット接続を確認して再試行してください。';
			case 'tools.pastebin.error.unauthorized': return '認証に失敗しました。認証情報を確認してください。';
			case 'tools.pastebin.error.invalid_expiration_date': return '有効期限は未来の日付である必要があります。';
			case 'tools.pastebin.management_info': return '管理情報';
			case 'tools.pastebin.manage_with_account': return '統計情報を確認したり、このリンクを管理したりするには、公式サイトでJTU.MEアカウントをご利用ください。';
			case 'tools.percentagecalculator.title': return 'パーセント計算';
			case 'tools.percentagecalculator.result': return '結果';
			case 'tools.percentagecalculator.percentage': return 'パーセント';
			case 'tools.percentagecalculator.eg': return '例)';
			case 'tools.percentagecalculator.total': return '合計';
			case 'tools.percentagecalculator.first_value': return '1つ目の値';
			case 'tools.percentagecalculator.second_value': return '2つ目の値';
			case 'tools.percentagecalculator.what_is': return '何パーセント？';
			case 'tools.percentagecalculator.of': return 'の';
			case 'tools.percentagecalculator.is_what_percentage_of': return '割合を求める';
			case 'tools.percentagecalculator.what_is_the_percentage_difference': return 'パーセントの差は';
			case 'tools.percentagecalculator.from': return 'から';
			case 'tools.percentagecalculator.to': return 'まで';
			case 'tools.percentagecalculator.calculate': return '計算';
			case 'tools.percentagecalculator.error.please_enter_valid_numbers_for_both_fields': return '両方のフィールドに有効な数値を入力してください';
			case 'tools.percentagecalculator.error.total_cannot_be_zero': return '合計はゼロにできません';
			case 'tools.percentagecalculator.error.first_value_cannot_be_zero': return '1つ目の値はゼロにできません';
			case 'tools.passwordgenerator.title': return 'パスワードジェネレーター';
			case 'tools.passwordgenerator.password_length': return 'パスワードの長さ';
			case 'tools.passwordgenerator.number_of_digits': return '数字の数';
			case 'tools.passwordgenerator.number_of_special_characters': return '特殊文字の数';
			case 'tools.passwordgenerator.generate_password': return 'パスワードを生成';
			case 'tools.passwordgenerator.password_copied_to_clipboard': return 'パスワードをクリップボードにコピーしました';
			case 'tools.passwordgenerator.tap_to_copy': return 'タップしてコピー';
			case 'tools.passwordgenerator.error.password_length_must_be_greater_than_0': return 'パスワードの長さは0より大きくする必要があります';
			case 'tools.passwordgenerator.error.password_length_cannot_exceed_x_characters': return ({required Object maxLength}) => 'パスワードの長さは ${maxLength} 文字を超えることはできません';
			case 'tools.passwordgenerator.error.password_length_cannot_be_less_than_the_sum_of_digits_and_special_characters': return 'パスワードの長さは数字と特殊文字の合計より小さくできません';
			case 'tools.passwordgenerator.generated_password': return '生成されたパスワード';
			case 'tools.portscanner.title': return 'ポートスキャナー';
			case 'tools.portscanner.host_to_scan': return 'スキャンするホスト';
			case 'tools.portscanner.start_port': return '開始ポート';
			case 'tools.portscanner.end_port': return '終了ポート';
			case 'tools.portscanner.start_scan': return 'スキャン開始';
			case 'tools.portscanner.stop_scan': return 'スキャン停止';
			case 'tools.portscanner.port': return 'ポート';
			case 'tools.portscanner.error.please_enter_a_valid_host': return '有効なホストを入力してください';
			case 'tools.portscanner.error.please_enter_a_valid_port_number': return '両方のフィールドに有効なポート番号（1-65535）を入力してください';
			case 'tools.portscanner.example_domain_or_ip': return 'example.com または 192.168.1.1';
			case 'tools.portscanner.port_range': return 'ポート範囲';
			case 'tools.portscanner.scan_progress': return 'スキャン進捗';
			case 'tools.commons.title': return 'Commons';
			case 'tools.commons.data_source_and_licensing': return 'データソースとライセンス';
			case 'tools.commons.data_source_and_licensing_description': return 'すべてのメディアファイルはWikimedia Commonsから提供されており、各ライセンスに従います。メディアファイルを使用・ダウンロードする際は各ライセンスの条件を遵守してください。';
			case 'tools.commons.open_wikimedia_commons': return 'Wikimedia Commonsを開く';
			case 'tools.commons.search_files': return 'ファイルを検索';
			case 'tools.commons.enter_search_query_to_find_files': return 'Wikimedia Commons上のメディアファイルを検索するキーワードを入力してください';
			case 'tools.commons.view_on_wikimedia': return 'Wikimedia Commonsで見る';
			case 'tools.commons.previous': return '前へ';
			case 'tools.commons.next': return '次へ';
			case 'tools.commons.bytes': return 'B';
			case 'tools.commons.kilobytes': return 'KB';
			case 'tools.commons.megabytes': return 'MB';
			case 'tools.commons.gigabytes': return 'GB';
			case 'tools.commons.no_files_found': return 'ファイルが見つかりません';
			case 'tools.commons.close_preview': return 'プレビューを閉じる';
			case 'tools.commons.view_license_details': return 'ライセンス詳細を見る';
			case 'tools.commons.download_media': return 'メディアをダウンロード';
			case 'tools.commons.close': return '閉じる';
			case 'tools.commons.file_information': return 'ファイル情報';
			case 'tools.commons.unknown_license': return '不明なライセンス';
			case 'tools.commons.mime_type': return 'MIMEタイプ';
			case 'tools.commons.file_size': return 'ファイルサイズ';
			case 'tools.commons.dimensions': return '縦横サイズ';
			case 'tools.commons.duration': return '長さ';
			case 'tools.commons.file_license': return 'ファイルライセンス';
			case 'tools.commons.file_by': return '作成者';
			case 'tools.commons.file_downloaded_successfully': return 'ファイルをダウンロードしました';
			case 'tools.commons.downloading': return 'ダウンロード中...';
			case 'tools.commons.error.error_downloading_file': return ({required Object errorCode}) => 'ファイルのダウンロードエラー (${errorCode})';
			case 'tools.commons.error.error_download_file_check_internet': return 'ファイルのダウンロードエラー。インターネット接続を確認して再試行してください。';
			case 'tools.commons.load_preview': return 'プレビューを読み込む';
			case 'tools.commons.page': return ({required Object number}) => 'ページ ${number}';
			case 'tools.crdeck.title': return 'Clash Royaleデッキ';
			case 'tools.crdeck.clear_unlocked_deck_cards': return '未固定カードをクリア';
			case 'tools.crdeck.about_and_credits': return '概要とクレジット';
			case 'tools.crdeck.about_and_credits_description': return 'このツールはSupercell（Koizeayバックエンドサーバー経由）が提供する公式Clash Royale APIを使用しています。このツールはSupercellとは一切関係ありません。画像、名前、商標などを含むすべてのClash RoyaleのコンテンツはSupercellの所有物です。';
			case 'tools.crdeck.supercell_website': return 'Supercellウェブサイト';
			case 'tools.crdeck.no_deck': return 'デッキなし';
			case 'tools.crdeck.generate_new_deck': return '新しいデッキを生成';
			case 'tools.crdeck.open_deck_in_clash_royale': return 'Clash Royaleでデッキを開く';
			case 'tools.crdeck.share_deck': return 'デッキを共有';
			case 'tools.crdeck.search_cards': return 'カードを検索';
			case 'tools.crdeck.import_cards_from_player_profile': return 'プレイヤープロフィールからカードをインポート';
			case 'tools.crdeck.deselect_all_cards': return 'すべてのカードの選択を解除';
			case 'tools.crdeck.select_all_cards': return 'すべてのカードを選択';
			case 'tools.crdeck.x_elixirs': return ({required Object elixirs}) => '${elixirs} エリクサー';
			case 'tools.crdeck.player_tag': return 'プレイヤータグ';
			case 'tools.crdeck.import': return 'インポート';
			case 'tools.crdeck.importing_cards': return 'カードをインポート中...';
			case 'tools.crdeck.share_deck_text_message': return ({required Object url}) => 'Toolboxで作ったClash Royaleのデッキをチェックしてね！\nこのリンクからClash Royaleで開いてみて: ${url}';
			case 'tools.crdeck.error.please_check_your_internet_connection': return 'インターネット接続を確認して再試行してください。';
			case 'tools.crdeck.error.error_while_loading_cards_from_server': return 'サーバーからClash Royaleカードの読み込み中にエラーが発生しました。\nネットワーク接続を確認して再試行してください。';
			case 'tools.crdeck.error.failed_to_load_cards_from_server': return ({required Object errorCode}) => 'サーバーからのClash Royaleカードの読み込みに失敗しました (${errorCode})';
			case 'tools.crdeck.error.invalid_tag': return '無効なタグ';
			case 'tools.crdeck.error.please_enter_a_valid_player_tag': return '有効なプレイヤータグを入力してください';
			case 'tools.crdeck.error.failed_to_import_cards_from_player_profile': return ({required Object errorCode}) => 'プレイヤープロフィールからのカードインポートに失敗しました (${errorCode})。手動でカードをインポートすることもできます';
			case 'tools.crdeck.error.an_error_occurred_while_importing_cards': return 'カードのインポート中にエラーが発生しました。手動でカードをインポートすることもできます';
			case 'tools.crdeck.error.not_enough_cards_selected': return '選択したカードが不足しています';
			case 'tools.crdeck.error.please_select_at_least_x_more_cards': return ({required Object numberOfCards}) => '有効なデッキを作成するにはあと ${numberOfCards} 枚以上のカードを選択してください';
			case 'tools.crdeck.error.deck_is_full': return 'デッキが満杯';
			case 'tools.crdeck.error.you_can_only_add_up_to_x_cards_to_the_deck': return ({required Object numberOfCards}) => 'デッキに追加できるカードは ${numberOfCards} 枚までです';
			case 'tools.crdeck.error.card_already_in_deck': return 'カードはすでにデッキにあります';
			case 'tools.crdeck.error.this_card_is_already_in_the_deck': return 'このカードはすでにデッキにあります';
			case 'tools.crdeck.error.incomplete_deck': return 'デッキが不完全';
			case 'tools.crdeck.error.please_add_x_more_cards_to_the_deck_before_opening_it_in_clash_royale': return ({required Object numberOfCards}) => 'Clash Royaleで開く前にあと ${numberOfCards} 枚のカードをデッキに追加してください';
			case 'tools.crdeck.error.please_add_x_more_cards_to_the_deck_before_sharing_it': return ({required Object numberOfCards}) => '共有する前にあと ${numberOfCards} 枚のカードをデッキに追加してください';
			case 'tools.iplocation.title': return 'IPアドレスの位置情報';
			case 'tools.iplocation.api_used': return '使用API';
			case 'tools.iplocation.about_the_api': return 'APIについて';
			case 'tools.iplocation.about_the_api_description': return ({required Object source}) => 'このツールは指定されたIPアドレスの位置情報を取得するために "${source}" のAPIを使用しています';
			case 'tools.iplocation.visit_website': return 'ウェブサイトにアクセス';
			case 'tools.iplocation.ip_address': return 'IPアドレス';
			case 'tools.iplocation.get_ip_location': return '位置情報を取得';
			case 'tools.iplocation.location_information': return '位置情報';
			case 'tools.iplocation.n_a': return 'N/A';
			case 'tools.iplocation.country': return '国';
			case 'tools.iplocation.provider': return 'プロバイダー';
			case 'tools.iplocation.error.ip_required': return 'IPアドレスが必要です';
			case 'tools.iplocation.error.please_enter_an_ip_address': return '位置情報を取得するIPアドレスを入力してください';
			case 'tools.iplocation.error.error_fetching_location': return '位置情報の取得エラー';
			case 'tools.iplocation.error.error_fetching_location_description': return '位置情報の取得中にエラーが発生したようです。入力内容とインターネット接続を確認して再試行してください';
			case 'credits.title': return 'クレジット';
			case 'credits.app_icon': return ({required Object author}) => 'アプリアイコン: ${author}';
			case 'credits.app_license': return ({required Object license}) => 'このアプリは ${license} ライセンスの下で提供されています';
			case 'credits.tools_icons': return ({required Object author}) => 'ツールアイコン: ${author}';
			case 'credits.ads_disclaimer': return '広告はサーバー費用の支払いとアプリ開発のサポートのために表示しています。\n画面下部に小さなバナーが表示されるだけで、Toolboxの使用を妨げるものではありません。';
			case 'credits.more_apps_and_services': return 'その他のアプリとサービス';
			case 'credits.view_licenses': return 'ライセンスを見る';
			case 'credits.special_thanks': return '特別感謝';
			case 'credits.contribute_on_github': return 'GitHubで貢献';
			case 'credits.email_copied_to_clipboard': return 'メールアドレスをクリップボードにコピーしました';
			case 'credits.made_with_love_in_switzerland': return 'スイスから愛を込めて';
			case 'credits.made_with_love_in_switzerland_description': return 'スイスで開発、世界中で使用。\nToolboxをご利用いただきありがとうございます。\n気に入っていただけたら、Play StoreまたはApp Storeにレビューを残していただけると大変励みになります。\nアプリの改善を続けるための大きなモチベーションになります。';
			case 'credits.translations.title': return '翻訳';
			case 'credits.translations.english': return ({required Object author}) => '英語: ${author}';
			case 'credits.translations.french': return ({required Object author}) => 'フランス語: ${author}';
			case 'credits.translations.japanese': return ({required Object author}) => '日本語: ${author}';
			default: return null;
		}
	}
}

