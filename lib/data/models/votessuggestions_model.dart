class votessuggestions_model {
  String? vsId;
  String? suggestion;
  String? vote;
  String? vsApprove;
  String? usersId;
  String? placeId;
  String? vsDate;

  votessuggestions_model(
      {this.vsId,
        this.suggestion,
        this.vote,
        this.vsApprove,
        this.usersId,
        this.placeId,
        this.vsDate});

  votessuggestions_model.fromJson(Map<String, dynamic> json) {
    vsId = json['vs_id'];
    suggestion = json['suggestion'];
    vote = json['vote'];
    vsApprove = json['vs_approve'];
    usersId = json['users_id'];
    placeId = json['place_id'];
    vsDate = json['vs_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vs_id'] = this.vsId;
    data['suggestion'] = this.suggestion;
    data['vote'] = this.vote;
    data['vs_approve'] = this.vsApprove;
    data['users_id'] = this.usersId;
    data['place_id'] = this.placeId;
    data['vs_date'] = this.vsDate;
    return data;
  }
}