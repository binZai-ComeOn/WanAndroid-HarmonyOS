import { Constants } from '../common/Constants'
import { TitleBar } from '../widget/TitleBar'
import { ParentColumn } from '../widget/ParentColumn';
import { router } from '@kit.ArkUI';
import HomeViewModel from '../viewmodel/HomeViewModel';
import { ArrayList, List } from '@kit.ArkTS';
import { BannerBean } from '@ohos/lib_common/src/main/ets/bean/BannerBean';

@Preview
@Component
export struct HomePage {
  @State currentIndex: number = 0;
  private swiperController: SwiperController = new SwiperController();
  @State banners: BannerBean[] = [];

  /**
   * aboutToAppear函数在创建自定义组件的新实例后，在执行其build()函数之前执行。
   * 允许在aboutToAppear函数中改变状态变量，更改将在后续执行build()函数中生效。
   */
  aboutToAppear(): void {

  }

  build() {
    ParentColumn() {
      TitleBar({
        title: $r('app.string.wan_android'),
        rightImg: $r('app.media.ic_search'),
        iconSpace: true,
        onRightImgClick: () => {
          router.pushUrl({ url: "pages/SearchPage" })
        }
      })
      Swiper(this.swiperController) {
        ForEach(this.banners, (item: BannerBean, index: number) => {
          Image(item.imagePath).borderRadius($r('app.integer.image_borderRadius'))
        }, (item: BannerBean) => JSON.stringify(item))
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
      .onAppear(() => {
        HomeViewModel.getBanners().then(((banners: BannerBean[]) => {
          this.banners = banners
        }))
      })
    }
  }
}