/// Service for handling authentication-related operations
class AuthService {
  /// Check if a string is a valid UUID format
  /// UUID format: 8-4-4-4-12 hex characters (e.g., 550e8400-e29b-41d4-a716-446655440000)
  // static bool _isValidUUID(String? value) {
  //   if (value == null || value.isEmpty) return false;
  //   // UUID regex pattern: 8-4-4-4-12 hex characters
  //   final uuidPattern = RegExp(
  //     r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$',
  //     caseSensitive: false,
  //   );
  //   return uuidPattern.hasMatch(value);
  // }
  //
  // /// Calls the login_or_register_user RPC with user data and location
  // /// Note: userId is no longer needed as uuid is auto-generated in the database
  // /// Location values are only sent if available, otherwise null/empty
  // static Future<Map<String, dynamic>?> callLoginRegisterRPC({
  //   String? userId, // Optional, not used - uuid is auto-generated
  //   String? email,
  //   String? phone,
  //   String? name,
  //   double? latitude,
  //   double? longitude,
  // }) async {
  //   try {
  //     // Ensure Supabase is initialized
  //     try {
  //       final _ = Supabase.instance.client;
  //     } catch (e) {
  //       // Supabase not initialized - try to initialize
  //       try {
  //         if (!sbServices.isInitialized) {
  //           await sbServices.initSupabase();
  //         }
  //       } catch (serviceError) {
  //         // If service init fails, try direct initialization
  //         debugPrint('Service init failed, trying direct init...');
  //         await Supabase.initialize(
  //           url: SupabaseConfig.supabaseUrl,
  //           anonKey: SupabaseConfig.supabaseAnonKey,
  //         );
  //         debugPrint('Supabase initialized successfully (direct)');
  //       }
  //     }
  //
  //     final supabase = Supabase.instance.client;
  //
  //     // Get location data from BoxDB
  //     final latitudeStr = boxDb.readStringValue(
  //       key: BoxConstants.currentLatitude,
  //     );
  //     final longitudeStr = boxDb.readStringValue(
  //       key: BoxConstants.currentLongitude,
  //     );
  //     final addressLine1 = boxDb.readStringValue(
  //       key: BoxConstants.thoroughFare,
  //     );
  //     final city = boxDb.readStringValue(key: BoxConstants.currentLocality);
  //     final state = boxDb.readStringValue(key: BoxConstants.currentCountry);
  //     final subLocality = boxDb.readStringValue(key: BoxConstants.subLocality);
  //     final postalCode = boxDb.readStringValue(key: BoxConstants.postalCode);
  //
  //     // Prepare parameters for RPC
  //     final rpcParams = <String, dynamic>{};
  //
  //     // uuid is auto-generated in the database, no need to pass user_id
  //     // RPC will identify user by email or phone
  //     if (email != null && email.isNotEmpty) {
  //       rpcParams['p_email'] = email;
  //     }
  //
  //     if (phone != null && phone.isNotEmpty) {
  //       rpcParams['p_phone'] = phone;
  //     }
  //
  //     if (name != null && name.isNotEmpty) {
  //       rpcParams['p_name'] = name;
  //     }
  //
  //     // Determine location values - use provided location if available, otherwise BoxDB, or null
  //     double? finalLatitude;
  //     double? finalLongitude;
  //
  //     if (latitude != null && longitude != null) {
  //       // Use provided location (from device/Supabase)
  //       finalLatitude = latitude;
  //       finalLongitude = longitude;
  //       debugPrint('Using provided location: $finalLatitude, $finalLongitude');
  //     } else if (latitudeStr.isNotEmpty &&
  //         longitudeStr.isNotEmpty &&
  //         double.tryParse(latitudeStr) != null &&
  //         double.tryParse(longitudeStr) != null) {
  //       // Use location from BoxDB
  //       finalLatitude = double.parse(latitudeStr);
  //       finalLongitude = double.parse(longitudeStr);
  //       debugPrint(
  //         'Using location from BoxDB: $finalLatitude, $finalLongitude',
  //       );
  //     }
  //     // If no location available, finalLatitude and finalLongitude remain null
  //
  //     // Add location data only if available, otherwise send null/empty
  //     if (finalLatitude != null && finalLongitude != null) {
  //       rpcParams['p_latitude'] = finalLatitude;
  //       rpcParams['p_longitude'] = finalLongitude;
  //     }
  //
  //     // Add address fields only if they have values, otherwise send empty string or omit
  //     if (addressLine1.isNotEmpty) {
  //       rpcParams['p_address_line1'] = addressLine1;
  //     }
  //     if (subLocality.isNotEmpty) {
  //       rpcParams['p_address_line2'] = subLocality;
  //     }
  //     if (city.isNotEmpty) {
  //       rpcParams['p_city'] = city;
  //     }
  //     if (state.isNotEmpty) {
  //       rpcParams['p_state'] = state;
  //     }
  //
  //     if (postalCode.isNotEmpty) {
  //       rpcParams['p_zip_code'] = postalCode;
  //     }
  //     // Call the RPC function
  //     final rpcResponse = await supabase.rpc(
  //       'login_or_register_user',
  //       params: rpcParams,
  //     );
  //
  //     if (rpcResponse != null) {
  //       debugPrint('RPC response received: $rpcResponse');
  //
  //       // Store location data in BoxDB (location is now in users table, not locations table)
  //       if (rpcResponse['location'] != null) {
  //         final locationData = rpcResponse['location'] as Map<String, dynamic>;
  //
  //         // Store location coordinates in BoxDB
  //         if (locationData['latitude'] != null) {
  //           boxDb.writeStringValue(
  //             key: BoxConstants.currentLatitude,
  //             value: locationData['latitude'].toString(),
  //           );
  //         }
  //         if (locationData['longitude'] != null) {
  //           boxDb.writeStringValue(
  //             key: BoxConstants.currentLongitude,
  //             value: locationData['longitude'].toString(),
  //           );
  //         }
  //         // Store address fields in BoxDB
  //         if (locationData['address_line1'] != null) {
  //           boxDb.writeStringValue(
  //             key: BoxConstants.thoroughFare,
  //             value: locationData['address_line1'].toString(),
  //           );
  //         }
  //         if (locationData['address_line2'] != null) {
  //           boxDb.writeStringValue(
  //             key: BoxConstants.subLocality,
  //             value: locationData['address_line2'].toString(),
  //           );
  //         }
  //         if (locationData['city'] != null) {
  //           boxDb.writeStringValue(
  //             key: BoxConstants.currentLocality,
  //             value: locationData['city'].toString(),
  //           );
  //         }
  //         if (locationData['state'] != null) {
  //           boxDb.writeStringValue(
  //             key: BoxConstants.currentCountry,
  //             value: locationData['state'].toString(),
  //           );
  //         }
  //       }
  //
  //       // Store user data
  //       if (rpcResponse['user'] != null) {
  //         final userData = rpcResponse['user'] as Map<String, dynamic>;
  //         if (userData['uuid'] != null) {
  //           boxDb.writeStringValue(
  //             key: BoxConstants.userId,
  //             value: userData['uuid'].toString(),
  //           );
  //         }
  //       }
  //
  //       debugPrint('Successfully called login_or_register_user RPC');
  //       return rpcResponse as Map<String, dynamic>;
  //     }
  //
  //     return null;
  //   } catch (e, stackTrace) {
  //     debugPrint('Error while calling login_or_register_user RPC: $e');
  //     debugPrint('Stack trace: $stackTrace');
  //     return null;
  //   }
  // }
}
