import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:toohak/_toohak.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class CloudEventsManager {
  final PublishSubject<CloudEvent> _cloudEvents$ = PublishSubject<CloudEvent>();

  String? _token;
  WebSocketChannel? _channel;

  Stream<CloudEvent> get cloudEvents {
    return _cloudEvents$;
  }

  Future<bool> init() async {
    return true;
  }

  Future<bool> connect({
    required String token,
    required String gameId,
  }) async {
    await _channel?.sink.close();

    final Uri websocketUri = Uri.parse('wss://toohak.hexagonale.net/connect');
    WebSocketChannel? channel = _channel = WebSocketChannel.connect(websocketUri);
    _channel = channel;

    channel.stream.listen(_onMessage);
    await channel.ready;
    await Future.delayed(const Duration(seconds: 1));
    channel.sink.add('$token\n$gameId');

    _token = token;

    return true;
  }

  String? getToken() {
    return _token;
  }

  // region Private

  Future<void> _onMessage(dynamic rawData) async {
    if (rawData is! String) {
      print('data is not a string!');

      return;
    }

    final Map<String, dynamic> data = jsonDecode(rawData);

    final dynamic typeRaw = data['type'];
    if (typeRaw is! String) {
      print('type is not a string!');

      return;
    }

    final CloudEventType? type = CloudEventTypeMapper.fromName(typeRaw);
    if (type == null) {
      print('type is null!');

      return;
    }

    final dynamic payload = data['data'];
    if (payload is! Map<String, dynamic>) {
      print('payload is not a map!');

      return;
    }

    switch (type) {
      case CloudEventType.playerJoined:
        _cloudEvents$.add(
          PlayerJoinedCloudEvent.fromJson(payload),
        );
        break;

      case CloudEventType.questionSent:
        _cloudEvents$.add(
          QuestionSentCloudEvent.fromJson(payload),
        );
        break;

      case CloudEventType.roundFinished:
        _cloudEvents$.add(
          RoundFinishedCloudEvent.fromJson(payload),
        );
        break;

      case CloudEventType.gameOver:
        _cloudEvents$.add(
          GameOverCloudEvent.fromJson(payload),
        );
        break;
    }
  }

  // endregion
}
