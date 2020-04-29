class BuiltBy {
    String avatar;
    String href;
    String username;

    BuiltBy({this.avatar, this.href, this.username});

    factory BuiltBy.fromJson(Map<String, dynamic> json) {
        return BuiltBy(
            avatar: json['avatar'], 
            href: json['href'], 
            username: json['username'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['avatar'] = this.avatar;
        data['href'] = this.href;
        data['username'] = this.username;
        return data;
    }
}