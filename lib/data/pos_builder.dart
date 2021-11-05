import 'package:numeral/numeral.dart';
import 'package:flutter_9/data/pos.dart';

class Pos_Builder {
  List<Pos> pos_list = [
    Pos(
        pos_id: 1,
        tgl_transaksi: '01 - okt - 2001',
        items: 2,
        total_harga: 50000),
    Pos(
        pos_id: 2,
        tgl_transaksi: '01 - okt - 2001',
        items: 1,
        total_harga: 30000),
    Pos(
        pos_id: 3,
        tgl_transaksi: '01 - okt - 2001',
        items: 1,
        total_harga: 30000),
    Pos(
        pos_id: 4,
        tgl_transaksi: '01 - okt - 2001',
        items: 1,
        total_harga: 30000),
    Pos(
        pos_id: 5,
        tgl_transaksi: '01 - okt - 2001',
        items: 1,
        total_harga: 30000),
    Pos(
        pos_id: 6,
        tgl_transaksi: '01 - okt - 2001',
        items: 1,
        total_harga: 20000),
    Pos(
        pos_id: 7,
        tgl_transaksi: '01 - okt - 2001',
        items: 2,
        total_harga: 50000),
    Pos(
        pos_id: 8,
        tgl_transaksi: '01 - okt - 2001',
        items: 1,
        total_harga: 20000),
    Pos(
        pos_id: 9,
        tgl_transaksi: '01 - okt - 2001',
        items: 2,
        total_harga: 50000),
    Pos(
        pos_id: 10,
        tgl_transaksi: '01 - okt - 2001',
        items: 1,
        total_harga: 30000)
  ];

  String getTanggal(int index) {
    return this.pos_list[index].tgl_transaksi;
  }

  String getItems(int index) {
    return this.pos_list[index].items.toString();
  }

  String getTotal(int index) {
    return format(this.pos_list[index].total_harga);
  }

  String getTotalTransaksi() {
    double totalTrans = 0;
    this.pos_list.forEach((element) {
      totalTrans += element.total_harga;
    });
    return format(totalTrans);
  }

  String getTotalItems() {
    return this.pos_list.length.toString();
  }

  String format(double n) {
    return Numeral(n).value();
  }
}
