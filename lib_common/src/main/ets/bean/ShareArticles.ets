import { ArticleBean } from './ArticleBean'

export interface ShareArticles {
  curPage: number,
  datas: ArrayLike<ArticleBean>,
  offset: number,
  over: Boolean,
  pageCount: number,
  size: number,
  total: number
}