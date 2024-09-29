import { TitleBar } from '../widget/TitleBar'
import { router } from '@kit.ArkUI'
import { TopTabBar } from '../widget/TopTabBar'
import { Constants } from '../common/Constants'
import { NavigationPage } from './NavigationPage'
import { ParentColumn } from '../widget/ParentColumn'
import HomeViewModel from '../viewmodel/HomeViewModel'
import { ArrayList } from '@kit.ArkTS'
import KnowledgeSystemBean from '@ohos/lib_common/src/main/ets/bean/KnowledgeSystemBean'
import { LogUtil } from '@pura/harmony-utils'
import { ArticleTrees } from '../widget/ArticleTrees'

/**
 * 体系页
 */
@Preview
@Component
export struct SystemPage {
  tabs: Resource[] = Constants.SYSTEM_PAGE_TABBARS;
  articleTree: KnowledgeSystemBean[] = []

  aboutToAppear(): void {
    HomeViewModel.getArticleTree().then((data: KnowledgeSystemBean[]) => {
      console.log("长度："+data.length)
      this.articleTree = data
      console.log("长度："+this.articleTree.length)
    })
  }

  build() {
    ParentColumn() {
      TitleBar({
        title: $r('app.string.system'),
        rightImg: $r('app.media.ic_search'),
        iconSpace: true,
        onRightImgClick: () => {
          router.pushUrl({ url: "pages/SearchPage" })
        }
      })
      TopTabBar({
        tabs: this.tabs,
        content: this.TopTabBarContent
      })
    }
  }

  @Builder
  TopTabBarContent(tabName: Resource) {
    if (this.tabs[0] == tabName) {
      Column() {
        List() {
          ForEach(this.articleTree, (item: KnowledgeSystemBean, index?: number) => {
            ListItem() {
              Text("测试")
              // ArticleTrees({ item: item })
            }
          }, (item: string) => item)
        }
        .scrollBar(BarState.Auto)
      }.height(Constants.FULL_HEIGHT)
    } else if (this.tabs[1] == tabName) {
      NavigationPage()
    }
  }

  @Builder
  SideTabBarContent(tabName: Resource) {
    Text("tabName")
  }
}