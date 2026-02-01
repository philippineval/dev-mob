// lib/model/get_product_response.dart

class GetProductResponse {
  final ProductResponse? response;
  final dynamic error;

  GetProductResponse.fromJSON(Map<String, dynamic> json)
      : response = (json['response'] is Map<String, dynamic>)
            ? ProductResponse.fromJSON(json['response'] as Map<String, dynamic>)
            : null,
        error = json['error'];
}

class ProductResponse {
  final String barcode;

  final String? name;
  final String? altName;
  final String? quantity;

  final Pictures? pictures;

  final List<String>? brands;
  final List<String>? stores;
  final List<String>? countries;
  final List<String>? manufacturingCountries;

  final String? nutriScore; // ex: "E"
  final int? novaScore; // ex: 4
  final int? ecoScore; // ex: 60
  final String? ecoScoreGrade; // ex: "B"
  final int? nutritionScore;

  final Ingredients? ingredients;

  final NutrientLevels? nutrientLevels;
  final NutritionFacts? nutritionFacts;
  final NutriScoreLevels? levels;

  final SimpleList? traces;
  final Map<String, String>? additives;
  final SimpleList? allergens;

  final List<String>? packaging;

  final Analysis? analysis;

  ProductResponse.fromJSON(Map<String, dynamic> json)
      : barcode = (json['barcode'] ?? '').toString(),
        name = json['name']?.toString(),
        altName = json['altName']?.toString(),
        quantity = json['quantity']?.toString(),
        pictures = (json['pictures'] is Map<String, dynamic>)
            ? Pictures.fromJSON(json['pictures'] as Map<String, dynamic>)
            : null,
        brands = _asStringList(json['brands']),
        stores = _asStringList(json['stores']),
        countries = _asStringList(json['countries']),
        manufacturingCountries = _asStringList(json['manufacturingCountries']),
        nutriScore = json['nutriScore']?.toString(),
        novaScore = _asInt(json['novaScore']),
        ecoScore = _asInt(json['ecoScore']),
        ecoScoreGrade = json['ecoScoreGrade']?.toString(),
        nutritionScore = _asInt(json['nutritionScore']),
        ingredients = (json['ingredients'] is Map<String, dynamic>)
            ? Ingredients.fromJSON(json['ingredients'] as Map<String, dynamic>)
            : null,
        nutrientLevels = (json['nutrientLevels'] is Map<String, dynamic>)
            ? NutrientLevels.fromJSON(
                json['nutrientLevels'] as Map<String, dynamic>)
            : null,
        nutritionFacts = (json['nutritionFacts'] is Map<String, dynamic>)
            ? NutritionFacts.fromJSON(
                json['nutritionFacts'] as Map<String, dynamic>)
            : null,
        levels = (json['levels'] is Map<String, dynamic>)
            ? NutriScoreLevels.fromJSON(json['levels'] as Map<String, dynamic>)
            : null,
        traces = (json['traces'] is Map<String, dynamic>)
            ? SimpleList.fromJSON(json['traces'] as Map<String, dynamic>)
            : null,
        additives = _asStringMap(json['additives']),
        allergens = (json['allergens'] is Map<String, dynamic>)
            ? SimpleList.fromJSON(json['allergens'] as Map<String, dynamic>)
            : null,
        packaging = _asStringList(json['packaging']),
        analysis = (json['analysis'] is Map<String, dynamic>)
            ? Analysis.fromJSON(json['analysis'] as Map<String, dynamic>)
            : null;

  static int? _asInt(dynamic v) {
    if (v == null) return null;
    if (v is int) return v;
    return int.tryParse(v.toString());
  }

  static List<String>? _asStringList(dynamic v) {
    if (v == null) return null;
    if (v is List) {
      final list = v.map((e) => e.toString()).toList();
      return list.isEmpty ? null : list;
    }
    return null;
  }

  static Map<String, String>? _asStringMap(dynamic v) {
    if (v == null) return null;
    if (v is Map) {
      final map = <String, String>{};
      v.forEach((key, value) {
        map[key.toString()] = value.toString();
      });
      return map.isEmpty ? null : map;
    }
    return null;
  }
}

