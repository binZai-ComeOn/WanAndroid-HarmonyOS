export default class  ScoreBean{
  private _coinCount: number

  public set coinCount(value: number) {
    this._coinCount = value
  }

  public get coinCount(): number {
    return this._coinCount
  }

  private _date: number

  public set date(value: number) {
    this._date = value
  }

  public get date(): number {
    return this._date
  }

  private _desc: String

  public set desc(value: String) {
    this._desc = value
  }

  public get desc(): String {
    return this._desc
  }

  private _id: number

  public set id(value: number) {
    this._id = value
  }

  public get id(): number {
    return this._id
  }

  private _reason: String

  public set reason(value: String) {
    this._reason = value
  }

  public get reason(): String {
    return this._reason
  }

  private _type: number

  public set type(value: number) {
    this._type = value
  }

  public get type(): number {
    return this._type
  }

  private _userId: number

  public set userId(value: number) {
    this._userId = value
  }

  public get userId(): number {
    return this._userId
  }

  private _userName: String

  public set userName(value: String) {
    this._userName = value
  }

  public get userName(): String {
    return this._userName
  }

  constructor(coinCount: number, date: number, desc: String, id: number, reason: String, type: number, userId: number,
    userName: String) {
    this._coinCount = coinCount
    this._date = date
    this._desc = desc
    this._id = id
    this._reason = reason
    this._type = type
    this._userId = userId
    this._userName = userName
  }


}