class MotelModel {
  String? name;
  String? logo;
  String? neighborhood;
  double? distance;
  int? qtyFavorite;
  List<Suites>? suites;
  int? qtyRating;
  double? averageRating;

  MotelModel(
      {this.name,
      this.logo,
      this.neighborhood,
      this.distance,
      this.qtyFavorite,
      this.suites,
      this.qtyRating,
      this.averageRating});

  MotelModel.fromJson(Map<String, dynamic> json) {
    name = json['fantasia'];
    logo = json['logo'];
    neighborhood = json['bairro'];
    distance = json['distancia'];
    qtyFavorite = json['qtdFavoritos'];
    if (json['suites'] != null) {
      suites = <Suites>[];
      json['suites'].forEach((v) {
        suites!.add(new Suites.fromJson(v));
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

  Suites(
      {this.name,
      this.qty,
      this.showQtyAvailable,
      this.photos,
      this.item,
      this.categoryItems,
      this.period});

  Suites.fromJson(Map<String, dynamic> json) {
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
        period!.add(new Period.fromJson(v));
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

  Period(
      {this.formatedTime,
      this.time,
      this.value,
      this.totalValue,
      this.hasDiscount,
      this.discount});

  Period.fromJson(Map<String, dynamic> json) {
    formatedTime = json['tempoFormatado'];
    time = json['tempo'];
    value = json['valor'];
    totalValue = json['valorTotal'];
    hasDiscount = json['temCortesia'];
    discount = json['desconto']?['desconto'];
  }
}
