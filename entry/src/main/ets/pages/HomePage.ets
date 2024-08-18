import { Constants } from '../common/Constants'
import { TitleBar } from '../widget/TitleBar'
import { ParentColumn } from '../widget/ParentColumn';
import { router } from '@kit.ArkUI';

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
    ParentColumn() {
      TitleBar({
        title: $r('app.string.wan_android'),
        rightImg: $r('app.media.ic_search'),
        iconSpace: true,
        onRightImgClick: () => {
          router.pushUrl({url:"pages/SearchPage"})
        }
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
  }
}