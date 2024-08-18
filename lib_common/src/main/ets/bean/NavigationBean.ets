import { ArrayList } from '@kit.ArkTS'
import { ArticleBean } from './ArticleBean'

export interface NavigationBean{
  articles: ArrayList<ArticleBean>,
  cid: number,
  name: String
}