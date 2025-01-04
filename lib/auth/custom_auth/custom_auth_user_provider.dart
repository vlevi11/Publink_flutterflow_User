import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class PublinkUSERAuthUser {
  PublinkUSERAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<PublinkUSERAuthUser> publinkUSERAuthUserSubject =
    BehaviorSubject.seeded(PublinkUSERAuthUser(loggedIn: false));
Stream<PublinkUSERAuthUser> publinkUSERAuthUserStream() =>
    publinkUSERAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
