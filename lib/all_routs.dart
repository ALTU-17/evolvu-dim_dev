
import 'package:evolvu/login.dart';
import 'package:evolvu/student_profile_page.dart';
import 'package:evolvu/username_page.dart';
import 'package:evolvu/StudentDashboard.dart';
import 'package:flutter/material.dart';

//const String dashBoardPage = '/dashBoardPage';
//const String loginPage = "/loginPage";
const String calendarPage = '/calendarPage';
const String profilePage = '/profilePage';
const String studentActivityPage = '/studentActivityPage';

class RouterConfigs {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case studentActivityPage:
        // return MaterialPageRoute(builder: (_) => ParentDashboard());
        // case studentActivityPage:
        // return MaterialPageRoute(builder: (_) => StudentActivityPage());
      // case loginPage:
      //   return MaterialPageRoute(builder: (_) => LoginPage());
      // case studentActivityPage:
      //   return MaterialPageRoute(builder: (_) => StudentActivityPage());

      //  case calendarPage:
      //    return MaterialPageRoute(builder: (_) => const CalendarPage());
      //    case profilePage:
      //    return MaterialPageRoute(builder: (_) => const ProfilePage());
      // case heritagepage:
      //   return MaterialPageRoute(builder: (_) => const HeritagePage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Page Not Found"),
            ),
          ),
        );
    }
  }
}

