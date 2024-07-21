import "package:flutter/material.dart";
import "package:thryv/common/theme.dart";

InputDecoration textInputDecoration = InputDecoration(
  filled: true,
  fillColor: const Color(0xFFE9E9E9),
  contentPadding: const EdgeInsets.all(12),
  border: UnderlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(width: 1, color: blue.shade100)),
  focusedBorder:
      UnderlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(width: 1, color: green)),
  errorBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(width: 1, color: Color(0xFFD84C4C))),
);
