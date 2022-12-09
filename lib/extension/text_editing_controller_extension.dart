import 'package:flutter/material.dart';

extension TextEditingControllerExtension on TextEditingController {
  VoidCallback addAndRemoveListener(VoidCallback listener) {
    addListener(listener);
    return () => removeListener(listener);
  }
}
