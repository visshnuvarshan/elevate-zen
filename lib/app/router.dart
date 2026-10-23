import 'package:flutter/material.dart';
import 'app.dart';

import '../auth/login.dart';

// Patient
import '../patient/home.dart';
import '../patient/case.dart';
import '../patient/chat.dart';
import '../patient/records.dart';
import '../patient/previous_records.dart';
import '../patient/profile.dart';
import '../patient/mental_health.dart';
import '../patient/doctor_chat.dart';
import '../patient/document_upload.dart';
import '../patient/abha.dart';

// Doctor
import '../doctor/home.dart';
import '../doctor/patients.dart';
import '../doctor/profile.dart';
import '../doctor/chat.dart';
import '../doctor/patient.dart';

// Veterinary
import '../veterinary/home.dart';
import '../veterinary/chat.dart';
import '../veterinary/records.dart';

class ElevateZenRouter {
  static const String login = '/';

  // Patient
  static const String patientHome = '/patient';
  static const String patientCase = '/patient/case';
  static const String patientChat = '/patient/chat';
  static const String patientRecords = '/patient/records';
  static const String previousRecords = '/patient/previous-records';
  static const String patientProfile = '/patient/profile';
  static const String patientMentalWellness = '/patient/mental-wellness';
  static const String patientDoctorChat = '/patient/doctor-chat';
  static const String patientDocuments = '/patient/documents';
  static const String patientAbha = '/patient/abha';

  // Doctor
  static const String doctorHome = '/doctor';
  static const String doctorPatients = '/doctor/patients';
  static const String doctorChat = '/doctor/chat';
  static const String doctorProfile = '/doctor/profile';
  static const String doctorPatient = '/doctor/patient';

  // Veterinary - temporarily kept
  static const String veterinaryHome = '/veterinary';
  static const String veterinaryRecords = '/veterinary/records';
  static const String veterinaryIntake = '/veterinary/intake';

  static Route<dynamic> onGenerateRoute(
    RouteSettings settings, {
    required AppType appType,
  }) {
    switch (settings.name) {
      // ─────────────────────────────
      // LOGIN
      // ─────────────────────────────

      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
          settings: settings,
        );

      // ─────────────────────────────
      // PATIENT APP
      // ─────────────────────────────

      case patientHome:
        return _patientRoute(
          appType,
          const PatientHomeScreen(),
          settings,
        );

      case patientCase:
        return _patientRoute(
          appType,
          const PatientCaseScreen(),
          settings,
        );

      case patientChat:
        return _patientRoute(
          appType,
          const PatientChatScreen(),
          settings,
        );

      case patientRecords:
        return _patientRoute(
          appType,
          const PatientRecordsScreen(),
          settings,
        );

      case previousRecords:
        return _patientRoute(
          appType,
          const PreviousRecordsScreen(),
          settings,
        );

      case patientProfile:
        return _patientRoute(
          appType,
          const PatientProfileScreen(),
          settings,
        );

      case patientMentalWellness:
        return _patientRoute(
          appType,
          const MentalWellnessScreen(),
          settings,
        );

      case patientDoctorChat:
        return _patientRoute(
          appType,
          const PatientDoctorChatScreen(),
          settings,
        );

      case patientDocuments:
        return _patientRoute(
          appType,
          const DocumentUploadScreen(),
          settings,
        );

      case patientAbha:
        return _patientRoute(
          appType,
          const AbhaScreen(),
          settings,
        );

      // ─────────────────────────────
      // DOCTOR APP
      // ─────────────────────────────

      case doctorHome:
        return _doctorRoute(
          appType,
          const DoctorHomeScreen(),
          settings,
        );

      case doctorPatients:
        return _doctorRoute(
          appType,
          const DoctorPatientsScreen(),
          settings,
        );

      case doctorPatient:
        return _doctorRoute(
          appType,
          const DoctorPatientScreen(),
          settings,
        );

      case doctorChat:
        return _doctorRoute(
          appType,
          const DoctorChatScreen(),
          settings,
        );

      case doctorProfile:
        return _doctorRoute(
          appType,
          const DoctorProfileScreen(),
          settings,
        );

      // ─────────────────────────────
      // VETERINARY
      // ─────────────────────────────

      case veterinaryHome:
        return MaterialPageRoute(
          builder: (_) => const VeterinaryHomeScreen(),
          settings: settings,
        );

      case veterinaryIntake:
        return MaterialPageRoute(
          builder: (_) => const VeterinaryChatScreen(),
          settings: settings,
        );

      case veterinaryRecords:
        return MaterialPageRoute(
          builder: (_) => const VeterinaryRecordsScreen(),
          settings: settings,
        );

      // ─────────────────────────────
      // UNKNOWN ROUTE
      // ─────────────────────────────

      default:
        return MaterialPageRoute(
          builder: (_) => const _PlaceholderScreen(
            title: 'Page Not Found',
          ),
          settings: settings,
        );
    }
  }

  // Patient routes are available only in Patient app.
  static Route<dynamic> _patientRoute(
    AppType appType,
    Widget page,
    RouteSettings settings,
  ) {
    if (appType != AppType.patient) {
      return _notAvailable(settings);
    }

    return MaterialPageRoute(
      builder: (_) => page,
      settings: settings,
    );
  }

  // Doctor routes are available only in Doctor app.
  static Route<dynamic> _doctorRoute(
    AppType appType,
    Widget page,
    RouteSettings settings,
  ) {
    if (appType != AppType.doctor) {
      return _notAvailable(settings);
    }

    return MaterialPageRoute(
      builder: (_) => page,
      settings: settings,
    );
  }

  static Route<dynamic> _notAvailable(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => const _PlaceholderScreen(
        title: 'Page Not Available',
      ),
      settings: settings,
    );
  }
}

class _PlaceholderScreen extends StatelessWidget {
  final String title;

  const _PlaceholderScreen({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}