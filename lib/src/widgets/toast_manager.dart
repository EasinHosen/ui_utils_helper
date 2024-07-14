/// Provides functionality to display context-less toasts in a Flutter application.
///
/// This library defines a [ToastManager] class that manages the display of toast messages
/// without requiring a `BuildContext`. It utilizes an [Overlay] to show messages on top
/// of the current UI, allowing for flexible positioning and customization.
///
/// The [ToastManager] class includes methods to initialize the toast system, show toasts,
/// and cancel all active toasts. It supports customizing the position, duration, appearance,
/// and behavior of the toast messages.
///
/// Usage:
/// 1. Call [ToastManager.initialize] early in your app's lifecycle to set up the toast system.
/// 2. Use [ToastManager.show] to display a toast message anywhere in your app.
/// 3. Optionally, use [ToastManager.cancelAllToasts] to remove all active toasts.
///
/// Example:
/// ```
/// ToastManager.initialize();
/// ToastManager.show("Hello, World!", toastPosition: ToastPosition.bottom);
/// ```
///
/// Note: This implementation has been tested on Android only.
library toast_manager;

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

/// Enum defining possible positions for the toast message on the screen.
enum ToastPosition {
  top,
  center,
  bottom,
}

/// Manages the display of toasts within an application.
///
/// This class uses an [Overlay] to show toast messages. It supports customizing the position,
/// duration, appearance, and behavior of the toasts. It is designed to be used without a
/// `BuildContext`, facilitating easier and more flexible toast management.
class ToastManager {
  static OverlayState? _overlayState;
  static final List<OverlayEntry> _activeEntries = [];

  /// Initializes the toast manager by capturing the current [OverlayState].
  ///
  /// This method should be called early in the app's lifecycle to ensure that the toast
  /// system is ready to display messages when needed.
  static void initialize() {
    _overlayState = navigatorKey.currentState?.overlay;
  }

  /// Displays a toast message on the screen.
  ///
  /// Parameters:
  /// - [message]: The message to be displayed in the toast.
  /// - [toastPosition]: The position of the toast on the screen. Defaults to [ToastPosition.bottom].
  /// - [duration]: The duration for which the toast should be visible. Defaults to 2 seconds.
  /// - [borderRadius]: The border radius of the toast. Allows for custom shapes.
  /// - [backgroundColor]: The background color of the toast.
  /// - [textColor]: The color of the text message.
  /// - [messageAlignment]: The alignment of the message text within the toast. Defaults to center.
  /// - [messageFontSize]: The font size of the message text. Defaults to 14.
  ///
  /// This method creates and displays a new toast message. If the [OverlayState] is not available,
  /// it prints an error message (in debug mode) and does not display the toast.
  static void show(
    ///the message that is to be shown
    String message, {
    ///determines the position of the toast
    ToastPosition toastPosition = ToastPosition.bottom,

    ///duration of toast, default is 2
    Duration? duration,

    ///border radius of the toast
    BorderRadius? borderRadius,

    ///background of the toast
    Color? backgroundColor,

    ///message text color
    Color? textColor,

    ///message text alignment default is center
    TextAlign? messageAlignment,

    ///message font size
    double messageFontSize = 14,
  }) {
    _overlayState ??= navigatorKey.currentState?.overlay;
    if (_overlayState == null) {
      if (kDebugMode) {
        print('OverlayState is null. Toast cannot be shown.');
      }
      return;
    }
    cancelAllToasts();

    final double yOffset = toastPosition == ToastPosition.top ? 0.15 : 0.1;

    final OverlayEntry overlayEntry = OverlayEntry(
      builder: (BuildContext context) => toastPosition == ToastPosition.center
          ? ToastWidget(
              topMargin: MediaQuery.of(context).padding.top + kToolbarHeight,
              message: message,
              backgroundColor: backgroundColor,
              borderRadius: borderRadius,
              messageAlignment: messageAlignment,
              messageFontSize: messageFontSize,
              textColor: textColor,
            )
          : Positioned(
              top: toastPosition == ToastPosition.top
                  ? MediaQuery.of(context).size.height * yOffset
                  // : toastPosition == ToastPosition.center
                  //     ? (MediaQuery.of(context).size.height * yOffset) -
                  //         (constraints.maxHeight / 2)
                  : null,
              bottom: toastPosition == ToastPosition.bottom
                  ? MediaQuery.of(context).size.height * yOffset
                  : null,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: ToastWidget(
                  message: message,
                  backgroundColor: backgroundColor,
                  borderRadius: borderRadius,
                  messageAlignment: messageAlignment,
                  messageFontSize: messageFontSize,
                  textColor: textColor,
                ),
              ),
            ),
    );

    _overlayState!.insert(overlayEntry);
    _activeEntries.add(overlayEntry);

    // Remove the overlay after a certain duration
    Future.delayed(duration ?? const Duration(seconds: 2), () {
      if (_activeEntries.contains(overlayEntry)) {
        overlayEntry.remove();
        _activeEntries.remove(overlayEntry);
      }
    });
  }

  /// Cancels and removes all active toasts from the screen.
  ///
  /// This method can be used to clear all messages currently being displayed.
  static void cancelAllToasts() {
    for (var entry in _activeEntries) {
      entry.remove();
    }
    _activeEntries.clear();
    /*if (kDebugMode) {
      print('All toasts canceled');
    }*/
  }
}

/// A widget representing a single toast message.
///
/// This widget is used internally by [ToastManager] to display each toast message. It supports
/// customization of the appearance and behavior of the toast.
class ToastWidget extends StatelessWidget {
  const ToastWidget(
      {super.key,
      this.backgroundColor,
      this.textColor,
      required this.message,
      this.messageAlignment,
      this.borderRadius,
      this.messageFontSize = 14,
      this.topMargin});

  ///background of the toast
  final Color? backgroundColor;

  ///message text color
  final Color? textColor;
  final String message;

  ///message text alignment default is center
  final TextAlign? messageAlignment;

  ///border radius of the toast
  final BorderRadius? borderRadius;

  ///message font size
  final double messageFontSize;

  ///message font size
  final double? topMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16)
          .copyWith(top: topMargin ?? 0),
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.grey[800],
          borderRadius: borderRadius ??
              const BorderRadius.all(
                Radius.circular(50),
              ),
        ),
        child: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: textColor ?? Colors.white,
                fontSize: messageFontSize,
              ),
          textAlign: messageAlignment ?? TextAlign.center,
        ),
      ),
    );
  }
}
