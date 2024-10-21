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
  tabs: string[] = [];
  @State articleTree: KnowledgeSystemBean[] = []
  @State currentIndex: number = 0;

  aboutToAppear(): void {
    HomeViewModel.getArticleTree().then((data: KnowledgeSystemBean[]) => {
      this.articleTree = data
    })
    let manager = getContext().resourceManager
    let tabList = Constants.SYSTEM_PAGE_TABBARS
    for (let i = 0; i < tabList.length; i++) {
      this.tabs.push(manager.getStringSync(tabList[i].id))
    }
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
        onChanged: (index: number) => {
          this.currentIndex = index
        },
        content: () => {
          this.TopTabBarContent()
        }
      })
    }
  }

  @Builder
  TopTabBarContent() {
    if (this.currentIndex == 0) {
      ArticleTrees({ data: this.articleTree })
    } else if (this.currentIndex == 1) {
      NavigationPage()
    }
  }
}