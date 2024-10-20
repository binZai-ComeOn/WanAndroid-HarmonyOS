export class BannerBean {
  private _desc: string;

  public set desc(value: string) {
    this._desc = value;
  }

  public get desc(): string {
    return this._desc;
  }

  private _id: number;

  public set id(value: number) {
    this._id = value;
  }

  public get id(): number {
    return this._id;
  }

  private _imagePath: string;

  public set imagePath(value: string) {
    this._imagePath = value;
  }

  public get imagePath(): string {
    return this._imagePath;
  }

  private _isVisible: number;

  public set isVisible(value: number) {
    this._isVisible = value;
  }

  public get isVisible(): number {
    return this._isVisible;
  }

  private _order: number;

  public set order(value: number) {
    this._order = value;
  }

  public get order(): number {
    return this._order;
  }

  private _title: string;

  public set title(value: string) {
    this._title = value;
  }

  public get title(): string {
    return this._title;
  }

  private _type: number;

  public set type(value: number) {
    this._type = value;
  }

  public get type(): number {
    return this._type;
  }

  private _url: string;

  public set url(value: string) {
    this._url = value;
  }

  public get url(): string {
    return this._url;
  }

  constructor(desc: string, id: number, imagePath: string, isVisible: number, order: number, title: string,
    type: number, url: string) {
    this._desc = desc;
    this._id = id;
    this._imagePath = imagePath;
    this._isVisible = isVisible;
    this._order = order;
    this._title = title;
    this._type = type;
    this._url = url;
  }
}