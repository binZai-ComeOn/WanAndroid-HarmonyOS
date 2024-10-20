import { LoginBean } from "@ohos/lib_common/src/main/ets/bean/LoginBean"
import ResponseResult from "@ohos/lib_common/src/main/ets/bean/BaseResponse";
import { httpRequestPost } from "@ohos/lib_common/src/main/ets/network/repository/HttpRequest";
import BaseResponse from "@ohos/lib_common/src/main/ets/bean/BaseResponse";
import { ApiInterface } from "@ohos/lib_common/src/main/ets/network/ApiInterface";

@Observed
export class LoginViewModel {
  login(username: string, password: string): Promise<BaseResponse<LoginBean>> {
    return new Promise((resolve: Function) => {
      httpRequestPost<BaseResponse<LoginBean>>(ApiInterface.login
        .replace("{username}", username)
        .replace("{password}", password))
        .then((data: ResponseResult<BaseResponse<LoginBean>>) => {
          resolve(data);
        });
    });
  }

  register(username: String, password1: String, password2: String): Promise<BaseResponse<LoginBean>> {
    return new Promise((resolve: Function) => {
      httpRequestPost<BaseResponse<LoginBean>>(ApiInterface.register
        .replace("{username}", username.toString())
        .replace("{password}", password1.toString())
        .replace("{repassword}", password2.toString()), "")
        .then((data: ResponseResult<BaseResponse<LoginBean>>) => {
          resolve(data);
        });
    });
  }
}


let loginViewModel = new LoginViewModel();

export default loginViewModel as LoginViewModel;
