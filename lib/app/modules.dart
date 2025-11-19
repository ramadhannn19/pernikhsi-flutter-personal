import 'package:flutter/material.dart';
import 'package:pernikhsi/core/core.dart';
import 'package:pernikhsi/features/auth/module.dart';
import 'package:pernikhsi/features/home/module.dart';
import 'package:pernikhsi/features/setting/module.dart';

/// A global navigation key for accessing the application's [NavigatorState].
///
/// This allows navigation actions (push, pop, etc.) to be performed
/// outside the widget tree—for example, from services or BLoC layers.
final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

/// A route observer that listens to route changes (push, pop, replace).
///
/// Useful for analytics, logging, or triggering actions whenever
/// navigation changes occur.
final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

/// A list of feature modules that will be registered in the application.
///
/// Each module encapsulates its own routes, dependencies, and
/// initialization logic, making the app modular and scalable.
///
/// Example:
/// - [HomeModule] defines home-related routes and dependencies
/// - [SettingModule] defines settings-related routes and dependencies
var appModules = <BaseModule>[AuthModule(), HomeModule(), SettingModule()];
