part of 'veri_ekle_bloc.dart';

@immutable
abstract class VeriEkleState {}

class VeriEkleInitial extends VeriEkleState {}

class VeriGeldiState extends VeriEkleInitial {
  List myList = [];
  String veri;
  /* VeriGeldiState(this.veri) {
    myList.add(veri);
  }*/
  VeriGeldiState(this.veri) {
    myList.add(veri);
  }
}
