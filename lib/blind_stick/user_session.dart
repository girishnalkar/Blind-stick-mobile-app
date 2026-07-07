class UserSession {
  static String name = "";
  static String phone = "";

  static void setUser(String userName, String userPhone) {
    name = userName;
    phone = userPhone;
  }

  static String getUser() {
    return name.isEmpty ? "User" : name;
  }

  static String getPhone() {
    return phone;
  }

  static void clear() {
    name = "";
    phone = "";
  }
}