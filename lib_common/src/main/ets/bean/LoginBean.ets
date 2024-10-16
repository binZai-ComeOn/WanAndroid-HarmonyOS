export class LoginBean {
  private _admin: Boolean = false

  public set admin(value: Boolean) {
    this._admin = value
  }

  public get admin(): Boolean {
    return this._admin
  }

  private _chapterTops: Array<string> = []

  public set chapterTops(value: Array<string>) {
    this._chapterTops = value
  }

  public get chapterTops(): Array<string> {
    return this._chapterTops
  }

  private _coinCount: number = 0

  public set coinCount(value: number) {
    this._coinCount = value
  }

  public get coinCount(): number {
    return this._coinCount
  }

  private _collectIds: Array<number> = []

  public set collectIds(value: Array<number>) {
    this._collectIds = value
  }

  public get collectIds(): Array<number> {
    return this._collectIds
  }

  private _email: string = ""

  public set email(value: string) {
    this._email = value
  }

  public get email(): string {
    return this._email
  }

  private _icon: string = ""

  public set icon(value: string) {
    this._icon = value
  }

  public get icon(): string {
    return this._icon
  }

  private _id: number = 0

  public set id(value: number) {
    this._id = value
  }

  public get id(): number {
    return this._id
  }

  private _nickname: string = ""

  public set nickname(value: string) {
    this._nickname = value
  }

  public get nickname(): string {
    return this._nickname
  }

  private _password: string = ""

  public set password(value: string) {
    this._password = value
  }

  public get password(): string {
    return this._password
  }

  private _publicName: string = ""

  public set publicName(value: string) {
    this._publicName = value
  }

  public get publicName(): string {
    return this._publicName
  }

  private _token: string = ""

  public set token(value: string) {
    this._token = value
  }

  public get token(): string {
    return this._token
  }

  private _type: number = 0

  public set type(value: number) {
    this._type = value
  }

  public get type(): number {
    return this._type
  }

  private _username: string = ""

  public set username(value: string) {
    this._username = value
  }

  public get username(): string {
    return this._username
  }

}