class Pictures {
  final String? product;
  final String? front;
  final String? ingredients;
  final String? nutrition;

  Pictures.fromJSON(Map<String, dynamic> json)
      : product = json['product']?.toString(),
        front = json['front']?.toString(),
        ingredients = json['ingredients']?.toString(),
        nutrition = json['nutrition']?.toString();
}

class Ingredients {
  final bool? containsPalmOil;
  final List<String>? list;
  final String? withAllergens;
  final List<IngredientDetail>? details;

  Ingredients.fromJSON(Map<String, dynamic> json)
      : containsPalmOil = _asBool(json['containsPalmOil']),
        list = _asStringList(json['list']),
        withAllergens = json['withAllergens']?.toString(),
        details = _asDetails(json['details']);

  static bool? _asBool(dynamic v) {
    if (v == null) return null;
    if (v is bool) return v;
    if (v is String) {
      if (v.toLowerCase() == 'true') return true;
      if (v.toLowerCase() == 'false') return false;
    }
    return null;
  }

  static List<String>? _asStringList(dynamic v) {
    if (v == null) return null;
    if (v is List) {
      final list = v.map((e) => e.toString()).toList();
      return list.isEmpty ? null : list;
    }
    return null;
  }

  static List<IngredientDetail>? _asDetails(dynamic v) {
    if (v == null) return null;
    if (v is List) {
      final list = v
          .whereType<Map<String, dynamic>>()
          .map((e) => IngredientDetail.fromJSON(e))
          .toList();
      return list.isEmpty ? null : list;
    }
    return null;
  }
}

class IngredientDetail {
  final bool? vegan;
  final bool? vegetarian;
  final bool? containsPalmOil;
  final String? percent; // dans ton JSON c’est "null" (string)
  final String? value;

  IngredientDetail.fromJSON(Map<String, dynamic> json)
      : vegan = _asBool(json['vegan']),
        vegetarian = _asBool(json['vegetarian']),
        containsPalmOil = _asBool(json['containsPalmOil']),
        percent = json['percent']?.toString(),
        value = json['value']?.toString();

  static bool? _asBool(dynamic v) {
    if (v == null) return null;
    if (v is bool) return v;
    if (v is String) {
      if (v.toLowerCase() == 'true') return true;
      if (v.toLowerCase() == 'false') return false;
    }
    return null;
  }
}

class NutrientLevels {
  final NutrientLevelItem? fat;
  final NutrientLevelItem? salt;
  final NutrientLevelItem? saturatedFat;
  final NutrientLevelItem? sugars;

  NutrientLevels.fromJSON(Map<String, dynamic> json)
      : fat = (json['fat'] is Map<String, dynamic>)
            ? NutrientLevelItem.fromJSON(json['fat'] as Map<String, dynamic>)
            : null,
        salt = (json['salt'] is Map<String, dynamic>)
            ? NutrientLevelItem.fromJSON(json['salt'] as Map<String, dynamic>)
            : null,
        saturatedFat = (json['saturatedFat'] is Map<String, dynamic>)
            ? NutrientLevelItem.fromJSON(
                json['saturatedFat'] as Map<String, dynamic>)
            : null,
        sugars = (json['sugars'] is Map<String, dynamic>)
            ? NutrientLevelItem.fromJSON(json['sugars'] as Map<String, dynamic>)
            : null;
}

class NutrientLevelItem {
  final String? level;
  final double? per100g;

  NutrientLevelItem.fromJSON(Map<String, dynamic> json)
      : level = json['level']?.toString(),
        per100g = _asDouble(json['per100g']);

  static double? _asDouble(dynamic v) {
    if (v == null) return null;
    if (v is num) return v.toDouble();
    return double.tryParse(v.toString());
  }
}

class NutritionFacts {
  final String? servingSize;

  final Nutriment? calories;
  final Nutriment? fat;
  final Nutriment? saturatedFat;
  final Nutriment? carbohydrate;
  final Nutriment? sugar;
  final Nutriment? fiber;
  final Nutriment? proteins;
  final Nutriment? sodium;
  final Nutriment? salt;
  final Nutriment? energy;

