import { LoginBean } from "@ohos/lib_common/src/main/ets/bean/LoginBean"
import ResponseResult from "@ohos/lib_common/src/main/ets/bean/BaseResponse";
import { httpRequestPost } from "@ohos/lib_common/src/main/ets/network/repository/HttpRequest";
import BaseResponse from "@ohos/lib_common/src/main/ets/bean/BaseResponse";
import { ApiInterface } from "@ohos/lib_common/src/main/ets/network/ApiInterface";

@Observed
export class LoginViewModel {
  login(username: String, password: String): Promise<BaseResponse<LoginBean>> {
    return new Promise((resolve: Function) => {
      httpRequestPost<BaseResponse<LoginBean>>(ApiInterface.login
        .replace("{username}", username.toString())
        .replace("{password}", password.toString()), "")
        .then((data: ResponseResult<BaseResponse<LoginBean>>) => {
          resolve(data);
        });
    });
  }
}


let loginViewModel = new LoginViewModel();

export default loginViewModel as LoginViewModel;
