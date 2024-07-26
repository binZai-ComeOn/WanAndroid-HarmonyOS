import { Constants } from '../common/Constants';
import { ComposeTitleBar, promptAction } from '@kit.ArkUI'
import { NavDestinationItem } from '../viewmodel/NavDestinationItem';
import { TitleBar } from '../widget/TitleBar';

interface menuItem {
  value: Resource;
  isEnabled?: boolean;
  action?: () => void
}

@Entry
@Component
struct Index {
  @State currentIndex: number = 0;
  private tabsController: TabsController = new TabsController();
  private swiperController: SwiperController = new SwiperController();
  @State swiperImgData: Resource[] = [
    $r('app.media.image1'),
    $r('app.media.image2'),
    $r('app.media.image3'),
    $r('app.media.image4'),
    $r('app.media.image5'),
    $r('app.media.image6'),
  ];
  private homePageMenus: Array<menuItem> = [
    {
      value: $r('app.media.ic_search'),
      isEnabled: true,
      action: () => promptAction.showToast({ message: "show toast index 1" })
    }
  ]

  @Builder
  tabBuilder(title: Resource, index: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === index ? selectedImg : normalImg)
        .width($r('app.float.mainPage_baseTab_size'))
        .height($r('app.float.mainPage_baseTab_size'))
        .objectFit(ImageFit.Contain)
      Text(title)
        .margin({ top: $r('app.float.mainPage_baseTab_top') })
        .fontSize($r('app.float.tab_text_font_size'))
        .fontColor(this.currentIndex === index ? $r('app.color.current_color') : $r('app.color.text_color'))
    }
    .justifyContent(FlexAlign.Center)
    .height($r('app.float.mainPage_barHeight'))
    .width(Constants.FULL_WIDTH)
    .onClick(() => {
      this.currentIndex = index;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }

  @Builder
  tabContentBuilder(text: Resource, index: number, selectedImg: Resource, normalImg: Resource) {
    TabContent() {
      Column() {
        TitleBar({
          leftImg: $r('app.media.ic_menu'),
          title: $r('app.string.wan_android'),
          rightImg: $r('app.media.ic_search')
        })
        Swiper(this.swiperController) {
          ForEach(this.swiperImgData, (item: Resource) => {
            Image(item).borderRadius($r('app.integer.image_borderRadius'))
          }, (item: Resource) => JSON.stringify(item))
        }
        .width(Constants.FULL_WIDTH)
        .padding({
          top: $r('app.integer.swiper_padding_top')
        })
        .autoPlay(true)
        .interval(Constants.SWIPER_INTERVAL)
        .duration(Constants.SWIPER_DURATION)
        .loop(true)
        .itemSpace(Constants.SWIPER_ITEM_SPACE)
        .indicator(false)
        .onAnimationStart(async (index, targetIndex) => {

        })
      }
    }
    .padding({ left: '20vh', right: '20vh' })
    .backgroundColor(Color.White)
    .align(Alignment.Top)
    .tabBar(this.tabBuilder(text, index, selectedImg, normalImg))
  }

  build() {
    Tabs({
      barPosition: BarPosition.End,
      controller: this.tabsController
    }) {
      this.tabContentBuilder($r('app.string.home'),
        Constants.TAB_INDEX_ZERO, $r('app.media.ic_tab_home_action'), $r('app.media.ic_tab_home'))
      this.tabContentBuilder($r('app.string.square'),
        Constants.TAB_INDEX_ONE, $r('app.media.ic_tab_square_action'), $r('app.media.ic_tab_square'))
      this.tabContentBuilder($r('app.string.system'),
        Constants.TAB_INDEX_TWO, $r('app.media.ic_tab_system_action'), $r('app.media.ic_tab_system'))
      this.tabContentBuilder($r('app.string.official_account'),
        Constants.TAB_INDEX_THREE, $r('app.media.ic_tab_official_account_action'),
        $r('app.media.ic_tab_official_account'))
      this.tabContentBuilder($r('app.string.projects'),
        Constants.TAB_INDEX_FOUR, $r('app.media.ic_tab_projects_action'), $r('app.media.ic_tab_projects'))
    }
    .width(Constants.FULL_WIDTH)
    .backgroundColor($r('app.color.tab_color'))
    .barHeight($r('app.float.mainPage_barHeight'))
    .barMode(BarMode.Fixed)
    .onAnimationStart((index: number, targetIndex: number) => {
      this.currentIndex = targetIndex;
    })
  }
}