export default class BaseResponseList<T> {
  private _curPage: number;

  public set curPage(value: number) {
    this._curPage = value;
  }

  public get curPage(): number {
    return this._curPage;
  }

  private _offset: number;

  public set offset(value: number) {
    this._offset = value;
  }

  public get offset(): number {
    return this._offset;
  }

  private _over: Boolean;

  public set over(value: Boolean) {
    this._over = value;
  }

  public get over(): Boolean {
    return this._over;
  }

  private _pageCount: number;

  public set pageCount(value: number) {
    this._pageCount = value;
  }

  public get pageCount(): number {
    return this._pageCount;
  }

  private _size: number;

  public set size(value: number) {
    this._size = value;
  }

  public get size(): number {
    return this._size;
  }

  private _total: number;

  public set total(value: number) {
    this._total = value;
  }

  public get total(): number {
    return this._total;
  }

  private _datas: T;

  public set datas(value: T) {
    this._datas = value;
  }

  public get datas(): T  {
    return this._datas;
  }

  constructor(curPage: number, offset: number, over: Boolean, pageCount: number, size: number, total: number, datas: T ) {
    this._curPage = curPage;
    this._offset = offset;
    this._over = over;
    this._pageCount = pageCount;
    this._size = size;
    this._total = total;
    this._datas = datas;
  }


}