import { TitleBar } from '../../../widget/TitleBar'
import { ParentColumn } from '../../../widget/ParentColumn'
import { router } from '@kit.ArkUI'
import { Constants } from '../../../common/Constants'
import HomeViewModel from '../../../viewmodel/HomeViewModel'
import BaseResponseList from '@ohos/lib_common/src/main/ets/bean/BaseResponseList'
import { ArrayList } from '@kit.ArkTS'
import { ArticleBean } from '@ohos/lib_common/src/main/ets/bean/ArticleBean'
import { ArticleItem } from '../../../widget/ArticleItem'
import AppUtils from '@ohos/lib_common/src/main/ets/utils/AppUtils'

/**
 * 广场页
 */
@Preview
@Component
export struct SquarePage {
  /**
   * Parameters for pagination
   */
  @State page: number = 0
  @State articles: ArticleBean[] = [];

  aboutToAppear(): void {
    HomeViewModel.getSquareList(this.page).then(((data: BaseResponseList<ArrayList<ArticleBean>>) => {
      this.articles = AppUtils.processingArticleData(data.datas)
    }))
  }

  build() {
    ParentColumn() {
      TitleBar({
        title: $r('app.string.square'),
        rightImg: $r('app.media.ic_add'),
        iconSpace: true,
        onRightImgClick: () => {
          router.pushUrl({ url: "pages/ShareArticlePage" })
        }
      })

      List({ space: 0, initialIndex: 0 }) {
        ForEach(this.articles, (item: ArticleBean, index?: number) => {
          ListItem() {
            ArticleItem({ item: item })
          }
        }, (item: string) => item)
      }
      .scrollBar(BarState.Auto)
    }
  }
}