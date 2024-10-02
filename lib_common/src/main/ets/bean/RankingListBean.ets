export default class RankingListBean {
  private _coinCount: number

  public set coinCount(value: number) {
    this._coinCount = value
  }

  public get coinCount(): number {
    return this._coinCount
  }

  private _level: number

  public set level(value: number) {
    this._level = value
  }

  public get level(): number {
    return this._level
  }

  private _nickname: String

  public set nickname(value: String) {
    this._nickname = value
  }

  public get nickname(): String {
    return this._nickname
  }

  private _rank: String

  public set rank(value: String) {
    this._rank = value
  }

  public get rank(): String {
    return this._rank
  }

  private _userId: number

  public set userId(value: number) {
    this._userId = value
  }

  public get userId(): number {
    return this._userId
  }

  private _username: String

  public set username(value: String) {
    this._username = value
  }

  public get username(): String {
    return this._username
  }

  constructor(coinCount: number, level: number, nickname: String, rank: String, userId: number, username: String) {
    this._coinCount = coinCount
    this._level = level
    this._nickname = nickname
    this._rank = rank
    this._userId = userId
    this._username = username
  }


}