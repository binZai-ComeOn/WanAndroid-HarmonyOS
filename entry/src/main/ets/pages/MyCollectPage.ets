import { TitleBar } from "../widget/TitleBar"
import router from "@ohos.router"
import { Constants } from "../common/Constants"
import MyCollectViewModel from "../viewmodel/MyCollectViewModel"
import BaseResponseList from "@ohos/lib_common/src/main/ets/bean/BaseResponseList"
import { ArrayList } from "@kit.ArkTS"
import { ArticleBean } from "@ohos/lib_common/src/main/ets/bean/ArticleBean"
import AppUtils from "@ohos/lib_common/src/main/ets/utils/AppUtils"
import { ArticleItem } from "../widget/ArticleItem"
import { RouterParams } from "../bean/RouterParams"

/**
 * 我的收藏界面
 */
@Entry
@Component
export struct MyCollectPage {
  /**
   * Parameters for pagination
   */
  @State page: number = 0
  @State articles: ArticleBean[] = [];

  aboutToAppear(): void {
    MyCollectViewModel.getCollectedArticles(this.page).then((data: BaseResponseList<ArrayList<ArticleBean>>) => {
      let list: ArticleBean[] = []
      let handledata = AppUtils.processingArticleData(data.datas)
      handledata.forEach((item: ArticleBean) => {
        list.push(item)
      })
      this.articles = list
    })
  }

  build() {
    Column(){
      TitleBar({
        leftImg: $r('app.media.ic_back'),
        onLeftImgClick: (event: ClickEvent) => {
          router.back()
        },
        title: $r('app.string.collect')
      })

      List({ space: 0, initialIndex: 0 }) {
        ForEach(this.articles, (item: ArticleBean, index?: number) => {
          ListItem() {
            ArticleItem({ item: item, clickEnvent: (event: ClickEvent) => {
              router.pushUrl({ url: "pages/ArticleDetailsPage", params: new RouterParams(item) })
            } })
          }
        }, (item: string) => item)
      }
      .scrollBar(BarState.Auto)
    }.width(Constants.FULL_WIDTH).height(Constants.FULL_HEIGHT)
    .padding({ left: Constants.PAGE_MARGIN_LEFT, right: Constants.PAGE_MARGIN_RIGHT })
  }
}
