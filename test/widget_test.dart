// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:finance_tracking/firebase_options.dart';
import 'package:finance_tracking/view/authPage/signin.dart';
import 'package:finance_tracking/view/homePage/homepage.dart';
import 'package:finance_tracking/view/budgetView/budgetPage.dart';
import 'package:finance_tracking/view/budgetView/addPage.dart';
import 'package:finance_tracking/view/budgetView/editPage.dart';
import 'package:finance_tracking/view/budgetView/viewPage.dart';

import 'package:finance_tracking/view/reusableWidgets/budgetListDesign.dart';
import 'package:finance_tracking/view/reusableWidgets/reusableWidgets.dart';
import 'package:finance_tracking/view/reusableWidgets/textfield.dart';
import 'package:finance_tracking/view/profileDetail.dart';

void main() {
  testWidgets('Sign In Page Widget Testing', (WidgetTester tester) async {
    final originalOnError = FlutterError.onError; // Save the original handler

    FlutterError.onError = (details) {
      // Check if the error is a FirebaseException and ignore it
      if (details.exception is FirebaseException) {
        return;
      }
      // Call the original handler for other errors
      if (originalOnError != null) {
        originalOnError(details);
      }
    };

    await tester.pumpWidget(MaterialApp(home: SignInPage()));

    expect(find.byType(Image), findsOneWidget);
    final Image image = tester.widget<Image>(find.byType(Image));
    expect(image.image, isA<AssetImage>());

    expect(find.text('Sign In'), findsOneWidget);
    // expect(find.byType(TextField), findsAny);


    final Finder emailTextFieldFinder = find.widgetWithText(TextField, 'Enter Email');
    await tester.enterText(emailTextFieldFinder, 'test@example.com');
    expect(find.text('test@example.com'), findsOneWidget);

    // Test PasswordTextFormField
    final Finder passwordTextFieldFinder = find.widgetWithText(PasswordTextFormField, 'Enter the Password');
    await tester.enterText(passwordTextFieldFinder, 'password123');
    expect(find.text('password123'), findsOneWidget);

    // Tap the "Sign In" button
    expect(find.widgetWithText(TextButton, 'Sign In'), findsOneWidget);

    // Restore FlutterError.onError to its original state after the test
    FlutterError.onError = originalOnError;
  });

  testWidgets('Profile detail testing', (WidgetTester tester) async {
    final originalOnError = FlutterError.onError; // Save the original handler


    FlutterError.onError = (details) {
      // Check if the error is a FirebaseException and ignore it
      if (details.exception is FirebaseException) {
        return;
      }
      // Call the original handler for other errors
      if (originalOnError != null) {
        originalOnError(details);
      }
    };

    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: ProfileDetail()));

    expect(
      find.byType(CircleAvatar),
      findsOneWidget,
    );

    // Verify that the background image is set correctly.
    final CircleAvatar circleAvatar = tester.widget<CircleAvatar>(find.byType(CircleAvatar));
    expect(circleAvatar.backgroundImage, isA<AssetImage>());

    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Swam Htet'), findsOneWidget);
    expect(find.text('Department'), findsOneWidget);
    expect(find.text('Finance'), findsOneWidget);
    expect(find.text('Manager'), findsOneWidget);
    expect(find.text('Mr. Clark Kent'), findsOneWidget);
    expect(find.text('Contact Information'), findsOneWidget);
    expect(find.text('swemhtet.net@gmail.com'), findsOneWidget);


    // Restore FlutterError.onError to its original state after the test
    FlutterError.onError = originalOnError;
  });

  testWidgets('Home Page tabs testing ', (WidgetTester tester) async {
    final originalOnError = FlutterError.onError; // Save the original handler


    FlutterError.onError = (details) {
      // Check if the error is a FirebaseException and ignore it
      if (details.exception is FirebaseException) {
        return;
      }
      // Call the original handler for other errors
      if (originalOnError != null) {
        originalOnError(details);
      }
    };

    // Build our app and trigger a frame.

    await tester.pumpWidget(HomePage());

    // Verify that the initial tab is BudgetPage
    expect(find.byType(BudgetPage), findsOneWidget);
    expect(find.byType(ProfileDetail), findsNothing);

    // Tap on the Profile tab
    await tester.tap(find.byIcon(Icons.person));

    // Wait for the widget to rebuild after the tab tap.
    await tester.pump();

    // Verify that the active tab is now ProfileDetail
    expect(find.byType(BudgetPage), findsNothing);
    expect(find.byType(ProfileDetail), findsOneWidget);
    FlutterError.onError = originalOnError;
  });

  testWidgets('Budget Page Lists page testing', (WidgetTester tester) async {
    final originalOnError = FlutterError.onError; // Save the original handler


    FlutterError.onError = (details) {
      // Check if the error is a FirebaseException and ignore it
      if (details.exception is FirebaseException) {
        return;
      }
      // Call the original handler for other errors
      if (originalOnError != null) {
        originalOnError(details);
      }
    };

    // Build our app and trigger a frame.

    await tester.pumpWidget(MaterialApp(home: BudgetPage()));

    final addButton = find.byKey(Key('backButton'));
    expect(addButton, findsOneWidget);

    FlutterError.onError = originalOnError;
  });

  testWidgets('Budget Add Page Testing ', (WidgetTester tester) async {
    final originalOnError = FlutterError.onError; // Save the original handler

    FlutterError.onError = (details) {
      // Check if the error is a FirebaseException and ignore it
      if (details.exception is FirebaseException) {
        return;
      }
      // Call the original handler for other errors
      if (originalOnError != null) {
        originalOnError(details);
      }
    };

    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: AddPage()));

    // Find the IconButton by the specified key.
    final backButton = find.byKey(Key('backButton'));

    // Verify that the IconButton is present in the widget tree.
    expect(backButton, findsOneWidget);

    // Tap the IconButton and wait for the widget tree to rebuild.
    await tester.tap(backButton);
    await tester.pump();


    // Restore FlutterError.onError to its original state after the test
    FlutterError.onError = originalOnError;
  });

  testWidgets('Budget List Design Testing', (WidgetTester tester) async {
    // final originalOnError = FlutterError.onError; // Save the original handler
    //
    // FlutterError.onError = (details) {
    //   // Check if the error is a FirebaseException and ignore it
    //   if (details.exception is FirebaseException) {
    //     return;
    //   }
    //   // Call the original handler for other errors
    //   if (originalOnError != null) {
    //     originalOnError(details);
    //   }
    // };

    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BudgetListDesign(title: "Title Testing", budgetStatus: false, budget: "10000", documentID: "")
        )
      )
    );

    await tester.pumpAndSettle();

    // Find the BudgetListDesign by key or other identifier.
    final budgetListDesign = find.byType(BudgetListDesign);

    // Verify that the BudgetListDesign is present in the widget tree.
    expect(budgetListDesign, findsOneWidget);
    // final container = find.byType(Container);
    // final iconButton = find.byIcon(Icons.delete);
    //
    // expect(container, findsOneWidget);
    // expect(iconButton, findsOneWidget);
    //
    // expect(find.text("Title Testing"), findsOneWidget);

    // Restore FlutterError.onError to its original state after the test
    // FlutterError.onError = originalOnError;
  });

  testWidgets('Reusable TextField Widget Testing ', (WidgetTester tester) async {
    final originalOnError = FlutterError.onError; // Save the original handler

    FlutterError.onError = (details) {
      // Check if the error is a FirebaseException and ignore it
      if (details.exception is FirebaseException) {
        return;
      }
      // Call the original handler for other errors
      if (originalOnError != null) {
        originalOnError(details);
      }
    };

    TextEditingController testController = TextEditingController();
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Container(child: reusableTextField("Text Testing", Icons.person , testController))
        )
      )
    );

    expect(find.byType(TextField), findsOneWidget);

    // Restore FlutterError.onError to its original state after the test
    FlutterError.onError = originalOnError;
  });

}
