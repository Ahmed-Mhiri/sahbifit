import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_upload_response_model.freezed.dart';
part 'file_upload_response_model.g.dart';

@freezed
abstract class FileUploadResponseModel with _$FileUploadResponseModel {
  const factory FileUploadResponseModel({
    required String url,
  }) = _FileUploadResponseModel;

  factory FileUploadResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FileUploadResponseModelFromJson(json);
}