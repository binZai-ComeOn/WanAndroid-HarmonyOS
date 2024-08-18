import { Constants } from '../common/Constants'
import { TitleBar } from '../widget/TitleBar'
import { ParentColumn } from '../widget/ParentColumn';
import { router } from '@kit.ArkUI';
import { LogUtil } from '@pura/harmony-utils';
import { HttpRequest } from '@ohos/lib_common/src/main/ets/network/repository/HttpRequest'
import { ArticleBean } from '@ohos/lib_common/src/main/ets/bean/ArticleBean'

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

  /**
   * aboutToAppear函数在创建自定义组件的新实例后，在执行其build()函数之前执行。
   * 允许在aboutToAppear函数中改变状态变量，更改将在后续执行build()函数中生效。
   */
  aboutToAppear(): void {
    HttpRequest.getInstance().get<ArticleBean>("/user_article/list/1/json",ArticleBean)
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