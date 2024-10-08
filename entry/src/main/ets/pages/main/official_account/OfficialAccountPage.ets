import { TitleBar } from '../../../widget/TitleBar'
import { router } from '@kit.ArkUI'
import { ParentColumn } from '../../../widget/ParentColumn'
import HomeViewModel from '../../../viewmodel/HomeViewModel'
import BaseResponseList from '@ohos/lib_common/src/main/ets/bean/BaseResponseList'
import { ArticleBean } from '@ohos/lib_common/src/main/ets/bean/ArticleBean'
import TabBean from '@ohos/lib_common/src/main/ets/bean/TabBean'
import { Constants } from '../../../common/Constants'
import { ArticleItem } from '../../../widget/ArticleItem'
import { ArrayList } from '@kit.ArkTS'
import AppUtils from '@ohos/lib_common/src/main/ets/utils/AppUtils'

/**
 * 公众号页
 */
@Component
export struct OfficialAccountPage {
  @State currentIndex: number = 0;
  @State tabs: TabBean[] = []
  @State articles: ArticleBean[] = []
  private controller: TabsController = new TabsController()

  aboutToAppear(): void {
    HomeViewModel.getWxarticleChapters().then((tabs: TabBean[]) => {
      if (tabs.length > 0) {
        this.tabs = tabs
        this.getWxarticleList(tabs[0].id, 1)
      }
    })
  }

  getWxarticleList(id: number, page: number) {
    HomeViewModel.getWxarticleList(id, page).then((data: BaseResponseList<ArrayList<ArticleBean>>) => {
      let list = AppUtils.processingArticleData(data.datas)
      this.articles = list
    })
  }

  build() {
    ParentColumn() {
      TitleBar({
        title: $r('app.string.official_account'),
        rightImg: $r('app.media.ic_search'),
        iconSpace: true,
        onRightImgClick: () => {
          router.pushUrl({ url: "pages/SearchPage" })
        }
      })
      Tabs({ barPosition: BarPosition.Start, index: this.currentIndex, controller: this.controller }) {
        ForEach(this.tabs, (tab: TabBean) => {
          TabContent() {
            this.OfficialAccountTabPage()
          }.tabBar(SubTabBarStyle.of(tab.name))
        })
      }
      .vertical(false)
      .barMode(BarMode.Scrollable, { nonScrollableLayoutStyle: LayoutStyle.SPACE_BETWEEN_OR_CENTER })
      .scrollable(true)
      .barHeight(Constants.TAB_HEIGHT)
      .animationDuration(400)
      .onChange((index: number) => {
        this.currentIndex = index
        this.getWxarticleList(this.tabs[index].id, 1)
      })
      .width(Constants.FULL_WIDTH)
    }
  }

  @Builder
  OfficialAccountTabPage() {
    Column() {
      List() {
        ForEach(this.articles, (item: ArticleBean) => {
          ListItem() {
            ArticleItem({ item: item })
          }
        })
      }
    }.width(Constants.FULL_WIDTH).height(Constants.FULL_HEIGHT)
  }
}
