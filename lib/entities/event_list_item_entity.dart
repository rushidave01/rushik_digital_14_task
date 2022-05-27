import 'package:intl/intl.dart';

class EventListItemEntity {
  List<Events>? events;
  Meta? meta;
  String? error;
  EventListItemEntity.withError(String errorMessage) {
    error = errorMessage;
  }
  EventListItemEntity.fromJson(Map<String, dynamic> json) {
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(Events.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
}

class Events {
  String? type;
  int? id;
  String? datetimeUtc;
  Venue? venue;
  bool? datetimeTbd;
  List<Performers>? performers;
  bool? isOpen;
  String? datetimeLocal;
  bool? timeTbd;
  String? shortTitle;
  String? visibleUntilUtc;
  Stats? stats;
  List<Taxonomies>? taxonomies;
  String? url;
  int? score;
  String? announceDate;
  String? createdAt;
  bool? dateTbd;
  String? title;
  int? popularity;
  String? description;
  String? status;
  Announcements? announcements;
  bool? conditional;

  Events(
      {this.type,
        this.id,
        this.datetimeUtc,
        this.venue,
        this.datetimeTbd,
        this.performers,
        this.isOpen,
        this.datetimeLocal,
        this.timeTbd,
        this.shortTitle,
        this.visibleUntilUtc,
        this.stats,
        this.taxonomies,
        this.url,
        this.score,
        this.announceDate,
        this.createdAt,
        this.dateTbd,
        this.title,
        this.popularity,
        this.description,
        this.status,
        this.announcements,
        this.conditional});

  String getFormattedDate(){
   return DateFormat('EEE, d MMM yyyy hh:mm a')
       .format(DateTime.parse(datetimeUtc!));
  }
  Events.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    datetimeUtc = json['datetime_utc'];
    venue = json['venue'] != null ? Venue.fromJson(json['venue']) : null;
    datetimeTbd = json['datetime_tbd'];
    if (json['performers'] != null) {
      performers = <Performers>[];
      json['performers'].forEach((v) {
        performers!.add(Performers.fromJson(v));
      });
    }
    isOpen = json['is_open'];
    datetimeLocal = json['datetime_local'];
    timeTbd = json['time_tbd'];
    shortTitle = json['short_title'];
    visibleUntilUtc = json['visible_until_utc'];
    stats = json['stats'] != null ? Stats.fromJson(json['stats']) : null;
    if (json['taxonomies'] != null) {
      taxonomies = <Taxonomies>[];
      json['taxonomies'].forEach((v) {
        taxonomies!.add(Taxonomies.fromJson(v));
      });
    }
    url = json['url'];
    score = (json['score']??0.0).toInt();
    announceDate = json['announce_date'];
    createdAt = json['created_at'];
    dateTbd = json['date_tbd'];
    title = json['title'];
    popularity = (json['popularity']??0.0).toInt();
    description = json['description'];
    status = json['status'];
    announcements = json['announcements'] != null
        ? Announcements.fromJson(json['announcements'])
        : null;
    conditional = json['conditional'];
  }

}

class Venue {
  String? state;
  String? nameV2;
  String? postalCode;
  String? name;
  String? timezone;
  String? url;
  int? score;
  Location? location;
  String? address;
  String? country;
  bool? hasUpcomingEvents;
  int? numUpcomingEvents;
  String? city;
  String? slug;
  String? extendedAddress;
  int? id;
  int? popularity;
  int? metroCode;
  int? capacity;
  String? displayLocation;

  Venue(
      {this.state,
        this.nameV2,
        this.postalCode,
        this.name,
        this.timezone,
        this.url,
        this.score,
        this.location,
        this.address,
        this.country,
        this.hasUpcomingEvents,
        this.numUpcomingEvents,
        this.city,
        this.slug,
        this.extendedAddress,
        this.id,
        this.popularity,
        this.metroCode,
        this.capacity,
        this.displayLocation});

  Venue.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    nameV2 = json['name_v2'];
    postalCode = json['postal_code'];
    name = json['name'];
    timezone = json['timezone'];
    url = json['url'];
    score = (json['score']??0).toInt();
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    address = json['address'];
    country = json['country'];
    hasUpcomingEvents = json['has_upcoming_events'];
    numUpcomingEvents = json['num_upcoming_events'];
    city = json['city'];
    slug = json['slug'];
    extendedAddress = json['extended_address'];
    id = json['id'];
    popularity = json['popularity'];
    metroCode = json['metro_code'];
    capacity = json['capacity'];
    displayLocation = json['display_location'];
  }
}

class Location {
  double? lat;
  double? lon;

  Location({this.lat, this.lon});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }

}

class Performers {
  String? type;
  String? name;
  String? image;
  int? id;
  Images? images;
  bool? hasUpcomingEvents;
  bool? primary;
  Stats? stats;
  List<Taxonomies>? taxonomies;
  String? imageAttribution;
  String? url;
  int? score;
  String? slug;
  int? homeVenueId;
  String? shortName;
  int? numUpcomingEvents;
  String? imageLicense;
  int? popularity;
  bool? homeTeam;
  Location? location;
  String? imageRightsMessage;
  bool? awayTeam;

