import 'package:equatable/equatable.dart';

abstract class OscEvent extends Equatable{
  const OscEvent();
  @override
  List<Object?> get props => [];
}

class SendOscEvent extends OscEvent{
  final List<String> args;
  const SendOscEvent(this.args);
}