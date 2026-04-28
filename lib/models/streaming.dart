import 'package:watchlist_plus/enums/access_enum.dart';
import 'package:watchlist_plus/enums/streaming_enum.dart';

class Streaming {
  final StreamingEnum service;
  final AccessEnum access;

  const Streaming({required this.service, required this.access});

  Map<String, dynamic> toMap() => {
    'service': service.name,
    'access': access.name,
  };

  factory Streaming.fromMap(Map<String, dynamic> map) => Streaming(
    service: StreamingEnum.values.firstWhere((e) => e.name == map['service']),
    access: AccessEnum.values.firstWhere((e) => e.name == map['access']),
  );

  @override
  String toString() => '${service.displayName} - ${access.name}';
}
