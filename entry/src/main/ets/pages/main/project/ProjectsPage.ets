import { TitleBar } from '../../../widget/TitleBar'
import { router } from '@kit.ArkUI'
import { ParentColumn } from '../../../widget/ParentColumn'
import { Constants } from '../../../common/Constants'
import HomeViewModel from '../../../viewmodel/HomeViewModel'
import BaseResponseList from '@ohos/lib_common/src/main/ets/bean/BaseResponseList'
import { ArticleBean } from '@ohos/lib_common/src/main/ets/bean/ArticleBean'
import TabBean from '@ohos/lib_common/src/main/ets/bean/TabBean'
import { ArrayList } from '@kit.ArkTS'
import AppUtils from '@ohos/lib_common/src/main/ets/utils/AppUtils'

/**
 * 项目页
 */
@Preview
@Component
export struct ProjectsPage {
  @State currentIndex: number = 0;
  @State tabs: TabBean[] = [];
  @State projects: ArticleBean[] = [];

  aboutToAppear(): void {
    HomeViewModel.getProjectTree().then((tabs: TabBean[]) => {
      this.tabs = tabs
      if (tabs.length > 0) {
        this.getProjectList(1, tabs[0].id)
      }
    })
  }

  getProjectList(page: number, cid: number) {
    HomeViewModel.getProjectList(page, cid).then((data: BaseResponseList<ArrayList<ArticleBean>>) => {
      let list = AppUtils.processingArticleData(data.datas)
      this.projects = list
    })
  }

  build() {
    ParentColumn() {
      TitleBar({
        title: $r('app.string.projects'),
        rightImg: $r('app.media.ic_search'),
        iconSpace: true,
        onRightImgClick: () => {
          router.pushUrl({ url: "pages/SearchPage" })
        }
      })
      Tabs({ barPosition: BarPosition.Start }) {
        ForEach(this.tabs, (tab: TabBean, index: number) => {
          TabContent() {
            this.ProjectsPage()
          }.tabBar(SubTabBarStyle.of(tab.name))
        })
      }.barMode(BarMode.Scrollable)
      .barHeight(Constants.TAB_HEIGHT)
      .animationDuration(400)
      .onChange((index: number) => {
        this.currentIndex = index
        this.getProjectList(1, this.tabs[index].id)
      })
    }
  }

  @Builder
  ProjectsPage() {
    Column() {
      List() {
        ForEach(this.projects, (item: ArticleBean) => {
          ListItem() {
            this.ProjectItem(item)
          }
        })
      }
    }.height(Constants.FULL_HEIGHT).width(Constants.FULL_WIDTH)
  }

  @Builder
  ProjectItem(bean: ArticleBean) {
    RelativeContainer() {
      Image(bean.envelopePic)
        .width(110)
        .height(180)
        .backgroundColor($r('app.color.Yellow'))
        .alignRules({
          top: { anchor: "__container__", align: VerticalAlign.Top },
          left: { anchor: "__container__", align: HorizontalAlign.Start },
        })
        .id("image")
      Text(bean.title)
        .fontSize(16)
        .fontColor($r("app.color.item_title"))
        .margin({ left: 10 })
        .alignRules({
          top: { anchor: "image", align: VerticalAlign.Top },
          left: { anchor: "image", align: HorizontalAlign.End },
        })
        .id("item_title")
      Text(bean.desc)
        .fontSize(10)
        .fontColor($r("app.color.item_desc"))
        .margin({ top: 10 })
        .alignRules({
          top: { anchor: "item_title", align: VerticalAlign.Bottom },
          left: { anchor: "item_title", align: HorizontalAlign.Start },
          right: { anchor: "item_title", align: HorizontalAlign.End },
        })
        .id("item_desc")
      Text(bean.author)
        .fontSize(12)
        .fontColor($r("app.color.item_author"))
        .margin({ left: 10 })
        .alignRules({
          bottom: { anchor: "image", align: VerticalAlign.Bottom },
          left: { anchor: "image", align: HorizontalAlign.End },
        })
        .id("item_author")
      Text(bean.releaseTime).fontSize(12).fontColor($r("app.color.item_date"))
        .alignRules({
          right: { anchor: "__container__", align: HorizontalAlign.End },
          bottom: { anchor: "item_author", align: VerticalAlign.Bottom}
        }).id("item_date")
      Divider()
        .strokeWidth(0.5)
        .width(Constants.FULL_WIDTH)
        .backgroundColor($r("app.color.list_divider"))
        .margin({ top: 10, bottom: 10 })
        .alignRules({
          top: { anchor: "image", align: VerticalAlign.Bottom },
          left: { anchor: "__container__", align: HorizontalAlign.Start },
          right: { anchor: "__container__", align: HorizontalAlign.End },
        }).id("divider")

    }.width(Constants.FULL_WIDTH)
    .height(200)
  }
}