import 'package:equatable/equatable.dart';

abstract class OscSenderState extends Equatable{
  const OscSenderState();
  @override
  List<Object?> get props => [];
}

class OscSenderStateLoading extends OscSenderState{
  const OscSenderStateLoading();
}

class OscSenderStateLoaded extends OscSenderState{
  const OscSenderStateLoaded();
}

class OscSenderStateError extends OscSenderState{
  final String message;
  const OscSenderStateError(this.message);
}