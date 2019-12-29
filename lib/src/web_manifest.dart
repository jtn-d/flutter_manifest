class WebManifest {
  String name;
  String shortName;
  String version;
  String startUrl;
  String display;
  String backgroundColor;
  String description;
  List<Icons> icons;
  List<RelatedApplications> relatedApplications;

  WebManifest(
      {this.name,
      this.shortName,
      this.version,
      this.startUrl,
      this.display,
      this.backgroundColor,
      this.description,
      this.icons,
      this.relatedApplications});

  WebManifest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    shortName = json['short_name'];
    version = json['version'];
    startUrl = json['start_url'];
    display = json['display'];
    backgroundColor = json['background_color'];
    description = json['description'];
    if (json['icons'] != null) {
      icons = new List<Icons>();
      json['icons'].forEach((v) {
        icons.add(new Icons.fromJson(v));
      });
    }
    if (json['related_applications'] != null) {
      relatedApplications = new List<RelatedApplications>();
      json['related_applications'].forEach((v) {
        relatedApplications.add(new RelatedApplications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['short_name'] = this.shortName;
    data['version'] = this.version;
    data['start_url'] = this.startUrl;
    data['display'] = this.display;
    data['background_color'] = this.backgroundColor;
    data['description'] = this.description;
    if (this.icons != null) {
      data['icons'] = this.icons.map((v) => v.toJson()).toList();
    }
    if (this.relatedApplications != null) {
      data['related_applications'] =
          this.relatedApplications.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Icons {
  String src;
  String sizes;
  String type;

  Icons({this.src, this.sizes, this.type});

  Icons.fromJson(Map<String, dynamic> json) {
    src = json['src'];
    sizes = json['sizes'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['src'] = this.src;
    data['sizes'] = this.sizes;
    data['type'] = this.type;
    return data;
  }
}

class RelatedApplications {
  String platform;
  String url;

  RelatedApplications({this.platform, this.url});

  RelatedApplications.fromJson(Map<String, dynamic> json) {
    platform = json['platform'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['platform'] = this.platform;
    data['url'] = this.url;
    return data;
  }
}
