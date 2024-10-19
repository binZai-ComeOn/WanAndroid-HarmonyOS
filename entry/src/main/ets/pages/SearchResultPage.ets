import { router } from '@kit.ArkUI'
import BaseResponseList from '@ohos/lib_common/src/main/ets/bean/BaseResponseList'
import { RouterParams } from '../bean/RouterParams'
import { Constants } from '../common/Constants'
import { TitleBar } from '../widget/TitleBar'
import { ArrayList } from '@kit.ArkTS'
import { ArticleBean } from '@ohos/lib_common/src/main/ets/bean/ArticleBean'
import SearchViewModel from '../viewmodel/SearchViewModel'
import AppUtils from '@ohos/lib_common/src/main/ets/utils/AppUtils'
import { ArticleItem } from '../widget/ArticleItem'

/**
 * 搜索结果页面
 */
@Entry
@Component
export struct SearchResultPage {
  title: string = ""
  @State page: number = 0;
  @State articles: ArticleBean[] = []

  aboutToAppear(): void {
    console.log("搜索到的结果111："+this.getParams())
    SearchViewModel.queryArticle(this.getParams(), this.page).then((data: BaseResponseList<ArrayList<ArticleBean>>) => {
      console.log("搜索到的结果："+data.datas.length)
      let list = AppUtils.processingArticleData(data.datas)
      this.articles = list
    })
  }

  build() {
    Column() {
      TitleBar({
        leftImg: $r('app.media.ic_back'),
        onLeftImgClick: () => {
          router.back()
        },
        title: this.getParams()
      })
      List(){
        ForEach(this.articles, (item: ArticleBean) => {
          ListItem() {
            ArticleItem({ item: item, clickEnvent: (event: ClickEvent) => {
              router.pushUrl({ url: "pages/ArticleDetailsPage", params: new RouterParams(item) })
            }})
          }
        })
      }
    }.width(Constants.FULL_WIDTH).height(Constants.FULL_HEIGHT)
    .padding({ left: Constants.PAGE_MARGIN_LEFT, right: Constants.PAGE_MARGIN_RIGHT })
  }

  getParams() : string{
    const title = router.getParams() as RouterParams<string>
    return title.data
  }
}