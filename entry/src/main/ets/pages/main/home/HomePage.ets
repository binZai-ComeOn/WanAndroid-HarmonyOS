import { Constants } from '../../../common/Constants'
import { TitleBar } from '../../../widget/TitleBar'
import { ParentColumn } from '../../../widget/ParentColumn';
import { router } from '@kit.ArkUI';
import HomeViewModel from '../../../viewmodel/HomeViewModel';
import { ArrayList } from '@kit.ArkTS';
import { BannerBean } from '@ohos/lib_common/src/main/ets/bean/BannerBean';
import { ArticleBean } from '@ohos/lib_common/src/main/ets/bean/ArticleBean';
import BaseResponseList from '@ohos/lib_common/src/main/ets/bean/BaseResponseList';
import TimeUtil from '@ohos/lib_common/src/main/ets/utils/TimeUtil';
import { Tag } from '@ohos/lib_common/src/main/ets/bean/Tag';
import { ArticleItem } from '../../../widget/ArticleItem';
import AppUtils from '@ohos/lib_common/src/main/ets/utils/AppUtils';
import { RouterParams } from '../../../bean/RouterParams';

@Preview
@Component
export struct HomePage {
  @State currentIndex: number = 0;
  private swiperController: SwiperController = new SwiperController();
  @State banners: BannerBean[] = [];
  @State articles: ArticleBean[] = [];
  /**
   * Parameters for pagination
   */
  @State page: number = 0

  /**
   * aboutToAppear函数在创建自定义组件的新实例后，在执行其build()函数之前执行。
   * 允许在aboutToAppear函数中改变状态变量，更改将在后续执行build()函数中生效。
   */
  aboutToAppear(): void {
    HomeViewModel.getBanners().then((banners: BannerBean[]) => {
      this.banners = banners
    })
    HomeViewModel.getArticleTop().then((articles: ArrayList<ArticleBean>) => {
      let list: ArticleBean[] = []
      list = AppUtils.processingArticleData(articles)
      this.articles = list

      HomeViewModel.getArticles(this.page).then((data: BaseResponseList<ArrayList<ArticleBean>>) => {
        let handledata = AppUtils.processingArticleData(data.datas)
        handledata.forEach((item: ArticleBean) => {
          list.push(item)
        })
        this.articles = list
      })
    })
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

      List({ space: 0, initialIndex: 0 }) {
        ForEach(this.articles, (item: ArticleBean, index?: number) => {
          ListItem() {
            ArticleItem({
              item: item, clickEnvent: (event: ClickEvent) => {
                router.pushUrl({ url: "pages/ArticleDetailsPage", params: new RouterParams(item) })
              }
            })
          }
        }, (item: string) => item)
      }
      .scrollBar(BarState.Auto)
    }
  }
}
