export default class  TabBean{
  private _author: string = "";

  public set author(value: string) {
    this._author = value;
  }

  public get author(): string {
    return this._author;
  }

  private _courseId: number = 0;

  public set courseId(value: number) {
    this._courseId = value;
  }

  public get courseId(): number {
    return this._courseId;
  }

  private _cover: string = "";

  public set cover(value: string) {
    this._cover = value;
  }

  public get cover(): string {
    return this._cover;
  }

  private _desc: string = "";

  public set desc(value: string) {
    this._desc = value;
  }

  public get desc(): string {
    return this._desc;
  }

  private _id: number = 0;

  public set id(value: number) {
    this._id = value;
  }

  public get id(): number {
    return this._id;
  }

  private _lisense: string = "";

  public set lisense(value: string) {
    this._lisense = value;
  }

  public get lisense(): string {
    return this._lisense;
  }

  private _lisenseLink: string = "";

  public set lisenseLink(value: string) {
    this._lisenseLink = value;
  }

  public get lisenseLink(): string {
    return this._lisenseLink;
  }

  private _name: string = "";

  public set name(value: string) {
    this._name = value;
  }

  public get name(): string {
    return this._name;
  }

  private _order: number = 0;

  public set order(value: number) {
    this._order = value;
  }

  public get order(): number {
    return this._order;
  }

  private _parentChapterId: number = 0;

  public set parentChapterId(value: number) {
    this._parentChapterId = value;
  }

  public get parentChapterId(): number {
    return this._parentChapterId;
  }

  private _type: number = 0;

  public set type(value: number) {
    this._type = value;
  }

  public get type(): number {
    return this._type;
  }

  private _userControlSetTop: Boolean = false;

  public set userControlSetTop(value: Boolean) {
    this._userControlSetTop = value;
  }

  public get userControlSetTop(): Boolean {
    return this._userControlSetTop;
  }

  private _visible: number = 0;

  public set visible(value: number) {
    this._visible = value;
  }

  public get visible(): number {
    return this._visible;
  }

  constructor(author: string, courseId: number, cover: string, desc: string, id: number, lisense: string,
    lisenseLink: string, name: string, order: number, parentChapterId: number, type: number, userControlSetTop: Boolean,
    visible: number) {
    this._author = author;
    this._courseId = courseId;
    this._cover = cover;
    this._desc = desc;
    this._id = id;
    this._lisense = lisense;
    this._lisenseLink = lisenseLink;
    this._name = name;
    this._order = order;
    this._parentChapterId = parentChapterId;
    this._type = type;
    this._userControlSetTop = userControlSetTop;
    this._visible = visible;
  }
}