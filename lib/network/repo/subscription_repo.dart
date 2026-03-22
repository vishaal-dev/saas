import '../../core/models/subscription/subscription_schema_models.dart';
import '../api/subscription_api_services.dart';

abstract class SubscriptionRepository {
  Future<SubscriptionSchemaResponse> getSubscriptionSchema();
}

class SubscriptionRepo implements SubscriptionRepository {
  SubscriptionRepo({required this.services});

  final SubscriptionServices services;

  @override
  Future<SubscriptionSchemaResponse> getSubscriptionSchema() =>
      services.getSubscriptionSchema();
}
