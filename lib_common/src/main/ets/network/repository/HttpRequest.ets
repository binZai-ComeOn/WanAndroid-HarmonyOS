import http from '@ohos.net.http';
import BaseResponse from '../../bean/BaseResponse';
import { HttpContentType } from '../constant/HttpContentType';
import { ApiInterface } from '../ApiInterface';
import { HttpConstants } from '../constant/HttpConstants';

/**
 * Initiate an HTTP GET request to the specified URL.
 *
 * @param url URL for initiating an HTTP request.
 */
export function httpRequestGet(url: string) {
  return httpRequest(url, http.RequestMethod.GET);
}

/**
 * Initiate an HTTP POST request to the specified URL.
 *
 * @param url URL for initiating an HTTP request
 * @param newsData Additional data of the request
 * @returns
 */
export function httpRequestPost(url: string, params: Object) {
  return httpRequest(url, http.RequestMethod.POST, params);
}

/**
 * Initiates an HTTP request to a given URL.
 *
 * @param url URL for initiating an HTTP request
 * @param method Request method.
 * @param extraData Additional data of the request.
 * @returns Returns {@link ResponseResult}.
 */
function httpRequest(url: string, method: http.RequestMethod, params?: Object): Promise<BaseResponse> {
  let httpRequest = http.createHttp();
  let responseResult = httpRequest.request(ApiInterface.baseUrl + url, {
    method: method,
    readTimeout: HttpConstants.HTTP_READ_TIMEOUT,
    header: {
      'Content-Type': HttpContentType.JSON
    },
    connectTimeout: HttpConstants.HTTP_READ_TIMEOUT,
    extraData: params
  });
  let serverData = new BaseResponse();
  // Processes the data and returns.
  return responseResult.then((value: http.HttpResponse) => {
    if (value.responseCode === HttpConstants.HTTP_CODE_200) {
      // Obtains the returned data.
      let result = `${value.result}`;
      let resultJson: BaseResponse = JSON.parse(result);
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