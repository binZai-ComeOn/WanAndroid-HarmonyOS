import { Constants } from '../common/Constants';
import { HomePage } from './HomePage';
import { SquarePage } from './SquarePage';
import { OfficialAccountPage } from './OfficialAccountPage';
import { ProjectsPage } from './ProjectsPage';
import { SystemPage } from './SystemPage';
import { SideBarTitleBar } from '../widget/SideBarTitleBar';
import { TextRowFlow } from '../widget/TextRowFlow';

@Entry
@Component
struct Index {
  @State currentIndex: number = 0;
  private tabsController: TabsController = new TabsController();
  swiperImgData: Resource[] = [
    $r('app.media.image1'),
    $r('app.media.image2'),
    $r('app.media.image3'),
    $r('app.media.image4'),
    $r('app.media.image5'),
    $r('app.media.image6'),
  ];
  @Provide isShowSideBar: boolean = false

  build() {
    Column() {
      //TextRowFlow()
      SideBarTitleBar() {
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
        .onAnimationStart((_index: number, targetIndex: number) => {
          this.currentIndex = targetIndex;
          this.isShowSideBar = false
        })
      }
    }
  }

  @Builder
  tabContentBuilder(text: Resource, index: number, selectedImg: Resource, normalImg: Resource) {
    TabContent() {
      Column() {
        if (index == 0) {
          HomePage()
        } else if (index == 1) {
          SquarePage()
        } else if (index == 2) {
          SystemPage()
        } else if (index == 3) {
          OfficialAccountPage()
        } else if (index == 4) {
          ProjectsPage()
        }
      }
    }
    .backgroundColor(Color.White)
    .align(Alignment.Top)
    .tabBar(this.tabBuilder(text, index, selectedImg, normalImg))
  }

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
}
