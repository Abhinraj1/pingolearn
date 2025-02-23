
class ProductsModel {
  List<Products>? products;
  int? total;
  int? skip;
  int? limit;

  ProductsModel({this.products, this.total, this.skip, this.limit});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    products = json["products"] == null ? null : (json["products"] as List).map((e) => Products.fromJson(e)).toList();
    total = json["total"];
    skip = json["skip"];
    limit = json["limit"];
  }

  static List<ProductsModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => ProductsModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(products != null) {
      _data["products"] = products?.map((e) => e.toJson()).toList();
    }
    _data["total"] = total;
    _data["skip"] = skip;
    _data["limit"] = limit;
    return _data;
  }
}

class Products {
  int? id;
  String? title;
  String? description;
  String? category;
  dynamic price;
  dynamic discountPercentage;
  dynamic rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Reviews>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<String>? images;
  String? thumbnail;

  Products({this.id, this.title, this.description, this.category, this.price, this.discountPercentage, this.rating, this.stock, this.tags, this.brand, this.sku, this.weight, this.dimensions, this.warrantyInformation, this.shippingInformation, this.availabilityStatus, this.reviews, this.returnPolicy, this.minimumOrderQuantity, this.meta, this.images, this.thumbnail});

  Products.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];
    category = json["category"];
    price = json["price"];
    discountPercentage = json["discountPercentage"];
    rating = json["rating"];
    stock = json["stock"];
    tags = json["tags"] == null ? null : List<String>.from(json["tags"]);
    brand = json["brand"];
    sku = json["sku"];
    weight = json["weight"];
    dimensions = json["dimensions"] == null ? null : Dimensions.fromJson(json["dimensions"]);
    warrantyInformation = json["warrantyInformation"];
    shippingInformation = json["shippingInformation"];
    availabilityStatus = json["availabilityStatus"];
    reviews = json["reviews"] == null ? null : (json["reviews"] as List).map((e) => Reviews.fromJson(e)).toList();
    returnPolicy = json["returnPolicy"];
    minimumOrderQuantity = json["minimumOrderQuantity"];
    meta = json["meta"] == null ? null : Meta.fromJson(json["meta"]);
    images = json["images"] == null ? null : List<String>.from(json["images"]);
    thumbnail = json["thumbnail"];
  }

  static List<Products> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Products.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["description"] = description;
    _data["category"] = category;
    _data["price"] = price;
    _data["discountPercentage"] = discountPercentage;
    _data["rating"] = rating;
    _data["stock"] = stock;
    if(tags != null) {
      _data["tags"] = tags;
    }
    _data["brand"] = brand;
    _data["sku"] = sku;
    _data["weight"] = weight;
    if(dimensions != null) {
      _data["dimensions"] = dimensions?.toJson();
    }
    _data["warrantyInformation"] = warrantyInformation;
    _data["shippingInformation"] = shippingInformation;
    _data["availabilityStatus"] = availabilityStatus;
    if(reviews != null) {
      _data["reviews"] = reviews?.map((e) => e.toJson()).toList();
    }
    _data["returnPolicy"] = returnPolicy;
    _data["minimumOrderQuantity"] = minimumOrderQuantity;
    if(meta != null) {
      _data["meta"] = meta?.toJson();
    }
    if(images != null) {
      _data["images"] = images;
    }
    _data["thumbnail"] = thumbnail;
    return _data;
  }
}

class Meta {
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  Meta({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  Meta.fromJson(Map<String, dynamic> json) {
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    barcode = json["barcode"];
    qrCode = json["qrCode"];
  }

  static List<Meta> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Meta.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["barcode"] = barcode;
    _data["qrCode"] = qrCode;
    return _data;
  }
}

class Reviews {
  int? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  Reviews({this.rating, this.comment, this.date, this.reviewerName, this.reviewerEmail});

  Reviews.fromJson(Map<String, dynamic> json) {
    rating = json["rating"];
    comment = json["comment"];
    date = json["date"];
    reviewerName = json["reviewerName"];
    reviewerEmail = json["reviewerEmail"];
  }

  static List<Reviews> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Reviews.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["rating"] = rating;
    _data["comment"] = comment;
    _data["date"] = date;
    _data["reviewerName"] = reviewerName;
    _data["reviewerEmail"] = reviewerEmail;
    return _data;
  }
}

class Dimensions {
  dynamic width;
  dynamic height;
  dynamic depth;

  Dimensions({this.width, this.height, this.depth});

  Dimensions.fromJson(Map<String, dynamic> json) {
    width = json["width"];
    height = json["height"];
    depth = json["depth"];
  }

  static List<Dimensions> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Dimensions.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["width"] = width;
    _data["height"] = height;
    _data["depth"] = depth;
    return _data;
  }
}