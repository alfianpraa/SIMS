class Service {
  final String serviceCode;
  final String serviceName;
  final String serviceIcon;
  final int serviceTariff;

  Service({
    required this.serviceCode,
    required this.serviceName,
    required this.serviceIcon,
    required this.serviceTariff,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      serviceCode: json['service_code'],
      serviceName: json['service_name'],
      serviceIcon: json['service_icon'],
      serviceTariff: json['service_tariff'],
    );
  }
}
