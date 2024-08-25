export default class ResponseResult {
  /**
   * 服务器状态码 这里0表示请求成功
   */
  errorCode: number = 0;

  /**
   * 错误信息
   */
  errorMsg: string | Resource;

  /**
   * Data returned by the network request.
   */
  data: string;

  constructor() {
    this.errorCode = -1;
    this.errorMsg = '';
    this.data = '';
  }

  isSuccessed() : boolean{
    return this.errorCode == 0
  }
}