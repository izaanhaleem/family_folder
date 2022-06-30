import 'dart:convert';

DivisionResponse divisionResponseFromJson(String str) => DivisionResponse.fromJson(json.decode(str));

String divisionResponseToJson(DivisionResponse data) => json.encode(data.toJson());

class DivisionResponse {
  DivisionResponse({
    this.status,
    this.message,
    this.statusCode,
    this.messageDetail,
    this.data,
  });

  bool? status;
  String? message;
  int? statusCode;
  String? messageDetail;
  List<Datum>? data;

  factory DivisionResponse.fromJson(Map<String, dynamic> json) => DivisionResponse(
    status: json["Status"] == null ? null : json["Status"],
    message: json["Message"] == null ? null : json["Message"],
    statusCode: json["StatusCode"] == null ? null : json["StatusCode"],
    messageDetail: json["MessageDetail"] == null ? null : json["MessageDetail"],
    data: json["Data"] == null ? null : List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Status": status == null ? null : status,
    "Message": message == null ? null : message,
    "StatusCode": statusCode == null ? null : statusCode,
    "MessageDetail": messageDetail == null ? null : messageDetail,
    "Data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.title,
    this.id,
    this.detail,
    this.tehsilCode,
    this.districtCode,
  });

  String? title;
  int? id;
  String? detail;
  dynamic tehsilCode;
  dynamic districtCode;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    title: json["Title"] == null ? null : json["Title"],
    id: json["Id"] == null ? null : json["Id"],
    detail: json["Detail"] == null ? null : json["Detail"],
    tehsilCode: json["TehsilCode"],
    districtCode: json["DistrictCode"],
  );

  Map<String, dynamic> toJson() => {
    "Title": title == null ? null : title,
    "Id": id == null ? null : id,
    "Detail": detail == null ? null : detail,
    "TehsilCode": tehsilCode,
    "DistrictCode": districtCode,
  };
}
