part of 'veri_ekle_bloc.dart';

@immutable
abstract class VeriEkleEvent {}

class VeriGeldiEvent extends VeriEkleEvent {
  String gelenVeri;
  VeriGeldiEvent(this.gelenVeri);
}
