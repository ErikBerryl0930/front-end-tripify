// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:tripify_app/model/user.dart';

// class UserProvider extends ChangeNotifier {
//   User? _user;

//   User? get user => _user;

//   void updateUser(User newUser) {
//     _user = newUser;
//     notifyListeners();
//   }

//   void updateUserFromResponse(
//       Map<String, dynamic> userData, BuildContext context) {
//     User user = User(
//       id: userData['user']['id'],
//       username: userData['user']['username'],
//       email: userData['user']['email'],
//       role: userData['user']['role'],
//     );

//     print(user);

//     // Get the UserProvider and update the user
//     UserProvider userProvider =
//         Provider.of<UserProvider>(context, listen: false);
//     userProvider.updateUser(user);
//   }
// }
