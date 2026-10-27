class ItemsModel {
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  int? itemsPrice;
  int? itemsDiscount;
  String? itemsDate;
  int? itemsCat;
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;
  int? totalRating;
  int? ratingCount;
  int? itemfavorite;
  double? itemspricediscount;
  int? userRating;
  int? isRated;

  ItemsModel({
    this.itemsId,
    this.itemsName,
    this.itemsNameAr,
    this.itemsDesc,
    this.itemsDescAr,
    this.itemsImage,
    this.itemsCount,
    this.itemsActive,
    this.itemsPrice,
    this.itemsDiscount,
    this.itemsDate,
    this.itemsCat,
    this.categoriesId,
    this.categoriesName,
    this.categoriesNameAr,
    this.categoriesImage,
    this.categoriesDatetime,
    this.totalRating,
    this.ratingCount,
    this.itemfavorite,
    this.itemspricediscount,
    this.userRating,
    this.isRated,
  });

  ItemsModel.fromJson(Map<String, dynamic> json) {
    int? parseInt(dynamic value) {
      if (value == null) return null;
      if (value is int) return value;
      if (value is double) return value.toInt();
      if (value is String) {
        return int.tryParse(value) ?? double.tryParse(value)?.toInt();
      }
      return null;
    }

    double? parseDouble(dynamic value) {
      if (value == null) return null;
      if (value is double) return value;
      if (value is int) return value.toDouble();
      if (value is String) return double.tryParse(value);
      return null;
    }

    String? parseString(dynamic value) {
      if (value == null) return null;
      if (value is String) return value;
      return value.toString();
    }

    itemsId = parseInt(json['items_id']);
    itemsName = parseString(json['items_name']);
    itemsNameAr = parseString(json['items_name_ar']);
    itemsDesc = parseString(json['items_desc']);
    itemsDescAr = parseString(json['items_desc_ar']);
    itemsImage = parseString(json['items_image']);
    itemsCount = parseInt(json['items_count']);
    itemsActive = parseInt(json['items_active'] ?? json['Items_active']);
    itemsPrice = parseInt(json['items_price']);
    itemsDiscount = parseInt(json['items_discount']);
    itemsDate = parseString(json['items_date']);
    itemsCat = parseInt(json['items_cat']);
    categoriesId = parseInt(json['categories_id']);
    categoriesName = parseString(json['categories_name']);
    categoriesNameAr = parseString(json['categories_name_ar']);
    categoriesImage = parseString(json['categories_image']);
    categoriesDatetime = parseString(json['categories_datetime']);
    totalRating = parseInt(json['total_rating']);
    ratingCount = parseInt(json['rating_count']);
    itemfavorite = parseInt(json['favorite']);
    itemspricediscount = parseDouble(json['items_price_discount']);
    userRating = parseInt(json['user_rating']);
    isRated = parseInt(json['is_rated']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_desc'] = itemsDesc;
    data['items_desc_ar'] = itemsDescAr;
    data['items_image'] = itemsImage;
    data['items_count'] = itemsCount;
    data['Items_active'] = itemsActive;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_date'] = itemsDate;
    data['items_cat'] = itemsCat;
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_image'] = categoriesImage;
    data['categories_datetime'] = categoriesDatetime;
    data['total_rating'] = totalRating;
    data['rating_count'] = ratingCount;
    data['favorite'] = itemfavorite;
    data['items_price_discount'] = itemspricediscount;
    data['user_rating'] = userRating;
    data['is_rated'] = isRated;
    return data;
  }
}
