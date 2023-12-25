import 'package:equatable/equatable.dart';

class UploadFileResp extends Equatable {
  final String? url;

  const UploadFileResp({this.url});

  factory UploadFileResp.fromJson(Map<String, dynamic> data) {
    return UploadFileResp(
      url: data['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'url': url,
      };

  @override
  List<Object?> get props => [url];
}
