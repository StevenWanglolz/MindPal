import 'package:flutter/material.dart';
import 'package:mindpal_flutter_app/views/add_mood_diary_view.dart';
import 'package:mindpal_flutter_app/views/ai_consult_chat_view.dart';
import 'package:mindpal_flutter_app/views/audio_consult_view.dart';
import 'package:mindpal_flutter_app/views/base_view.dart';
import 'package:mindpal_flutter_app/views/ai_consult_view.dart';
import 'package:mindpal_flutter_app/views/consult_log_view.dart';
import 'package:mindpal_flutter_app/views/edit_mood_diary_view.dart';
import 'package:mindpal_flutter_app/views/edit_profile_view.dart';
import 'package:mindpal_flutter_app/views/first_view.dart';
import 'package:mindpal_flutter_app/views/forget_password_cert_view.dart';
import 'package:mindpal_flutter_app/views/forget_password_new_view.dart';
import 'package:mindpal_flutter_app/views/forget_password_view.dart';
import 'package:mindpal_flutter_app/views/consult_log_detail_view.dart';
import 'package:mindpal_flutter_app/views/mood_diary_view.dart';
import 'package:mindpal_flutter_app/views/my_therapist_view.dart';
import 'package:mindpal_flutter_app/views/quiz_view.dart';
import 'package:mindpal_flutter_app/views/therapist_list_view.dart';
import 'package:mindpal_flutter_app/views/home_view.dart';
import 'package:mindpal_flutter_app/views/login_view.dart';
import 'package:mindpal_flutter_app/views/profile_view.dart';
import 'package:mindpal_flutter_app/views/signup_view.dart';
import 'package:mindpal_flutter_app/views/weekly_mood_status.dart';

class Routes {
  static const String addMoodDiary = '/addMoodDiary';
  static const String aiConsult = '/aiConsult';
  static const String aiConsultChat = '/aiConsultChat';
  static const String audioConsult = '/audioConsult';
  static const String baseView = '/baseview';
  static const String consultLogDetail = '/consultLogDetail';
  static const String consultLog = '/consultLog';
  static const String editMoodDiary = '/editMoodDiary';
  static const String editProfile = '/editProfile';
  static const String first = '/first';
  static const String forgetPassword = '/forgetPassword';
  static const String forgetPasswordCert = '/forgetPasswordCert';
  static const String forgetPasswordNew = '/forgetPasswordNew';
  static const String home = '/home';
  static const String login = '/login';
  static const String moodDiary = '/moodDiary';
  static const String myTherapist = 'myTherapist';
  static const String profile = '/profile';
  static const String quiz = '/quiz';
  static const String signUp = '/signup';
  static const String therapistList = '/therapistList';
  static const String weeklyMoodStatus = '/weeklyMoodStatus';
  static const List pages = [
    HomeView(),
    MyTherapistView(),
    AIConsultView(),
    MoodDiaryView(),
    ProfileView()
  ];

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      addMoodDiary: (context) => const AddMoodDiaryView(),
      aiConsult: (context) => const AIConsultView(),
      aiConsultChat: (context) {
        final args =
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        final bool newChat = args['newChat'];
        return AIConsultChatView(newChat: newChat);
      },
      audioConsult: (context) => const AudioConsultView(),
      baseView: (context) => const BaseView(),
      consultLogDetail: (context) {
        final args =
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        final int id = args['id'];
        return ConsultLogDetailView(id: id);
      },
      consultLog: (context) => const ConsultLogView(),
      editMoodDiary: (context) {
        final args =
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        final int id = args['id'];
        return EditMoodDiaryView(id: id);
      },
      editProfile: (context) {
        final args =
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        final int id = args['id'];
        return EditProfileView(userID: id);
      },
      first: (context) => const FirstView(),
      forgetPassword: (context) => const ForgetPasswordView(),
      forgetPasswordCert: (context) {
        final args =
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        final String email = args['email'];
        final String processToken = args['processToken'];
        return ForgetPasswordCertView(email: email, processToken: processToken);
      },
      forgetPasswordNew: (context) {
        final args =
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        final String processToken = args['processToken'];
        return ForgetPasswordNewView(processToken: processToken);
      },
      home: (context) => const HomeView(),
      login: (context) => const LoginView(),
      moodDiary: (context) => const MoodDiaryView(),
      myTherapist: (context) => const MyTherapistView(),
      profile: (context) => const ProfileView(),
      quiz: (context) => const QuizView(),
      signUp: (context) => const SignupView(),
      therapistList: (context) => const TherapistListView(),
      weeklyMoodStatus: (context) => const WeeklyMoodStatusView(),
    };
  }
}
