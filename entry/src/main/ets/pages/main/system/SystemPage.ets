import { TitleBar } from '../../../widget/TitleBar'
import { router } from '@kit.ArkUI'
import { TopTabBar } from '../../../widget/TopTabBar'
import { Constants } from '../../../common/Constants'
import { NavigationPage } from './NavigationPage'
import { ParentColumn } from '../../../widget/ParentColumn'
import HomeViewModel from '../../../viewmodel/HomeViewModel'
import { ArrayList } from '@kit.ArkTS'
import KnowledgeSystemBean from '@ohos/lib_common/src/main/ets/bean/KnowledgeSystemBean'
import { LogUtil } from '@pura/harmony-utils'
import { ArticleTrees } from './ArticleTrees'

/**
 * 体系页
 */
@Preview
@Component
export struct SystemPage {
  tabs: Resource[] = Constants.SYSTEM_PAGE_TABBARS;
  @State articleTree: KnowledgeSystemBean[] = []

  aboutToAppear(): void {
    HomeViewModel.getArticleTree().then((data: KnowledgeSystemBean[]) => {
      this.articleTree = data
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
        content: (tabName: Resource) => {
          this.TopTabBarContent(tabName)
        }
      })
    }
  }

  @Builder
  TopTabBarContent(tabName: Resource) {
    if (this.tabs[0] == tabName) {
      ArticleTrees({ data: this.articleTree })
    } else if (this.tabs[1] == tabName) {
      NavigationPage()
    }
  }
}