import { Constants } from '../../../common/Constants'
import HomeViewModel from '../../../viewmodel/HomeViewModel';
import { NavigationBean } from '@ohos/lib_common/src/main/ets/bean/NavigationBean';
import { ArticleBean } from '@ohos/lib_common/src/main/ets/bean/ArticleBean';
import { router } from '@kit.ArkUI';
import { RouterParams } from '../../../bean/RouterParams';

@Preview
@Component
export struct NavigationPage {
  @State currentIndex: number = 0;
  @State navigationMenu: NavigationBean[] = []

  aboutToAppear(): void {
    HomeViewModel.getNaviJson().then((data: NavigationBean[]) => {
      this.navigationMenu = data
    })
  }

  build() {
    Tabs({ barPosition: BarPosition.Start }) {
      ForEach(this.navigationMenu, (bean: NavigationBean, index: number) => {
        TabContent() {
          Column() {
            Text(bean.name).fontSize(16).fontColor($r('app.color.item_title'))
              .padding({ top: 16, bottom: 10, left: 10 })
            Flex({ wrap: FlexWrap.Wrap }) {
              ForEach(bean.articles, (item: ArticleBean) => {
                Text(item.title)
                  .padding(10)
                  .margin({ left: 5, right: 5, top: 5, bottom: 5 })
                  .backgroundColor($r('app.color.theme_pink_color_primary'))
                  .fontColor($r('app.color.Black'))
                  .onClick(() => {
                    router.pushUrl({ url: "pages/ArticleDetailsPage", params: new RouterParams(item) })
                  })
              })
            }
          }.width(Constants.FULL_WIDTH)
          .alignItems(HorizontalAlign.Start)
          .padding({ top: 10 })
        }.tabBar(this.TabBuilder(index))
        .height(Constants.FULL_HEIGHT)
      }, (item: string) => JSON.stringify(item));
    }
    .vertical(true)
    .barMode(BarMode.Scrollable)
    .barWidth(70)
    .barHeight(Constants.FULL_HEIGHT)
    .animationDuration(400)
    .margin({ bottom: '12vp' })
    .padding({ left: '0' })
    .divider({
      strokeWidth: 0.5,
      color: Color.Gray
    })
    .onAnimationStart((_index: number, targetIndex: number, _event: TabsAnimationEvent) => {
      this.currentIndex = targetIndex;
    })
  }

  @Builder
  private TabBuilder(index: number) {
    Column() {
      Text(this.navigationMenu[index].name)
        .margin({
          top: 12,
          bottom: 12
        })
        .fontSize(this.currentIndex === index ? '12fp' : '10fp')
        .fontWeight(this.currentIndex === index ?
        Constants.TAB_BARS_SELECT_TEXT_FONT_WEIGHT : Constants.TAB_BARS_UN_SELECT_TEXT_FONT_WEIGHT)
        .fontColor($r('app.color.tab_selected_color'))
    }
    .alignItems(HorizontalAlign.Start)
  }
}