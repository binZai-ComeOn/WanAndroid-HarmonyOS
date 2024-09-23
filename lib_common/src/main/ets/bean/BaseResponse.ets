export default class ResponseResult<T> {
  /**
   * 服务器状态码 这里0表示请求成功
   */
  private _errorCode: number = 0;

  public set errorCode(value: number) {
    this._errorCode = value;
  }

  public get errorCode(): number {
    return this._errorCode;
  }

  /**
   * 错误信息
   */
  private _errorMsg: string | Resource;

  public set errorMsg(value: string | Resource) {
    this._errorMsg = value;
  }

  public get errorMsg(): string | Resource {
    return this._errorMsg;
  }

  /**
   * Data returned by the network request.
   */
  private _data: T | undefined;

  public set data(value: T | undefined) {
    this._data = value;
  }

  public get data(): T | undefined{
    return this._data;
  }

  constructor() {
    this._errorCode = -1;
    this._errorMsg = '';
  }



  isSuccessed() : boolean{
    return this._errorCode == 0
  }
}