  NutritionFacts.fromJSON(Map<String, dynamic> json)
      : servingSize = json['servingSize']?.toString(),
        calories = (json['calories'] is Map<String, dynamic>)
            ? Nutriment.fromJSON(json['calories'] as Map<String, dynamic>)
            : null,
        fat = (json['fat'] is Map<String, dynamic>)
            ? Nutriment.fromJSON(json['fat'] as Map<String, dynamic>)
            : null,
        saturatedFat = (json['saturatedFat'] is Map<String, dynamic>)
            ? Nutriment.fromJSON(json['saturatedFat'] as Map<String, dynamic>)
            : null,
        carbohydrate = (json['carbohydrate'] is Map<String, dynamic>)
            ? Nutriment.fromJSON(json['carbohydrate'] as Map<String, dynamic>)
            : null,
        sugar = (json['sugar'] is Map<String, dynamic>)
            ? Nutriment.fromJSON(json['sugar'] as Map<String, dynamic>)
            : null,
        fiber = (json['fiber'] is Map<String, dynamic>)
            ? Nutriment.fromJSON(json['fiber'] as Map<String, dynamic>)
            : null,
        proteins = (json['proteins'] is Map<String, dynamic>)
            ? Nutriment.fromJSON(json['proteins'] as Map<String, dynamic>)
            : null,
        sodium = (json['sodium'] is Map<String, dynamic>)
            ? Nutriment.fromJSON(json['sodium'] as Map<String, dynamic>)
            : null,
        salt = (json['salt'] is Map<String, dynamic>)
            ? Nutriment.fromJSON(json['salt'] as Map<String, dynamic>)
            : null,
        energy = (json['energy'] is Map<String, dynamic>)
            ? Nutriment.fromJSON(json['energy'] as Map<String, dynamic>)
            : null;
}

class Nutriment {
  final String? unit;
  final String? perServing;
  final String? per100g;

  Nutriment.fromJSON(Map<String, dynamic> json)
      : unit = json['unit']?.toString(),
        perServing = json['perServing']?.toString(),
        per100g = json['per100g']?.toString();
}

class NutriScoreLevels {
  final NutriScoreLevel? energy;
  final NutriScoreLevel? fiber;
  final NutriScoreLevel? fruitsVegetablesLegumes;
  final NutriScoreLevel? proteins;
  final NutriScoreLevel? salt;
  final NutriScoreLevel? saturatedFat;
  final NutriScoreLevel? sugars;

  NutriScoreLevels.fromJSON(Map<String, dynamic> json)
      : energy = _level(json['energy']),
        fiber = _level(json['fiber']),
        fruitsVegetablesLegumes = _level(json['fruitsVegetablesLegumes']),
        proteins = _level(json['proteins']),
        salt = _level(json['salt']),
        saturatedFat = _level(json['saturatedFat']),
        sugars = _level(json['sugars']);

  static NutriScoreLevel? _level(dynamic v) {
    if (v is Map<String, dynamic>) return NutriScoreLevel.fromJSON(v);
    return null;
  }
}

class NutriScoreLevel {
  final double? points;
  final double? maxPoints;
  final String? unit;
  final double? value;
  final String? type; // "negative" / "positive" / "unknown"

  NutriScoreLevel.fromJSON(Map<String, dynamic> json)
      : points = _asDouble(json['points']),
        maxPoints = _asDouble(json['maxPoints']),
        unit = json['unit']?.toString(),
        value = _asDouble(json['value']),
        type = json['type']?.toString();

  static double? _asDouble(dynamic v) {
    if (v == null) return null;
    if (v is num) return v.toDouble();
    return double.tryParse(v.toString());
  }
}

class SimpleList {
  final List<String>? list;

  SimpleList.fromJSON(Map<String, dynamic> json)
      : list = (json['list'] is List)
            ? (json['list'] as List).map((e) => e.toString()).toList()
            : null;
}

class Analysis {
  final String? palmOil; // "no"
  final String? vegan; // "no"
  final String? vegetarian; // "maybe"

  Analysis.fromJSON(Map<String, dynamic> json)
      : palmOil = json['palmOil']?.toString(),
        vegan = json['vegan']?.toString(),
        vegetarian = json['vegetarian']?.toString();
}
