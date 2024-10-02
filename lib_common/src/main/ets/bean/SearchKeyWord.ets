
export default class SearchKeyWord {
  private _k: string = ""

  public set k(value: string) {
    this._k = value
  }

  public get k(): string {
    return this._k
  }

  constructor(k: string) {
    this._k = k
  }
}