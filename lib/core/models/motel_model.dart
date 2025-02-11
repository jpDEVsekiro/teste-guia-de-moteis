import 'package:intl/intl.dart';

class MotelModel {
  String? name;
  String? logo;
  String? neighborhood;
  double? distance;
  int? qtyFavorite;
  List<Suites>? suites;
  int? qtyRating;
  double? averageRating;
  bool favorite;

  MotelModel(
      {required this.name,
      this.logo,
      this.neighborhood,
      this.distance,
      this.qtyFavorite,
      this.suites,
      this.qtyRating,
      this.favorite = false,
      this.averageRating});

  MotelModel.fromJson(Map<String, dynamic> json, {this.favorite = false}) {
    name = json['fantasia'] ?? 'nome';
    logo = json['logo'];
    neighborhood = json['bairro'];
    distance = json['distancia'];
    qtyFavorite = json['qtdFavoritos'];
    if (json['suites'] != null) {
      suites = <Suites>[];
      json['suites'].forEach((v) {
        suites!.add(new Suites.fromJson(v,
            motelName: name ?? 'nome', neighborhood: neighborhood ?? 'bairro'));
      });
    }
    qtyRating = json['qtdAvaliacoes'];
    averageRating = json['media'];
  }
}

class Suites {
  String? name;
  int? qty;
  bool? showQtyAvailable;
  List<String>? photos;
  List<Item>? item;
  List<CategoryItem>? categoryItems;
  List<Period>? period;
  String motelName;
  String neighborhood;

  Suites(
      {this.name,
      this.qty,
      this.showQtyAvailable,
      this.photos,
      this.item,
      this.categoryItems,
      required this.motelName,
      required this.neighborhood,
      this.period});

  Suites.fromJson(Map<String, dynamic> json,
      {required this.motelName, required this.neighborhood}) {
    name = json['nome'];
    qty = json['qtd'];
    showQtyAvailable = json['exibirQtdDisponiveis'];
    photos = json['fotos'].cast<String>();
    if (json['itens'] != null) {
      item = <Item>[];
      json['itens'].forEach((v) {
        item!.add(new Item.fromJson(v));
      });
    }
    if (json['categoriaItens'] != null) {
      categoryItems = <CategoryItem>[];
      json['categoriaItens'].forEach((v) {
        categoryItems!.add(new CategoryItem.fromJson(v));
      });
    }
    if (json['periodos'] != null) {
      period = <Period>[];
      json['periodos'].forEach((v) {
        period!.add(new Period.fromJson(v, motelName: motelName));
      });
    }
  }
}

class Item {
  String? name;

  Item({this.name});

  Item.fromJson(Map<String, dynamic> json) {
    name = json['nome'];
  }
}

class CategoryItem {
  String? nome;
  String? icone;

  CategoryItem({this.nome, this.icone});

  CategoryItem.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    icone = json['icone'];
  }
}

class Period {
  String? formatedTime;
  String? time;
  double? value;
  double? totalValue;
  bool? hasDiscount;
  double? discount;
  String motelName;

  Period(
      {this.formatedTime,
      this.time,
      this.value,
      this.totalValue,
      this.hasDiscount,
      this.discount,
      required this.motelName});

  Period.fromJson(Map<String, dynamic> json, {required this.motelName}) {
    formatedTime = json['tempoFormatado'];
    motelName = motelName;
    time = json['tempo'];
    value = json['valor'];
    totalValue = json['valorTotal'];
    hasDiscount = json['temCortesia'];
    discount = json['desconto']?['desconto'];
  }

  int get discountPercentageValue => ((discount! / value!) * 100).floor();
  String get formatedTotalValue =>
      'R\$${NumberFormat('###.00', 'pt_BT').format(totalValue)}';
  String get formatedValue =>
      'R\$${NumberFormat('###.00', 'pt_BT').format(value)}';
}
