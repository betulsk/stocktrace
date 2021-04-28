import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'veri_ekle_event.dart';
part 'veri_ekle_state.dart';

class VeriEkleBloc extends Bloc<VeriEkleEvent, VeriGeldiState> {
  VeriEkleBloc() : super(VeriGeldiState("Ana Depo"));

  @override
  Stream<VeriGeldiState> mapEventToState(
    VeriEkleEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is VeriGeldiEvent) {
      // yield VeriGeldiState(event.gelenVeri);
      yield VeriGeldiState(event.gelenVeri);
    }
  }
}
