import 'package:dio/dio.dart';

import '../cubit/auth_cubit.dart';

class AuthData {
  Dio dio = Dio();
  register({
    required context,
    required name,
    required email,
    required phone,
    required nationalId,
    required gender,
    required password,
  }) async {
    try {
      var repo =
          await dio.post('https://elwekala.onrender.com/user/register', data: {
        "name": name,
        "email": email,
        "phone": phone,
        "nationalId": nationalId,
        "gender": gender,
        "password": password,
        "profileImage": AuthCubit.get(context).myImage
      });
      print(repo);
      return repo;
    } on DioException catch (error) {
      if (error.response != null) {
        print(error.response!.data);
        return error.response!.data;
      }
    }
  }

  logIn({
    required email,
    required password,
  }) async {
    try {
      var repo =
          await dio.post('https://elwekala.onrender.com/user/login', data: {
        "email": email,
        "password": password,
      });
      print(repo);

      return repo;
    } on DioException catch (error) {
      if (error.response != null) {
        print(error.response!.data);
        return error.response!.data;
      }
    }
  }

  // logIn({required email, required password}) async {
  //   try {
  //     var repo = await dio.post(
  //       'https://elwekala.onrender.com/user/login',
  //       data: {
  //         "email": email,
  //         "password": password,
  //       },
  //     );

  //     final token = repo.data['user']['token'];
  //     print(repo);
  //     print('Token: $token');

  //     // حفظ التوكن
  //     final prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('auth_token', token);

  //     return token; // ممكن ترجعه لو حبيت
  //   } on DioException catch (error) {
  //     print(error.response?.data);
  //     return null;
  //   }
  // }
}
