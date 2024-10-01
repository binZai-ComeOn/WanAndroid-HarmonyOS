import { ArrayList } from '@kit.ArkTS'
import { ArticleBean } from '../bean/ArticleBean'
import { Tag } from '../bean/Tag'
import TimeUtil from './TimeUtil'

export default class AppUtils{

  /**
   * Processing article data
   * @param datas
   * @returns
   */
  static processingArticleData(datas: ArrayList<ArticleBean>) {
    let list: ArticleBean[] = []
    datas.forEach((item: ArticleBean) => {
      if (item.author == "") {
        item.author = item.shareUser
      }
      item.releaseTime = TimeUtil.millisecond2Time(item.publishTime)
      if (item.tags.length > 0) {
        item.tags.forEach((tag: Tag, index: number) => {
          item.tag = tag.name
          if (item.tags.length < index) {
            item.tag += " / "
          }
        })
      } else {
        if (item.superChapterName != null && item.superChapterName != "" && item.chapterName != null &&
          item.chapterName != "") {
          item.tag = item.superChapterName + " / " + item.chapterName
        } else if (item.superChapterName != null && item.superChapterName != "") {
          item.tag = item.superChapterName
        } else if (item.chapterName != null && item.chapterName != "") {
          item.tag = item.chapterName
        }
      }
      list.push(item)
    })
    return list
  }
}