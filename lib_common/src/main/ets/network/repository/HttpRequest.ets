import http from '@ohos.net.http';
import BaseResponse from '../../bean/BaseResponse';
import { HttpContentType } from '../constant/HttpContentType';
import { ApiInterface } from '../ApiInterface';
import { HttpConstants } from '../constant/HttpConstants';
import { AppCache } from '../../utils/AppCache';

/**
 * Initiate an HTTP GET request to the specified URL.
 *
 * @param url URL for initiating an HTTP request.
 */
export function httpRequestGet<T>(url: string) {
  return httpRequest<T>(url, http.RequestMethod.GET);
}

/**
 * Initiate an HTTP POST request to the specified URL.
 *
 * @param url URL for initiating an HTTP request
 * @param newsData Additional data of the request
 * @returns
 */
export function httpRequestPost<T>(url: string, params?: string | Object | ArrayBuffer) {
  return httpRequest<T>(url, http.RequestMethod.POST, params);
}

/**
 * Initiates an HTTP request to a given URL.
 *
 * @param url URL for initiating an HTTP request
 * @param method Request method.
 * @param extraData Additional data of the request.
 * @returns Returns {@link ResponseResult}.
 */
function httpRequest<T>(url: string, method: http.RequestMethod, params?: string | Object | ArrayBuffer): Promise<BaseResponse<T>> {
  let httpRequest = http.createHttp();
  let header: Map<string,string> = new Map()
  header.set('Content-Type', HttpContentType.JSON)
  if (url.startsWith(ApiInterface.userinfo) || url.startsWith(ApiInterface.collectListLink)
  || url.startsWith(ApiInterface.coinListLink) || url.startsWith(ApiInterface.privateArticlesLink)
  || url.search(ApiInterface.addArticleLink)) {
    console.log("测试"+AppCache.get().getCookies());
    header.set("Cookie", " Secure;token_pass=08937b953a34ae42f65e461149b23129; HttpOnly;loginUserName_wanandroid_com=12345678;token_pass_wanandroid_com=08937b953a34ae42f65e461149b23129; Domain=wanandroid.com;JSESSIONID=B0A21694BE06AF9CD27F486D169F0658;loginUserName=12345678; Expires=Tue, 19-Nov-2024 04:01:24 GMT; Path=/")
    // header.set("Cookie", AppCache.get().getCookies())
  }
  let responseResult = httpRequest.request(ApiInterface.baseUrl + url, {
    method: method,
    readTimeout: HttpConstants.HTTP_READ_TIMEOUT,
    header: header,
    connectTimeout: HttpConstants.HTTP_READ_TIMEOUT,
    extraData: params,
  });
  httpRequest.on('headersReceive', (header) => {
    if (url.startsWith(ApiInterface.loginLink)) {
      let map = header as Map<string, Object>
      console.log("哈哈哈："+map['set-cookie'])
      // AppCache.get().setCookies(map['set-cookie'])
      AppCache.get().setCookies("JSESSIONID=C6B602140FD5686517747110D694D4E7; Path=/; Secure; HttpOnly,loginUserName=12345678; Expires=Tue, 19-Nov-2024 05:08:37 GMT; Path=/,token_pass=08937b953a34ae42f65e461149b23129; Expires=Tue, 19-Nov-2024 05:08:37 GMT; Path=/,loginUserName_wanandroid_com=12345678; Domain=wanandroid.com; Expires=Tue, 19-Nov-2024 05:08:37 GMT; Path=/,token_pass_wanandroid_com=08937b953a34ae42f65e461149b23129; Domain=wanandroid.com; Expires=Tue, 19-Nov-2024 05:08:37 GMT; Path=/")
    }
  });
  let serverData = new BaseResponse<T>();
  // Processes the data and returns.
  return responseResult.then((value: http.HttpResponse) => {
    if (value.responseCode === HttpConstants.HTTP_CODE_200) {
      // Obtains the returned data.
      let result = `${value.result}`;
      let resultJson: BaseResponse<T> = JSON.parse(result);
      serverData = resultJson;
    } else {
      serverData.errorMsg = $r('app.string.request_exception');
    }
    return serverData;
  }).catch((err: Error) => {
    serverData.errorMsg = err.message;
    return serverData;
  });
}