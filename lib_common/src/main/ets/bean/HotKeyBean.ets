export class  HotKeyBean {
  private _id: number = 0

  public set id(value: number) {
    this._id = value
  }

  public get id(): number {
    return this._id
  }

  private _link: string = ""

  public set link(value: string) {
    this._link = value
  }

  public get link(): string {
    return this._link
  }

  private _name: string = ""

  public set name(value: string) {
    this._name = value
  }

  public get name(): string {
    return this._name
  }

  private _order: number = 0

  public set order(value: number) {
    this._order = value
  }

  public get order(): number {
    return this._order
  }

  private _visible: number = 0

  public set visible(value: number) {
    this._visible = value
  }

  public get visible(): number {
    return this._visible
  }


}