import { Constants } from '../common/Constants'
import { TitleBar } from '../widget/TitleBar'
import { ParentColumn } from '../widget/ParentColumn';
import { router } from '@kit.ArkUI';
import HomeViewModel from '../viewmodel/HomeViewModel';
import { ArrayList } from '@kit.ArkTS';
import { BannerBean } from '@ohos/lib_common/src/main/ets/bean/BannerBean';
import { ArticleBean } from '@ohos/lib_common/src/main/ets/bean/ArticleBean';
import BaseResponseList from '@ohos/lib_common/src/main/ets/bean/BaseResponseList';
import TimeUtil from '@ohos/lib_common/src/main/ets/utils/TimeUtil';
import { Tag } from '@ohos/lib_common/src/main/ets/bean/Tag';

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
    HomeViewModel.getBanners().then(((banners: BannerBean[]) => {
      this.banners = banners
    }))
    // HomeViewModel.getArticleTop().then(((articles: ArrayList<ArticleBean>) => {
    //   console.log("articles22:"+articles.length+","+this.articles.length)
    //   articles.forEach((item: ArticleBean) => {
    //     //this.articles.add(item)
    //   })
    //   console.log("articles:"+articles.length+","+this.articles.length)
    //
    // }))

    HomeViewModel.getArticles(this.page).then(((data: BaseResponseList<ArrayList<ArticleBean>>) => {
      console.log("articles22:" + data.datas.length + "," + this.articles.length)
      let list: ArticleBean[] = []
      data.datas.forEach((item: ArticleBean) => {
        if (item.author == "") {
          item.author = item.shareUser
        }
        item.releaseTime = TimeUtil.millisecond2Time(item.publishTime)
        if (item.tags.length > 0) {
          item.tags.forEach((tag: Tag, index: number) => {
            item.tag = tag.name
            if (item.tags.length != (index - 1)) {
              item.tag += " / "
            }
          })
        } else {
          if (item.superChapterName != null && item.superChapterName != "" && item.chapterName != null &&
            item.chapterName != "") {
            item.tag = item.superChapterName + " / " + item.chapterName
          } else if (item.superChapterName != null && item.superChapterName != "") {
            item.tag = item.superChapterName
          } else if (item.chapterName != null && item.chapterName != "") {
            item.tag = item.chapterName
          }
        }
        list.push(item)
      })
      this.articles = list
      console.log("articles1:" + data.datas.length + "," + this.articles.length)
      this.articles.forEach((item: ArticleBean) => {
        console.log("测试：" + item.tags[0])
        console.log("item：" + item.author)
      })
    }))
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

      // 遍历列表可以使用 ComposeListItem
      // ComposeListItem()
      List({ space: 0, initialIndex: 0 }) {
        ForEach(this.articles, (item: ArticleBean, index?: number) => {
          ListItem() {
            this.HomeListItem(item)
          }
        }, (item: string) => item)
      }
      .scrollBar(BarState.Auto)
    }
  }

  @Builder
  HomeListItem(item: ArticleBean) {
    Column() {
      Row() {
        Row() {
          if (item.top == "1") {
            Text($r('app.string.topping'))
              .fontSize(10)
              .padding({
                left: 4,
                right: 4,
                top: 2,
                bottom: 2
              })
              .fontColor($r('app.color.Red'))
              .border({ width: 0.5, radius: 2, color: $r('app.color.Red') })
            Blank().width(5)
          }
          if (item.fresh) {
            Text($r('app.string.xin'))
              .fontSize(10)
              .padding({
                left: 4,
                right: 4,
                top: 2,
                bottom: 2
              })
              .fontColor($r('app.color.Red'))
              .border({ width: 0.5, radius: 2, color: $r('app.color.Red') })
            Blank().width(5)
          }
          if (item.tags.length > 0) {
            Text(item.tags[0].name)
              .border({ width: 0.5, radius: 2, color: $r('app.color.colorAccent') })
              .padding({
                left: 4,
                right: 4,
                top: 2,
                bottom: 2
              })
              .fontColor($r('app.color.colorAccent'))
              .fontSize(10)
            Blank().width(5)
          }
          Text(item.author).fontSize(12).fontColor($r('app.color.item_author'))
        }.layoutWeight(1)

        Text(item.releaseTime.toString())
          .layoutWeight(1)
          .textAlign(TextAlign.End)
          .fontColor($r('app.color.item_date'))
          .fontSize(12)
      }

      Text(item.title.toString())
        .width(Constants.FULL_WIDTH)
        .fontSize(14)
        .padding({ top: 8 })
        .textAlign(TextAlign.Start)
        .fontColor($r('app.color.item_title'))
      Text(item.tag)
        .width(Constants.FULL_WIDTH)
        .textAlign(TextAlign.Start)
        .fontSize(10)
        .padding({ top: 8 })
        .fontColor($r('app.color.item_chapter'))
      Blank().height(8)
      Row().width(Constants.FULL_WIDTH).height(0.5).backgroundColor($r('app.color.list_divider'))
    }.padding({ top: 8, bottom: 8 }).width(Constants.FULL_WIDTH)
  }
}