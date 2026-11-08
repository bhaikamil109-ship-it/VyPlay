/// Compatibility shim for the old FFmpeg-based muxer.
///
/// The merge used to run through FFmpeg (`ffmpeg_kit_flutter_new`). It now runs
/// in native Android code through the pure-Java muxers vendored from NewPipe
/// 0.29.1, exposed by [StreamMuxer]. This file keeps the previous `FfmpegMuxer`
/// name resolving for existing call sites so the download pipeline did not have
/// to change; new code should use [StreamMuxer] directly.
///
/// The public surface is unchanged: [MuxResult], [MuxFailure] and the
/// `merge` method behave exactly as before, including the "no usable output
/// file" check and the cleanup of a failed run.
library;

import 'stream_muxer.dart';

export 'stream_muxer.dart' show MuxResult, MuxFailure, StreamMuxer;

/// Alias kept so `FfmpegMuxer()` still constructs a working muxer.
///
/// The name is historical: no FFmpeg is involved any more.
typedef FfmpegMuxer = StreamMuxer;
