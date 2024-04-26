import 'package:go_router/go_router.dart';

import '../screens/addNewAddressScreen.dart';
import '../screens/addNewCardScreen.dart';
import '../screens/addressScreen.dart';
import '../screens/authLoading.dart';
import '../screens/boardingScreen.dart';
import '../screens/checkoutScreen.dart';
import '../screens/customerService.dart';
import '../screens/errorScreen.dart';
import '../screens/favoritesScreen.dart';
import '../screens/helpCenterScreen.dart';
import '../screens/homeScreen.dart';
import '../screens/loginScreen.dart';
import '../screens/paymentScreen.dart';
import '../screens/permissionScreen.dart';
import '../screens/privacyPolicyScreen.dart';
import '../screens/profileScreen.dart';
import '../screens/registerScreen.dart';
import '../screens/specialOffers.dart';
import '../screens/walletScreen.dart';

// GoRouter configuration
final routes = GoRouter(
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AuthLoadingScreen(),
    ),
    GoRoute(
      path: '/boarding',
      builder: (context, state) => const BoardingScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/checkout',
      builder: (context, state) => const CheckoutScreen(),
    ),
    GoRoute(
      path: '/wallet',
      builder: (context, state) => const WalletScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/specialoffers',
      builder: (context, state) => const SpecialOffersScreen(),
    ),
    GoRoute(
      path: '/customerservice',
      builder: (context, state) => const CustomerServiceScreen(),
    ),
    GoRoute(
      path: '/helpcenter',
      builder: (context, state) => const HelpCenterScreen(),
    ),
    GoRoute(
      path: '/privacy',
      builder: (context, state) => const PrivacyPolicyScreen(),
    ),
    GoRoute(
      path: '/address',
      builder: (context, state) => const AddressScreen(),
    ),
    GoRoute(
      path: '/payment',
      builder: (context, state) => const PaymentScreen(),
    ),
    GoRoute(
      path: '/addcard',
      builder: (context, state) => const AddNewCardScreen(),
    ),
    GoRoute(
      path: '/addAddress',
      builder: (context, state) => const AddNewAddressScreen(),
    ),
    GoRoute(
      path: '/favorites',
      builder: (context, state) => const FavoritesScreen(),
    ),
    GoRoute(
      path: '/perms',
      builder: (context, state) => const PermissionScreen(),
    ),
    
  ],
);