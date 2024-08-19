// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get LoginSpace {
    return Intl.message(
      'Log in',
      name: 'LoginSpace',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get Signup {
    return Intl.message(
      'Sign up',
      name: 'Signup',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message(
      'Continue',
      name: 'Continue',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get PhoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'PhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password ?`
  String get ForgetPassword {
    return Intl.message(
      'Forget Password ?',
      name: 'ForgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account ? `
  String get no_account {
    return Intl.message(
      'Don\'t have an account ? ',
      name: 'no_account',
      desc: '',
      args: [],
    );
  }

  /// `Do you already have an account ? `
  String get already_have_account {
    return Intl.message(
      'Do you already have an account ? ',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Create new account`
  String get create_new_account {
    return Intl.message(
      'Create new account',
      name: 'create_new_account',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Shop Name`
  String get shop_name {
    return Intl.message(
      'Shop Name',
      name: 'shop_name',
      desc: '',
      args: [],
    );
  }

  /// `The Address`
  String get address {
    return Intl.message(
      'The Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Your Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Your Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get enter_phone_number {
    return Intl.message(
      'Enter your phone number',
      name: 'enter_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `We will send a code to verify the mobile number below`
  String get verification_message {
    return Intl.message(
      'We will send a code to verify the mobile number below',
      name: 'verification_message',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get send_code {
    return Intl.message(
      'Send Code',
      name: 'send_code',
      desc: '',
      args: [],
    );
  }

  /// `Verify your phone number`
  String get verify_your_phone_number {
    return Intl.message(
      'Verify your phone number',
      name: 'verify_your_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the 4 digit code sent to your mobile number`
  String get enter_4_digit_code {
    return Intl.message(
      'Please enter the 4 digit code sent to your mobile number',
      name: 'enter_4_digit_code',
      desc: '',
      args: [],
    );
  }

  /// `Didn’t receive a code ? `
  String get did_not_receive_code {
    return Intl.message(
      'Didn’t receive a code ? ',
      name: 'did_not_receive_code',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get resend_code {
    return Intl.message(
      'Resend Code',
      name: 'resend_code',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_password {
    return Intl.message(
      'New Password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Your new password must be different from the previously used passwords.`
  String get password_must_be_different {
    return Intl.message(
      'Your new password must be different from the previously used passwords.',
      name: 'password_must_be_different',
      desc: '',
      args: [],
    );
  }

  /// `Create new password`
  String get create_new_password {
    return Intl.message(
      'Create new password',
      name: 'create_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Wait for permission`
  String get wait_permission {
    return Intl.message(
      'Wait for permission',
      name: 'wait_permission',
      desc: '',
      args: [],
    );
  }

  /// `Please wait, the administrator will grant you permission soon.`
  String get please_wait {
    return Intl.message(
      'Please wait, the administrator will grant you permission soon.',
      name: 'please_wait',
      desc: '',
      args: [],
    );
  }

  /// `For contact with admin`
  String get contact_admin {
    return Intl.message(
      'For contact with admin',
      name: 'contact_admin',
      desc: '',
      args: [],
    );
  }

  /// `Send Email`
  String get send_email {
    return Intl.message(
      'Send Email',
      name: 'send_email',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get my_orders {
    return Intl.message(
      'My Orders',
      name: 'my_orders',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Account Information`
  String get account_information {
    return Intl.message(
      'Account Information',
      name: 'account_information',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
