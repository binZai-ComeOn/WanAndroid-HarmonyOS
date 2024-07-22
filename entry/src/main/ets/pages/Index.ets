import { Constants } from '../common/Constants';
import { resourceManager } from '@kit.LocalizationKit';
import { image } from '@kit.ImageKit';
import { effectKit } from '@kit.ArkGraphics2D';

@Entry
@Component
struct Index {
  @State currentIndex: number = 0;
  private tabsController: TabsController = new TabsController();
  private swiperController: SwiperController = new SwiperController();
  @State imgData: Resource[] = [
    $r('app.media.image1'),
    $r('app.media.image2'),
    $r('app.media.image3'),
    $r('app.media.image4'),
    $r('app.media.image5'),
    $r('app.media.image6'),
  ];

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
        Swiper(this.swiperController) {
          ForEach(this.imgData, (item: Resource) => {
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
          // try {
          //   const context = getContext(this);
          //   const resourceMgr: resourceManager.ResourceManager = context.resourceManager;
          //   const fileData: Uint8Array = await resourceMgr.getMediaContent(this.imgData[targetIndex]);
          //   const buffer = fileData.buffer as ArrayBuffer;
          //   const imageSource: image.ImageSource = image.createImageSource(buffer);
          //   const pixelMap: image.PixelMap = await imageSource.createPixelMap();
          //
          //   effectKit.createColorPicker(pixelMap, (err, colorPicker) => {
          //     let color = colorPicker.getMainColorSync();
          //     animateTo({
          //       duration: CommonConstants.ANIMATION_DURATION,
          //       curve: Curve.Linear,
          //       iterations: CommonConstants.ANIMATION_ITERATIONS
          //     }, () => {
          //       this.bgColor = "#" + color.alpha.toString(CommonConstants.HEXADECIMAL) +
          //       color.red.toString(CommonConstants.HEXADECIMAL) + color.green.toString(CommonConstants.HEXADECIMAL) +
          //       color.blue.toString(CommonConstants.HEXADECIMAL);
          //     })
          //   })
          // } catch (e) {
          //   hilog.error(0x0000, 'TestTag', 'Failed error.code is %{public}d,error.message is %{public}s', e.code,
          //     e.message);
          // }
        })
      }
    }
    .padding({ left: $r('app.float.padding_bottom_tab'), right: $r('app.float.padding_bottom_tab') })
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