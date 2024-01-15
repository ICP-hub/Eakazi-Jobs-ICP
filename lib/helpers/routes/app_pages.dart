// ignore: avoid_classes_with_only_static_members

import 'package:eakazijobs/features/freelancer/home/view/freelance_home_screen.dart';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../features/authentication/login/view/screen/sign_in.dart';
import '../../features/authentication/signup/view/screen/signup.dart';
import '../../features/bottom_nav_bar/bottom_nav_bar.dart';
import '../../features/bottom_nav_bar/botttom_nav_bar_binding/botttom_nav_bar_binding.dart';
import '../../features/employers/employer_post_jobs/view/screen/emp_confirm_details_screen.dart';
import '../../features/employers/employer_post_jobs/view/screen/emp_post_jobs_final_screen.dart';
import '../../features/employers/employer_post_jobs/view/screen/emp_post_jobs_screen.dart';
import '../../features/employers/employer_post_jobs/view/screen/emp_post_jobs_secound_screen.dart';
import '../../features/employers/employers_chat/view/screen/employer_chat_list.dart';
import '../../features/employers/employers_home/view/screen/employers_home_screen.dart';
import '../../features/freelancer/chat/view/screen/chat_list.dart';
import '../../features/freelancer/chat/view/screen/conversations.dart';
import '../../features/freelancer/courses/binding/assement_course_binding.dart';
import '../../features/freelancer/courses/view/assement_courses_sucessful.dart';
import '../../features/freelancer/courses/view/assement_fullvideo_fl.dart';
import '../../features/freelancer/courses/view/free_lance_courses.dart';
import '../../features/freelancer/courses/view/free_lance_courses_assesment.dart';
import '../../features/freelancer/courses/view/free_course_details.dart';
import '../../features/freelancer/jobs/view/binding/freelancer_jobs_details_binding.dart';
import '../../features/freelancer/jobs/view/screen/free_lance_job_details.dart';
import '../../features/freelancer/jobs/view/screen/free_lance_jobs.dart';
import '../../features/freelancer/profile/view/screen/fl_profile.dart';
import '../../features/freelancer/profile/view/screen/fl_profile_public.dart';
import '../../features/freelancer/wallet/view/screen/fl_wallet_screen.dart';
import '../../features/shared_widgets/feedBack_widgets/successful_screen_.dart';
import '../../features/splash/view/main_splash/main_splash.dart';
import '../../features/splash/view/onboarding/onboarding_1.dart';
import '../../features/splash/view/onboarding/onboarding_2.dart';
import '../../features/splash/view/onboarding/onboarding_3.dart';
import '../../features/trainers/trainer_create_course/view/screen/trainer_create_course_fouth_screen.dart';
import '../../features/trainers/trainer_create_course/view/screen/trainer_create_course_screen.dart';
import '../../features/trainers/trainer_create_course/view/screen/trainer_create_course_sec_screen.dart';
import '../../features/trainers/trainer_create_course/view/screen/trainer_create_course_third_screen.dart';
import '../../features/trainers/trainers_home/view/screen/trainers_home_screen.dart';
import '../../features/wallet/exchange/view/screen/exchange_pinpad.dart';
import '../../features/wallet/exchange/view/screen/wallet_exchange_screen.dart';
import '../../features/wallet/exchange/view/screen/wallet_exchange_screen_2.dart';
import '../../features/wallet/exchange_p2p/view/screen/wallet_exchange_p2p_screen_3.dart';
import '../../features/wallet/exchange_p2p/view/screen/wallet_exchange_p2p_screen_4.dart';
import '../../features/wallet/home/view/screen/wallet_deposite_screen.dart';
import '../../features/wallet/home/view/screen/wallet_screen.dart';
import '../../features/wallet/send/view/screen/send_pinpad.dart';
import '../../features/wallet/send/view/screen/wallet_send_screen.dart';
import '../../features/wallet/send/view/screen/wallet_send_screen_2.dart';
import '../../features/wallet/withdwal/view/screen/wallet_withdrawl_screen.dart';
import '../../features/wallet/withdwal/view/screen/wallet_withdrawl_screen_2.dart';
import '../../features/wallet/withdwal/view/screen/withdral_pinpad.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  //  static const INITIAL = Routes.HOMESCREENLOADING;
  static const initial = "/";

  static final routes = [
    GetPage(
      name: "/",
      binding: BottomNavBarBinding(),
      // page: () => const OnBoardingOne(),
      // page: () => SignUp(),
      // page: () => const FLJobsDetails(),
      page : () => const FreeLancerHome(),
      // page : () => const FLCoursesDetails(),
    ),
    GetPage(
      name: Routes.onBoarding2,
      // binding: MyProfileVendorBinding(),
      page: () => const OnBoardingTwo(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.freeLanceCourseVideos,
      // binding: MyProfileVendorBinding(),
      binding: FreeLanceAssementCourseVd(),
      page: () => const FLAssesmentVideo(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.flProfilePublic,
      // binding: MyProfileVendorBinding(),
      // binding: FreeLanceAssementCourseVd(),
      page: () => const FreeLanceProfilePublic(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.flChatList,
      // binding: MyProfileVendorBinding(),
      // binding: FreeLanceAssementCourseVd(),
      page: () => const ChatLists(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.bottomNavBar,
      binding: BottomNavBarBinding(),
      // binding: FreeLanceAssementCourseVd(),
      page: () => const BottomSheetScreen(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.send,
      // binding: MyProfileVendorBinding(),
      // binding: FreeLanceAssementCourseVd(),
      page: () => const WalletSendScreen(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.send2,
      // binding: MyProfileVendorBinding(),
      // binding: FreeLanceAssementCourseVd(),
      page: () => const WalletSendSecoundScreen(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.sendPinpad,
      // binding: MyProfileVendorBinding(),
      // binding: FreeLanceAssementCourseVd(),
      page: () => const SendPinPad(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.exchange,
      // binding: MyProfileVendorBinding(),
      // binding: FreeLanceAssementCourseVd(),
      page: () => const WalletexchangeScreen(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.exchange2,
      // binding: MyProfileVendorBinding(),
      // binding: FreeLanceAssementCourseVd(),
      page: () => const WalletexchangeSecoundScreen(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.empPostJoBScreen,
      // binding: MyProfileVendorBinding(),
      // binding: FreeLanceAssementCourseVd(),
      page: () => const EmployePostJobsScreen(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.empPostJoBScreen2,
      // binding: MyProfileVendorBinding(),
      // binding: FreeLanceAssementCourseVd(),
      page: () => const EmployePostJobsSecScreen(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.empPostJoBScreen3,
      // binding: MyProfileVendorBinding(),
      // binding: FreeLanceAssementCourseVd(),
      page: () => const EmployePostJobsFinalScreen(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.empConfirmDetailsScreen,
      // binding: MyProfileVendorBinding(),
      // binding: FreeLanceAssementCourseVd(),
      page: () => const EmployerConfirmDetailsScreen(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.exchangeMarketRatePinPad,
      // binding: MyProfileVendorBinding(),
      // binding: FreeLanceAssementCourseVd(),
      page: () => const ExchangePinPad(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.exchangeP2p,
      // binding: MyProfileVendorBinding(),
      // binding: FreeLanceAssementCourseVd(),
      page: () => const WalletexchangeP2ThirdScreen(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.exxchnageP2p2,
      // binding: MyProfileVendorBinding(),
      // binding: FreeLanceAssementCourseVd(),
      page: () => const WalletExxchangeP2pScreen4(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.withdrwal,
      // binding: MyProfileVendorBinding(),
      // binding: FreeLanceAssementCourseVd(),
      page: () => const WalletWithDrawalScreen(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.withdrwal2,
      // binding: MyProfileVendorBinding(),
      // binding: FreeLanceAssementCourseVd(),
      page: () => const WalletWithDrawalSecoundScreen(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.withdrwalPinpad,
      // binding: MyProfileVendorBinding(),
      // binding: FreeLanceAssementCourseVd(),
      page: () => const WithdrawlPinPad(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.successful,
      // binding: MyProfileVendorBinding(),
      // binding: FreeLanceAssementCourseVd(),
      page: () => const SuccessfulScreen(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.deposite,
      // binding: MyProfileVendorBinding(),
      // binding: FreeLanceAssementCourseVd(),
      page: () => const WalletDeposiiteScreen(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.flConverstation,
      // binding: MyProfileVendorBinding(),
      // binding: FreeLanceAssementCourseVd(),
      page: () => const Conversations2(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.fLJobs,
      // binding: MyProfileVendorBinding(),
      page: () => const FreeLancerJobs(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.flJobsDetails,
      binding: FreeLanJobsDetailsBinding(),
      // binding: MyProfileVendorBinding(),
      page: () => const FLJobsDetails(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.onBoarding2,
      // binding: MyProfileVendorBinding(),
      page: () => const OnBoardingTwo(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.onboardiing3,
      // binding: MyProfileVendorBinding(),
      page: () => const OnBoardingThree(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.home,
      // binding: MyProfileVendorBinding(),
      page: () => const BottomSheetScreen(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.freeLancerCoursers,
      // binding: MyProfileVendorBinding(),
      page: () => const FreeLancerCourses(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.freelancercoursesassesment,
      // binding: MyProfileVendorBinding(),
      page: () => const FreeLancerCoursesAssesment(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.login,
      // binding: MyProfileVendorBinding(),
      page: () => SignIn(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.signup,
      // binding: MyProfileVendorBinding(),
      page: () => SignUp(),
      // page: () => const MyProfileVendor(),
    ),
    GetPage(
      name: Routes.flCourseDetails,
      // binding: MyProfileVendorBinding(),
      page: () => const FLCoursesDetails(),
      // page: () => const MyProfileVendor(),
    ),
  ];
}
