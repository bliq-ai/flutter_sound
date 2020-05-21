import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_sound/flutter_sound.dart';

import 'demo_active_codec.dart';
import 'demo_common.dart';
import 'demo_player_state.dart';

///
class AssetPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SoundPlayerUI.fromLoader(
      (_) => createAssetTrack(),
      showTitle: true,
      audioFocus: PlayerState().hushOthers
          ? AudioFocus.focusAndHushOthers
          : AudioFocus.focusAndKeepOthers,
    );
  }

  ///
  Future<Track> createAssetTrack() async {
    Track track;
    track = Track.fromAsset(
      assetSample[ActiveCodec().codec.index],
      codec: ActiveCodec().codec,
    );

    track.title = "Asset playback.";
    track.artist = "By flutter_sound";

    if (Platform.isIOS) {
      track.albumArtAsset = 'AppIcon';
    } else if (Platform.isAndroid) {
      track.albumArtAsset = 'AppIcon.png';
    }
    return track;
  }
}
