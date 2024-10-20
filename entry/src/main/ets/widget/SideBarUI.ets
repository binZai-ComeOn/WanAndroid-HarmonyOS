import { SideBarItem } from '../bean/SideBarItem'
import { Constants } from '../common/Constants'
import { FunctionsItem } from './FunctionsItem'
import { TitleBar } from './TitleBar'
import { promptAction, router } from '@kit.ArkUI'
import { AppCache } from '@ohos/lib_common/src/main/ets/utils/AppCache'
import HomeViewModel from '../viewmodel/HomeViewModel'
import { UserInfoBean } from '@ohos/lib_common/src/main/ets/bean/UserInfoBean'
import { ToastUtil } from '@pura/harmony-utils'

@Preview
@Entry
@Component
export struct SideBarUI {
  @State username: string = "去登录"
  gradle: string = "--"
  ranking: string = "--"
  @State functions: Array<SideBarItem> = new Array()
  @State rank: string = "0"
  @State level: number = 0

  aboutToAppear() {
    this.username = AppCache.get().getUserNickname()
    if (this.username != "") {
      this.functions = Constants.SIDE_BAR_LIST
      HomeViewModel.getUserInfo().then((data: UserInfoBean) => {
        this.level = data.coinInfo.level
        this.rank = data.coinInfo.rank
        this.functions[0].subText = data.coinInfo.coinCount.toString()
      })
    } else {
      Constants.SIDE_BAR_LIST.forEach((value: SideBarItem, index: number) => {
        if (index != Constants.SIDE_BAR_LIST.length - 1) {
          this.functions.push(value)
        }
      })
    }
  }

  build() {
    Column() {
      TitleBar({
        rightImg: $r('app.media.ic_ranking'),
        onRightImgClick: () => {
          if (this.jumpPage()) {
            router.pushUrl({ url: "pages/PointsRankPage" })
          }
        }
      }).margin({ right: 10 })
      Column() {
        Image($r('app.media.ic_default_avatar')).border({ radius: 50 }).width(80).height(80)
        Text(this.username).fontSize(16).fontWeight(FontWeight.Bold).margin(12)
        Row() {
          Text("等级：").fontSize(12)
          Text(this.gradle).fontSize(12)
          Text("排名：").fontSize(12).margin({ left: 10 })
          Text(this.ranking).fontSize(12)
        }.margin(8)
      }.onClick(() => {
        router.pushUrl({url: "pages/LoginPage"})
      })

      ForEach(this.functions.slice(0, this.functions.length), (item: SideBarItem, index: number) => {
        FunctionsItem({
          leftImg: item.leftImage,
          text: item.text,
          subText: item.subText,
          clickEnvent: (event: ClickEvent) => {
            if (index == 0) {
              if (this.jumpPage()) {
                router.pushUrl({ url: "pages/PointDetailPage" })
              }
            } else if (index == 1) {
              if (this.jumpPage()) {
                router.pushUrl({ url: "pages/MyCollectPage" })
              }
            } else if (index == 2) {
              if (this.jumpPage()) {
              router.pushUrl({ url: "pages/MySharedPage" })
                }
            } else if (index == 3) {

            } else if (index == 4) {
              router.pushUrl({ url: 'pages/SystemSettingPage' })
            } else if (index == 5) {
              showLogoutDialog()
            }
          }
        })
      })
    }.backgroundColor(Color.White).width(Constants.FULL_WIDTH).height(Constants.FULL_HEIGHT)
  }

  jumpPage() : boolean{
    if (AppCache.get().getUserPublicName() == "") {
      ToastUtil.showLong($r('app.string.please_log_in_and_try_again'))
      return false
    }
    return true
  }
}

function showLogoutDialog() {
  promptAction.showDialog({
    title: $r('app.string.logout'),
    message: $r('app.string.is_logout'),
    buttons: [
      {
        text: $r('app.string.cancel'),
        color: '#000000'
      },
      {
        text: $r('app.string.config'),
        color: '#000000'
      }
    ],
  })
    .then(data => {
      if (data.index == 1) {
        // click sure
        AppCache.get().clean()
      }
    })
    .catch((err: Error) => {
      console.info('showDialog error: ' + err);
    })
}
