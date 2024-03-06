import 'package:equatable/equatable.dart';

class RemoteErrorModel extends Equatable {
  final String statusMessage;
  final int statusCode;

  const RemoteErrorModel({
    required this.statusMessage,
    required this.statusCode,
  });

  factory RemoteErrorModel.fromJson(Map<String, dynamic> json) {
    return RemoteErrorModel(
      statusMessage: json['status_message'] ?? 'Default Dio Error',
      statusCode: json['status_code'] ?? 0,
    );
  }

  @override
  List<Object> get props => [
        statusMessage,
        statusCode,
      ];
}
