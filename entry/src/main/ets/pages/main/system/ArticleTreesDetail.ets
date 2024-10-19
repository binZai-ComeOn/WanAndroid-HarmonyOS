import KnowledgeSystemBean from '@ohos/lib_common/src/main/ets/bean/KnowledgeSystemBean'
import { RouterParams } from '../../../bean/RouterParams'
import { Constants } from '../../../common/Constants'
import { router } from '@kit.ArkUI'
import { TitleBar } from '../../../widget/TitleBar'
import { TopTabBar } from '../../../widget/TopTabBar'
import { ArticleBean } from '@ohos/lib_common/src/main/ets/bean/ArticleBean'
import HomeViewModel from '../../../viewmodel/HomeViewModel'

/**
 * 体系详情页
 */
@Entry
@Component
export struct ArticleTreesDetail {
  @State data: KnowledgeSystemBean = new KnowledgeSystemBean()
  @State tabs: string[] = []

  aboutToAppear(): void {
    this.data = this.getParams()
    this.data.children.forEach((item: KnowledgeSystemBean) => {
      this.tabs.push(item.name)
    })
  }

  build() {
    Column() {
      TitleBar({
        leftImg: $r('app.media.ic_back'),
        onLeftImgClick: (event: ClickEvent) => {
          router.back()
        },
        title: this.data.name
      })
      TopTabBar({
        tabs: this.tabs,
        content: (tabName: string) => {
          this.TopTabBarContent(tabName)
        }
      })
      List() {
        ForEach(this.data.children, (item: ArticleBean, index?: number) => {
          ListItem() {
            // ArticleItem({
            //   item: item, clickEnvent: () => {
            //     router.pushUrl({ url: "pages/ArticleDetailsPage", params: new RouterParams(item) })
            //   }
            // })
          }
        }, (item: string) => item)
      }.scrollBar(BarState.Auto)
    }.padding({ left: Constants.PAGE_MARGIN_LEFT, right: Constants.PAGE_MARGIN_RIGHT })
  }

  @Builder
  TopTabBarContent(tabName: string) {
    ForEach(this.tabs, (index: number) => {

    })
  }

  getParams(): KnowledgeSystemBean {
    const title = router.getParams() as RouterParams<KnowledgeSystemBean>
    return title.data
  }
}