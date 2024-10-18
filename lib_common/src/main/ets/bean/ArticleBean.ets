import { ArrayList } from '@kit.ArkTS'
import { Tag } from './Tag'

export class  ArticleBean{
  private _adminAdd: Boolean = false

  public set adminAdd(value: Boolean) {
    this._adminAdd = value
  }

  public get adminAdd(): Boolean {
    return this._adminAdd
  }

  private _apkLink: string = ""

  public set apkLink(value: string) {
    this._apkLink = value
  }

  public get apkLink(): string {
    return this._apkLink
  }

  private _audit: number = 0

  public set audit(value: number) {
    this._audit = value
  }

  public get audit(): number {
    return this._audit
  }

  private _author: string = ""

  public set author(value: string) {
    this._author = value
  }

  public get author(): string {
    return this._author
  }

  private _canEdit: Boolean = false

  public set canEdit(value: Boolean) {
    this._canEdit = value
  }

  public get canEdit(): Boolean {
    return this._canEdit
  }

  private _chapterId: number = 0

  public set chapterId(value: number) {
    this._chapterId = value
  }

  public get chapterId(): number {
    return this._chapterId
  }

  private _chapterName: string = ""

  public set chapterName(value: string) {
    this._chapterName = value
  }

  public get chapterName(): string {
    return this._chapterName
  }

  private _collect: Boolean = false

  public set collect(value: Boolean) {
    this._collect = value
  }

  public get collect(): Boolean {
    return this._collect
  }

  private _courseId: number = 0

  public set courseId(value: number) {
    this._courseId = value
  }

  public get courseId(): number {
    return this._courseId
  }

  private _desc: string = ""

  public set desc(value: string) {
    this._desc = value
  }

  public get desc(): string {
    return this._desc
  }

  private _descMd: String = ""

  public set descMd(value: String) {
    this._descMd = value
  }

  public get descMd(): String {
    return this._descMd
  }

  private _envelopePic: string = ""

  public set envelopePic(value: string) {
    this._envelopePic = value
  }

  public get envelopePic(): string {
    return this._envelopePic
  }

  private _fresh: Boolean = false

  public set fresh(value: Boolean) {
    this._fresh = value
  }

  public get fresh(): Boolean {
    return this._fresh
  }

  private _host: String = ""

  public set host(value: String) {
    this._host = value
  }

  public get host(): String {
    return this._host
  }

  private _id: number = 0

  public set id(value: number) {
    this._id = value
  }

  public get id(): number {
    return this._id
  }

  private _isAdminAdd: Boolean = false

  public set isAdminAdd(value: Boolean) {
    this._isAdminAdd = value
  }

  public get isAdminAdd(): Boolean {
    return this._isAdminAdd
  }

  private _link: string = ""

  public set link(value: string) {
    this._link = value
  }

  public get link(): string {
    return this._link
  }

  private _niceDate: String = ""

  public set niceDate(value: String) {
    this._niceDate = value
  }

  public get niceDate(): String {
    return this._niceDate
  }

  private _niceShareDate: String = ""

  public set niceShareDate(value: String) {
    this._niceShareDate = value
  }

  public get niceShareDate(): String {
    return this._niceShareDate
  }

  private _origin: String = ""

  public set origin(value: String) {
    this._origin = value
  }

  public get origin(): String {
    return this._origin
  }

  private _prefix: String = ""

  public set prefix(value: String) {
    this._prefix = value
  }

  public get prefix(): String {
    return this._prefix
  }

  private _projectLink: String = ""

  public set projectLink(value: String) {
    this._projectLink = value
  }

  public get projectLink(): String {
    return this._projectLink
  }

  private _publishTime: number = 0

  public set publishTime(value: number) {
    this._publishTime = value
  }

  public get publishTime(): number {
    return this._publishTime
  }

  private _releaseTime: string = ""

  public set releaseTime(value: string) {
    this._releaseTime = value
  }

  public get releaseTime1(): string {
    return this._releaseTime
  }

  private _realSuperChapterId: number = 0

  public set realSuperChapterId(value: number) {
    this._realSuperChapterId = value
  }

  public get realSuperChapterId(): number {
    return this._realSuperChapterId
  }

  private _selfVisible: number = 0

  public set selfVisible(value: number) {
    this._selfVisible = value
  }

  public get selfVisible(): number {
    return this._selfVisible
  }

  private _shareDate: number = 0

  public set shareDate(value: number) {
    this._shareDate = value
  }

  public get shareDate(): number {
    return this._shareDate
  }

  private _shareUser: string = ""

  public set shareUser(value: string) {
    this._shareUser = value
  }

  public get shareUser(): string {
    return this._shareUser
  }

  private _superChapterId: number = 0

  public set superChapterId(value: number) {
    this._superChapterId = value
  }

  public get superChapterId(): number {
    return this._superChapterId
  }

  private _superChapterName: string = ""

  public set superChapterName(value: string) {
    this._superChapterName = value
  }

  public get superChapterName(): string {
    return this._superChapterName
  }

  private _tags: ArrayList<Tag> = new ArrayList<Tag>()

  public set tags(value: ArrayList<Tag>) {
    this._tags = value
  }

  public get tags(): ArrayList<Tag> {
    return this._tags
  }

  private _tag: string = ""

  public set tag(value: string) {
    this._tag = value
  }

  public get tag(): string {
    return this._tag
  }

  private _title: string = ""

  public set title(value: string) {
    this._title = value
  }

  public get title(): string {
    return this._title
  }

  private _type: number = 0

  public set type(value: number) {
    this._type = value
  }

  public get type(): number {
    return this._type
  }

  private _userId: number = 0

  public set userId(value: number) {
    this._userId = value
  }

  public get userId(): number {
    return this._userId
  }

  private _visible: number = 0

  public set visible(value: number) {
    this._visible = value
  }

  public get visible(): number {
    return this._visible
  }

  private _zan: number = 0

  public set zan(value: number) {
    this._zan = value
  }

  public get zan(): number {
    return this._zan
  }

  private _top: String = ""

  public set top(value: String) {
    this._top = value
  }

  public get top(): String {
    return this._top
  }


}