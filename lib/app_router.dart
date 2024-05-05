import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:stadi_k_s_u/index.dart';
import 'package:stadi_k_s_u/nav_view.dart';
import 'package:stadi_k_s_u/reservation_model.dart';
import 'package:stadi_k_s_u/stadium_model.dart';

abstract class AppRouter {
  static const kStartView = '/';
  static const kSignupSigninView = '/signuploginSigninView';
  static const kNavView = '/NavView';
  static const kStadiumInfoView = '/reservationinfoWidget';
  static const kConfirmationView = '/confirmationPageWidget';
  static const kHomeView = '/homeView';
  static const kEditBookedConfirmationView = '/reservationsPageWidget';
  static const kEditBookedReservationView = '/myReservationWidget';
  static const kBookReservationView = '/reservationsPagefinalEditWidget';

  static const kMyReservationView = '/myReservationHistoryWidget';

  static const kProfileView = '/ProfileFinalWidget';

  static final router = GoRouter(
    routes: [
      GoRoute(
        // 1
        path: kStartView,
        builder: (context, state) => FirebaseAuth.instance.currentUser == null
            ? const StartView()
            : const NavView(),
      ),
     
      GoRoute(
        // 2
        path: kSignupSigninView,
        builder: (context, state) => const SignupSigninView(),
      ),
      GoRoute(
        // 3
        path:
        kNavView,
        builder: (context, state) => const NavView(),
      ),
      GoRoute(
        // 3 0
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        // 4
        path: kStadiumInfoView,
        builder: (context, state) {
          return StadiumInfoView(
            stadium: state.extra as StadiumModel,
          );
        },
      ),
      GoRoute(
        // 5
        path: kBookReservationView,
        builder: (context, state) => BookReservationView(
          stadium: state.extra as StadiumModel,
        ),
      ),
      GoRoute(
        // 6
        path: kConfirmationView, // Booking , barcode
        builder: (context, state) => ConfirmationView(
          reservationModel: state.extra as ReservationModel,
        ),
      ),
      // my reservation history final
      GoRoute(
        // 7
        path: kMyReservationView,
        builder: (context, state) => const MyReservationView(),
      ),
      GoRoute(
        // 8
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        // 9
        // edit, delete reservation
        path: kEditBookedReservationView,
        builder: (context, state) => const EditBookedReservationView(),
      ),

      GoRoute(
        // 12
        // edit  booked reservation
        path: kEditBookedConfirmationView,
        builder: (context, state) =>  EditBookedConfirmationView(
          reservation: state.extra as ReservationModel,
        ),
      ),
    ],
  );
}
