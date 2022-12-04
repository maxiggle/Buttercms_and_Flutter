// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Welcome {
  Welcome({
    this.data,
  });

  final Data? data;

  factory Welcome.fromJson(String str) => Welcome.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Welcome.fromMap(Map<String, dynamic> json) => Welcome(
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        // ignore: prefer_null_aware_operators
        "data": data == null ? null : data?.toMap(),
      };

  @override
  String toString() => 'Welcome(data: $data)';
}

class Data {
  Data({
    this.slug,
    this.name,
    this.published,
    this.updated,
    this.pageType,
    this.fields,
  });

  final String? slug;
  final String? name;
  final DateTime? published;
  final DateTime? updated;
  final dynamic pageType;
  final Fields? fields;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        slug: json["slug"],
        name: json["name"],
        published: json["published"] == null
            ? null
            : DateTime.parse(json["published"]),
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        pageType: json["page_type"],
        fields: json["fields"] == null ? null : Fields.fromMap(json["fields"]),
      );

  Map<String, dynamic> toMap() => {
        "slug": slug,
        "name": name,
        "published": published == null ? null : published!.toIso8601String(),
        "updated": updated == null ? null : updated!.toIso8601String(),
        "page_type": pageType,
        "fields": fields == null ? null : fields!.toMap(),
      };

  @override
  String toString() {
    return 'Data(slug: $slug, name: $name, published: $published, updated: $updated, pageType: $pageType, fields: $fields)';
  }
}

class Fields {
  Fields({
    this.landingPageHero,
    this.itemList,
  });

  final LandingPageHero? landingPageHero;
  final ItemList? itemList;

  factory Fields.fromJson(String str) => Fields.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Fields.fromMap(Map<String, dynamic> json) => Fields(
        landingPageHero: json["landing_page_hero"] == null
            ? null
            : LandingPageHero.fromMap(json["landing_page_hero"]),
        itemList: json["item_list"] == null
            ? null
            : ItemList.fromMap(json["item_list"]),
      );

  Map<String, dynamic> toMap() => {
        "landing_page_hero":
            landingPageHero == null ? null : landingPageHero!.toMap(),
        "item_list": itemList == null ? null : itemList!.toMap(),
      };

  @override
  String toString() =>
      'Fields(landingPageHero: $landingPageHero, itemList: $itemList)';
}

class ItemList {
  ItemList(
      {this.itemName,
      this.itemName2,
      this.itemName3,
      this.itemDescription,
      this.itemDescription2,
      this.itemDescription3,
      this.image1,
      this.image2,
      this.image3});

  final String? itemName;
  final String? itemName2;
  final String? itemName3;
  final String? itemDescription;
  final String? itemDescription2;
  final String? itemDescription3;
  final String? image1;
  final String? image2;
  final String? image3;

  factory ItemList.fromJson(String str) => ItemList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ItemList.fromMap(Map<String, dynamic> json) => ItemList(
        itemName: json["item_name"],
        itemDescription: json["item_description"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        itemDescription2: json["item_description2"],
        itemDescription3: json["item_description3"],
        itemName2: json["item_name2"],
        itemName3: json["item_name3"],
      );

  Map<String, dynamic> toMap() => {
        "item_name": itemName,
        "item_description": itemDescription,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "item_description2": itemDescription2,
        "item_description3": itemDescription3,
        "item_name2": itemName2,
        "item_name3": itemName3,
      };
}

class LandingPageHero {
  LandingPageHero({
    this.heroText,
    this.subHeroText,
    this.heroImage,
    this.webIcon,
  });

  final String? heroText;
  final String? subHeroText;
  final String? heroImage;
  final String? webIcon;

  factory LandingPageHero.fromJson(String str) =>
      LandingPageHero.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LandingPageHero.fromMap(Map<String, dynamic> json) => LandingPageHero(
      heroText: json["hero_text"],
      subHeroText: json["sub-hero_text"],
      heroImage: json["hero_image"],
      webIcon: json['web_icon']);

  Map<String, dynamic> toMap() => {
        "hero_text": heroText,
        "sub-hero_text": subHeroText,
        "hero_image": heroImage,
        "web_icon": webIcon
      };

  @override
  String toString() =>
      'LandingPageHero(heroText: $heroText, subHeroText: $subHeroText, heroImage: $heroImage, web_icon: $webIcon)';
}
