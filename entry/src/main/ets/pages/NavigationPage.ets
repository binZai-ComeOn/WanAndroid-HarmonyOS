import { Constants } from '../common/Constants'

@Preview
@Component
export struct NavigationPage {
  tabs: Resource[] = [$r('app.string.system'), $r('app.string.system'), $r('app.string.system')];
  @State currentIndex: number = 0;

  aboutToAppear(): void {

  }

  build() {
    Tabs({ barPosition: BarPosition.Start }) {
      ForEach(this.tabs, (tabName: Resource, index: number) => {
        TabContent() {
          Column() {
            Text(tabName)
          }.width(Constants.FULL_WIDTH).height(Constants.FULL_HEIGHT)
        }.tabBar(this.TabBuilder(index))
      }, (item: string) => JSON.stringify(item));
    }
    .vertical(true)
    .barMode(BarMode.Scrollable)
    .barWidth(70)
    .barHeight(200)
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
      Text(this.tabs[index])
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