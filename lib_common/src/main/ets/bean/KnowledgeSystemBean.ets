import { ArrayList } from '@kit.ArkTS'

export default  class KnowledgeSystemBean {
  private _children: KnowledgeSystemBean[] = []

  public set children(value: KnowledgeSystemBean[]) {
    this._children = value
  }

  public get children(): KnowledgeSystemBean[] {
    return this._children
  }

  private _courseId: number = 0

  public set courseId(value: number) {
    this._courseId = value
  }

  public get courseId(): number {
    return this._courseId
  }

  private _id: number = 0

  public set id(value: number) {
    this._id = value
  }

  public get id(): number {
    return this._id
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

  private _parentChapterId: number = 0

  public set parentChapterId(value: number) {
    this._parentChapterId = value
  }

  public get parentChapterId(): number {
    return this._parentChapterId
  }

  private _userControlSetTop: Boolean = false

  public set userControlSetTop(value: Boolean) {
    this._userControlSetTop = value
  }

  public get userControlSetTop(): Boolean {
    return this._userControlSetTop
  }

  private _visible: number = 0

  public set visible(value: number) {
    this._visible = value
  }

  public get visible(): number {
    return this._visible
  }

  private _icon: string = ""

  public set icon(value: string) {
    this._icon = value
  }

  public get icon(): string {
    return this._icon
  }

  private _link: string = ""

  public set link(value: string) {
    this._link = value
  }

  public get link(): string {
    return this._link
  }
}