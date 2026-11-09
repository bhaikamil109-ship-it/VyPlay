// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:vyplay/application/application.dart' as _i718;
import 'package:vyplay/application/channel/channel_bloc.dart' as _i834;
import 'package:vyplay/application/download/download_bloc.dart' as _i664;
import 'package:vyplay/application/playlist/playlist_bloc.dart' as _i1;
import 'package:vyplay/application/saved/saved_bloc.dart' as _i39;
import 'package:vyplay/application/search/search_bloc.dart' as _i163;
import 'package:vyplay/application/settings/settings_bloc.dart' as _i470;
import 'package:vyplay/application/subscribe/subscribe_bloc.dart' as _i108;
import 'package:vyplay/application/trending/trending_bloc.dart' as _i15;
import 'package:vyplay/application/watch/watch_bloc.dart' as _i337;
import 'package:vyplay/domain/channel/channel_services.dart' as _i212;
import 'package:vyplay/domain/download/download_service.dart' as _i888;
import 'package:vyplay/domain/home/home_services.dart' as _i416;
import 'package:vyplay/domain/home_recommendation/home_recommendation_service.dart'
    as _i570;
import 'package:vyplay/domain/playlist/playlist_service.dart' as _i575;
import 'package:vyplay/domain/saved/saved_services.dart' as _i636;
import 'package:vyplay/domain/search/search_history_service.dart' as _i1011;
import 'package:vyplay/domain/search/search_service.dart' as _i158;
import 'package:vyplay/domain/settings/settings_service.dart' as _i99;
import 'package:vyplay/domain/sponsorblock/sponsorblock_service.dart' as _i184;
import 'package:vyplay/domain/subscribes/subscribe_services.dart' as _i761;
import 'package:vyplay/domain/trending/trending_service.dart' as _i572;
import 'package:vyplay/domain/user_preferences/user_preferences_service.dart'
    as _i185;
import 'package:vyplay/domain/watch/watch_service.dart' as _i637;
import 'package:vyplay/infrastructure/channel/channel_impl.dart' as _i709;
import 'package:vyplay/infrastructure/database/database.dart' as _i820;
import 'package:vyplay/infrastructure/download/download_impl.dart' as _i294;
import 'package:vyplay/infrastructure/home/home_impl.dart' as _i279;
import 'package:vyplay/infrastructure/home_recommendation/home_recommendation_impl.dart'
    as _i1009;
import 'package:vyplay/infrastructure/playlist/playlist_impl.dart' as _i652;
import 'package:vyplay/infrastructure/saved/saved_impl.dart' as _i76;
import 'package:vyplay/infrastructure/search/search_history_impl.dart' as _i488;
import 'package:vyplay/infrastructure/search/search_impl.dart' as _i121;
import 'package:vyplay/infrastructure/settings/newpipe_data_service.dart'
    as _i255;
import 'package:vyplay/infrastructure/settings/setting_impl.dart' as _i753;
import 'package:vyplay/infrastructure/sponsorblock/sponsorblock_impl.dart'
    as _i1036;
import 'package:vyplay/infrastructure/subscribe/subscribe_impl.dart' as _i135;
import 'package:vyplay/infrastructure/trending/trending_impl.dart' as _i711;
import 'package:vyplay/infrastructure/user_preferences/user_preferences_impl.dart'
    as _i335;
import 'package:vyplay/infrastructure/watch/watch_impl.dart' as _i76;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i255.NewPipeDataService>(
        () => _i255.NewPipeDataService());
    gh.lazySingleton<_i99.SettingsService>(
        () => _i753.SettingImpl(db: gh<_i820.AppDatabase>()));
    gh.lazySingleton<_i185.UserPreferencesService>(
        () => _i335.UserPreferencesImpl());
    gh.lazySingleton<_i888.DownloadService>(() => _i294.DownloadImpl());
    gh.lazySingleton<_i572.TrendingService>(() => _i711.TrendingImpl());
    gh.lazySingleton<_i575.PlaylistService>(() => _i652.PlaylistImpl());
    gh.lazySingleton<_i636.SavedServices>(() => _i76.SavedImpl());
    gh.factory<_i470.SettingsBloc>(
        () => _i470.SettingsBloc(gh<_i99.SettingsService>()));
    gh.lazySingleton<_i1011.SearchHistoryService>(
        () => _i488.SearchHistoryImpl());
    gh.lazySingleton<_i761.SubscribeServices>(() => _i135.SubscribeImpl());
    gh.lazySingleton<_i637.WatchService>(() => _i76.WatchImpl());
    gh.factory<_i39.SavedBloc>(() => _i39.SavedBloc(
          gh<_i636.SavedServices>(),
          gh<_i185.UserPreferencesService>(),
          gh<_i470.SettingsBloc>(),
        ));
    gh.factory<_i1.PlaylistBloc>(
        () => _i1.PlaylistBloc(gh<_i575.PlaylistService>()));
    gh.lazySingleton<_i184.SponsorBlockService>(
        () => _i1036.SponsorBlockImpl());
    gh.lazySingleton<_i158.SearchService>(() => _i121.SearchImpl());
    gh.lazySingleton<_i416.HomeServices>(() => _i279.HomeImpl());
    gh.factory<_i664.DownloadBloc>(
        () => _i664.DownloadBloc(gh<_i888.DownloadService>()));
    gh.lazySingleton<_i212.ChannelServices>(() => _i709.ChannelImpl());
    gh.factory<_i108.SubscribeBloc>(
        () => _i108.SubscribeBloc(gh<_i761.SubscribeServices>()));
    gh.factory<_i337.WatchBloc>(() => _i337.WatchBloc(
          gh<_i637.WatchService>(),
          gh<_i184.SponsorBlockService>(),
        ));
    gh.lazySingleton<_i570.HomeRecommendationService>(
        () => _i1009.HomeRecommendationImpl(
              gh<_i185.UserPreferencesService>(),
              gh<_i158.SearchService>(),
            ));
    gh.factory<_i163.SearchBloc>(() => _i163.SearchBloc(
          gh<_i158.SearchService>(),
          gh<_i1011.SearchHistoryService>(),
        ));
    gh.factory<_i834.ChannelBloc>(
        () => _i834.ChannelBloc(gh<_i212.ChannelServices>()));
    gh.factory<_i15.TrendingBloc>(() => _i15.TrendingBloc(
          gh<_i718.SettingsBloc>(),
          gh<_i572.TrendingService>(),
          gh<_i416.HomeServices>(),
          gh<_i718.SubscribeBloc>(),
          gh<_i570.HomeRecommendationService>(),
        ));
    return this;
  }
}
