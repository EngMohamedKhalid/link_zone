class PaginationModel {
  PaginationModel({
    this.totalItems,
    this.countItems,
    this.perPage,
    this.totalPages,
    this.currentPage,
    this.nextPageUrl,
    this.pervPageUrl,});

  PaginationModel.fromJson(dynamic json) {
    totalItems = json['total_items'];
    countItems = json['count_items'];
    perPage = json['per_page'];
    totalPages = json['total_pages'];
    currentPage = json['current_page'];
    nextPageUrl = json['next_page_url'];
    pervPageUrl = json['perv_page_url'];
  }
  num? totalItems;
  num? countItems;
  num? perPage;
  num? totalPages;
  num? currentPage;
  String? nextPageUrl;
  String? pervPageUrl;

}