  Performers(
      {this.type,
        this.name,
        this.image,
        this.id,
        this.images,
        this.hasUpcomingEvents,
        this.primary,
        this.stats,
        this.taxonomies,
        this.imageAttribution,
        this.url,
        this.score,
        this.slug,
        this.homeVenueId,
        this.shortName,
        this.numUpcomingEvents,
        this.imageLicense,
        this.popularity,
        this.homeTeam,
        this.location,
        this.imageRightsMessage,
        this.awayTeam});

  Performers.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    image = json['image'];
    id = json['id'];
    images =
    json['images'] != null ? Images.fromJson(json['images']) : null;
    hasUpcomingEvents = json['has_upcoming_events'];
    primary = json['primary'];
    stats = json['stats'] != null ? Stats.fromJson(json['stats']) : null;
    if (json['taxonomies'] != null) {
      taxonomies = <Taxonomies>[];
      json['taxonomies'].forEach((v) {
        taxonomies!.add(Taxonomies.fromJson(v));
      });
    }
    imageAttribution = json['image_attribution'];
    url = json['url'];
    score = (json['score']??0.0).toInt();
    slug = json['slug'];
    homeVenueId = json['home_venue_id'];
    shortName = json['short_name'];
    numUpcomingEvents = json['num_upcoming_events'];
    imageLicense = json['image_license'];
    popularity = json['popularity'];
    homeTeam = json['home_team'];
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    imageRightsMessage = json['image_rights_message'];
    awayTeam = json['away_team'];
  }

}

class Images {
  String? huge;

  Images({this.huge});

  Images.fromJson(Map<String, dynamic> json) {
    huge = json['huge'];
  }

}

class Taxonomies {
  int? id;
  String? name;
  int? parentId;
  DocumentSource? documentSource;
  int? rank;

  Taxonomies(
      {this.id, this.name, this.parentId, this.documentSource, this.rank});

  Taxonomies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    parentId = json['parent_id'];
    documentSource = json['document_source'] != null
        ? DocumentSource.fromJson(json['document_source'])
        : null;
    rank = json['rank'];
  }

}

class DocumentSource {
  String? sourceType;
  String? generationType;

  DocumentSource({this.sourceType, this.generationType});

  DocumentSource.fromJson(Map<String, dynamic> json) {
    sourceType = json['source_type'];
    generationType = json['generation_type'];
  }

}

class Stats {
  int? listingCount;
  int? eventCount;
  int? averagePrice;
  int? lowestPriceGoodDeals;
  int? lowestPrice;
  int? highestPrice;
  int? visibleListingCount;
  // List<int>? dqBucketCounts;
  int? medianPrice;
  int? lowestSgBasePrice;
  int? lowestSgBasePriceGoodDeals;

  Stats(
      {this.listingCount,
        this.averagePrice,
        this.lowestPriceGoodDeals,
        this.lowestPrice,
        this.highestPrice,
        this.visibleListingCount,
        // this.dqBucketCounts,
        this.eventCount,
        this.medianPrice,
        this.lowestSgBasePrice,
        this.lowestSgBasePriceGoodDeals});

  Stats.fromJson(Map<String, dynamic> json) {
    listingCount = json['listing_count'];
    eventCount = json['event_count'];
    averagePrice = json['average_price'];
    lowestPriceGoodDeals = json['lowest_price_good_deals'];
    lowestPrice = json['lowest_price'];
    highestPrice = json['highest_price'];
    visibleListingCount = json['visible_listing_count'];
    // dqBucketCounts = json['dq_bucket_counts'].cast<int>();
    medianPrice = json['median_price'];
    lowestSgBasePrice = json['lowest_sg_base_price'];
    lowestSgBasePriceGoodDeals = json['lowest_sg_base_price_good_deals'];
  }

}

class Announcements {
  CheckoutDisclosures? checkoutDisclosures;

  Announcements({this.checkoutDisclosures});

  Announcements.fromJson(Map<String, dynamic> json) {
    checkoutDisclosures = json['checkout_disclosures'] != null
        ? CheckoutDisclosures.fromJson(json['checkout_disclosures'])
        : null;
  }

}

class CheckoutDisclosures {
  List<Messages>? messages;

  CheckoutDisclosures({this.messages});

  CheckoutDisclosures.fromJson(Map<String, dynamic> json) {
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(Messages.fromJson(v));
      });
    }
  }

}

class Messages {
  String? text;

  Messages({this.text});

  Messages.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

}

class Meta {
  int? total;
  int? took;
  int? page;
  int? perPage;

  Meta({this.total, this.took, this.page, this.perPage});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    took = json['took'];
    page = json['page'];
    perPage = json['per_page'];
  }

}
