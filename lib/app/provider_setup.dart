

// final locationProvider = ChangeNotifierProvider((ref) => LocationProvider());
// final authenticationProvider =
//     ChangeNotifierProvider((ref) => AuthenticationProvider());
// final propertyManagementProvider =
//     ChangeNotifierProvider((ref) => PropertyManagementProvider());

import 'package:monipoint_challenge/features/Provider/profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ChangeNotifierProvider(create: (_) => ProfileProvider()),
 
  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [];
List<SingleChildWidget> dependentServices = [];
List<SingleChildWidget> uiConsumableProviders = [];
