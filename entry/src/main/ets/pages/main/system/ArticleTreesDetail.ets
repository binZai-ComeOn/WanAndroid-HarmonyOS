import KnowledgeSystemBean from '@ohos/lib_common/src/main/ets/bean/KnowledgeSystemBean'
import { RouterParams } from '../../../bean/RouterParams'
import { Constants } from '../../../common/Constants'
import { router } from '@kit.ArkUI'
import { TitleBar } from '../../../widget/TitleBar'
import { TopTabBar } from '../../../widget/TopTabBar'
import { ArticleBean } from '@ohos/lib_common/src/main/ets/bean/ArticleBean'
import HomeViewModel from '../../../viewmodel/HomeViewModel'
import { ArticleItem } from '../../../widget/ArticleItem'
import BaseResponseList from '@ohos/lib_common/src/main/ets/bean/BaseResponseList'
import AppUtils from '@ohos/lib_common/src/main/ets/utils/AppUtils'
import { ArrayList } from '@kit.ArkTS'

/**
 * 体系详情页
 */
@Entry
@Component
export struct ArticleTreesDetail {
  @State params: KnowledgeSystemBean = new KnowledgeSystemBean()
  @State tabs: string[] = []
  @State page : number = 0
  @State articles: ArticleBean[] = []

  aboutToAppear(): void {
    this.params = this.getParams()
    this.params.children.forEach((item: KnowledgeSystemBean) => {
      this.tabs.push(item.name)
    })
    this.getInfoList(this.params.children[0].id)
  }

  getInfoList(id: number) {
    HomeViewModel.getKnowledgeList(this.page, id).then((data: BaseResponseList<ArrayList<ArticleBean>>) => {
      let list: ArticleBean[] = []
      list = AppUtils.processingArticleData(data.datas)
      this.articles = list
    })
  }

  build() {
    Column() {
      TitleBar({
        leftImg: $r('app.media.ic_back'),
        onLeftImgClick: (event: ClickEvent) => {
          router.back()
        },
        title: this.params.name
      })
      TopTabBar({
        tabs: this.tabs,
        onChanged: (index: number) => {
          this.getInfoList(this.params.children[index].id)
        },
        content: (tabName: string) => {
          this.TopTabBarContent(tabName)
        }
      })
    }.padding({ left: Constants.PAGE_MARGIN_LEFT, right: Constants.PAGE_MARGIN_RIGHT })
  }

  @Builder
  TopTabBarContent(tabName: string) {
    ForEach(this.articles, (item: ArticleBean) => {
      ListItem() {
        ArticleItem({
          item: item, clickEnvent: () => {
            router.pushUrl({ url: "pages/ArticleDetailsPage", params: new RouterParams(item) })
          }
        })
      }
    })
  }

  getParams(): KnowledgeSystemBean {
    const title = router.getParams() as RouterParams<KnowledgeSystemBean>
    return title.data
  }
}