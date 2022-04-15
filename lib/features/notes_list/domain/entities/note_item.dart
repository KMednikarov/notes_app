import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NoteItem extends Equatable {
  final String id;
  final String title;
  final String text;
  final Color color;

  NoteItem({
    required this.id,
    required this.title,
    required this.text,
    required this.color,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
