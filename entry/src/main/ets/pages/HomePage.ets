import { Constants } from '../common/Constants'
import { SideBarUI } from '../widget/SideBarUI';
import { TitleBar } from '../widget/TitleBar'

@Preview
@Component
export struct HomePage {
  @State currentIndex: number = 0;
  private swiperController: SwiperController = new SwiperController();
  @State swiperImgData: Resource[] = [
    $r('app.media.image1'),
    $r('app.media.image2'),
    $r('app.media.image3'),
    $r('app.media.image4'),
    $r('app.media.image5'),
    $r('app.media.image6'),
  ];

  build() {
    SideBarContainer(SideBarContainerType.Embed) {
      // 侧边栏的 ui
      SideBarUI()
      // HomePage内容
      Column() {
        TitleBar({
          title: $r('app.string.wan_android'),
          rightImg: $r('app.media.ic_search'),
          iconSpace: true
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
        .onAnimationStart(async () => {

        })
      }
      .padding({ left: '20vh', right: '20vh' }).width('100%').height('100%')
    }.controlButton({
      left: 30,
      top: 21,
      height: 24,
      width: 24,
      icons: {
        shown: $r("app.media.ic_menu"),
        hidden: $r("app.media.ic_menu"),
        switching: $r("app.media.ic_menu")
      }
    })
  }
}