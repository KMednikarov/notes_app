import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NoteItem extends Equatable {
  final String id;
  final String title;
  final String text;

  NoteItem({
    required this.id,
    required this.title,
    required this.text,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
