import { ArrayList } from '@kit.ArkTS'
import { ArticleBean } from './ArticleBean'

export class NavigationBean{
  private _articles: ArticleBean[] = []

  public set articles(value: ArticleBean[]) {
    this._articles = value
  }

  public get articles(): ArticleBean[] {
    return this._articles
  }

  private _cid: number = 0

  public set cid(value: number) {
    this._cid = value
  }

  public get cid(): number {
    return this._cid
  }

  private _name: string = ""

  public set name(value: string) {
    this._name = value
  }

  public get name(): string {
    return this._name
  }


}