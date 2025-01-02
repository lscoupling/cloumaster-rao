import 'package:exam_demo/models/user.dart';

class AuthService {
  // 模擬後端認證
  static bool login(String username, String password) {
    // 這裡僅示範預設帳密（test/123）
    // 可依需求改成從後端 API 檢查
    if (username == 'test' && password == '123') {
      return true;
    }
    return false;
  }
}
