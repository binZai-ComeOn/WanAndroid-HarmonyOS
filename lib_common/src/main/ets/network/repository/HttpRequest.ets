import axios, { AxiosError, AxiosResponse } from '@ohos/axios'
import { ClickUtil, JSONUtil, LogUtil } from '@pura/harmony-utils'
import { BaseResponse } from '../../bean/BaseResponse'
import { ApiInterface } from '../ApiInterface'

export class HttpRequest {
  private static mInstance: HttpRequest

  static getInstance(): HttpRequest {
    if (HttpRequest.mInstance === undefined) {
      HttpRequest.mInstance = new HttpRequest()
    }
    return HttpRequest.mInstance
  }

  get<T>(requestPath: string, json: object) {
    let params = JSONUtil.beanToJsonStr(json)
    axios.get<AxiosResponse<BaseResponse<T>>, AxiosResponse<BaseResponse<T>>, null>(requestPath,
      {
        baseURL: ApiInterface.baseUrl,
        params: params
      }).then((response: AxiosResponse<BaseResponse<T>>) => {
      if (response.data.data != undefined && response.data.errorCode == 0) {
        LogUtil.error("解析 " + requestPath + " 成功！！！")
      } else {
        LogUtil.error("解析 " + requestPath + " 失败！！！")
      }
    })
      .catch((e: AxiosError) => {
        LogUtil.error("解析 " + requestPath + " 失败！！！原因竟是：" + e.message)
        // if (this.handleError != undefined) {
        //   this.handleError(e.message)
        // }
      })
  }

  post<T, C>(requestPath: string, json: object) {
    let params = JSONUtil.beanToJsonStr(json)
    // axios.post<AxiosResponse<BaseResponse<T>>, AxiosResponse<BaseResponse<T>>, null>(requestPath,
    //   {
    //     baseURL: ApiInterface.baseUrl,
    //     params: params
    //   })
  }
}