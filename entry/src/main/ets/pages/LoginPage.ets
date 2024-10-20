import { Constants } from '../common/Constants'
import { TitleBar } from '../widget/TitleBar'
import { promptAction, router } from '@kit.ArkUI'
import LoginViewModel from '../viewmodel/LoginViewModel'
import { JSONUtil, ToastUtil } from '@pura/harmony-utils'
import BaseResponse from '@ohos/lib_common/src/main/ets/bean/BaseResponse'
import { LoginBean } from '@ohos/lib_common/src/main/ets/bean/LoginBean'
import { MMKV } from '@ohos/mmkv'
import { AppCache } from '@ohos/lib_common/src/main/ets/utils/AppCache'

/**
 * 登录页面
 */
@Entry
@Component
export struct LoginPage {
  @State isLogin: boolean = true
  @State title: Resource = $r('app.string.login')
  @State username: string = ""
  @State password1: string = ""
  @State password2: string = ""

  aboutToAppear(): void {

  }

  build() {
    Column() {
      if (this.isLogin) {
        this.Login()
      } else {
        this.Register()
      }
    }
    .padding({ left: Constants.PAGE_MARGIN_LEFT, right: Constants.PAGE_MARGIN_RIGHT })
    .width(Constants.FULL_WIDTH).height(Constants.FULL_HEIGHT)
  }

  @Builder
  Register() {
    TitleBar({
      leftImg: $r('app.media.ic_back'),
      onLeftImgClick: () => {
        router.back()
      },
      title: $r('app.string.register')
    })
    Text($r('app.string.register'))
      .fontSize(18)
      .width(Constants.FULL_WIDTH)
    Text($r('app.string.register_tip'))
      .padding({ top: 6, bottom: 30 })
      .width(Constants.FULL_WIDTH)
      .fontSize(14)
    TextInput({text: this.username, placeholder: $r('app.string.please_input_account') })
      .onChange((value: string) => {
        this.username = value
      })
    Blank().height(6)
    TextInput({text: this.password1, placeholder: $r('app.string.please_input_password') })
      .type(InputType.Password)
      .onChange((value: string) => {
        this.password1 = value
      })
    Blank().height(6)
    TextInput({text: this.password2, placeholder: $r('app.string.enter_password_again') })
      .type(InputType.Password)
      .onChange((value: string) => {
        this.password2 = value
      })
    Blank().height(24)
    Button($r('app.string.register'), { type: ButtonType.Normal, stateEffect: true })
      .borderRadius(8)
      .width(Constants.FULL_WIDTH)
      .onClick(() => {
        console.log('ButtonType.Normal'+this.username+",,"+this.password1+",,"+this.password2)
        if (this.checkParameter()) return
        LoginViewModel.register(this.username, this.password1, this.password2).then((data: BaseResponse<LoginBean>) => {
          if (data.errorCode == 0) {
            ToastUtil.showToast($r('app.string.register_success'))
            this.isLogin = true
          } else {
            ToastUtil.showToast(data.errorMsg)
          }
        })
      })
    Blank().height(6)
    Text($r('app.string.have_account'))
      .width(Constants.FULL_WIDTH)
      .fontSize(16)
      .textAlign(TextAlign.End)
      .align(Alignment.End)
      .onClick(() => {
        this.initParameter()
        this.isLogin = true
      })
  }

  @Builder
  Login() {
    TitleBar({
      leftImg: $r('app.media.ic_back'),
      onLeftImgClick: () => {
        router.back()
      },
      title: $r('app.string.login')
    })
    Text($r('app.string.user_login'))
      .fontSize(18)
      .width(Constants.FULL_WIDTH)
    Text($r('app.string.login_tip'))
      .padding({ top: 6, bottom: 30 })
      .width(Constants.FULL_WIDTH)
      .fontSize(14)
    TextInput({text: this.username, placeholder: $r('app.string.please_input_account') })
      .onChange((value: string) => {
        this.username = value
      })
    Blank().height(6)
    TextInput({text: this.password1, placeholder: $r('app.string.please_input_password') })
      .type(InputType.Password)
      .onChange((value: string) => {
        this.password1 = value
      })
    Blank().height(24)
    Button($r('app.string.login'), { type: ButtonType.Normal, stateEffect: true })
      .borderRadius(8)
      .width(Constants.FULL_WIDTH)
      .onClick(() => {
        console.log('ButtonType.Normal'+this.username+",,"+this.password1)
        if (!this.checkParameter()) return
        LoginViewModel.login(this.username, this.password1).then((data : BaseResponse<LoginBean>) => {
          if (data.errorCode == 0) {
            let result = data.data
            if (result != undefined) {
              AppCache.get().setUserId(result.id)
              AppCache.get().setUserType(result.type)
              AppCache.get().setUserNickname(result.nickname)
              AppCache.get().setUserPublicName(result.publicName)
              AppCache.get().setUserCoinCount(result.coinCount)
            }
            ToastUtil.showToast($r('app.string.login_success'))
            router.back()
          } else {
            ToastUtil.showToast(data.errorMsg)
          }
        })
      })
    Blank().height(6)
    Text($r('app.string.no_account'))
      .width(Constants.FULL_WIDTH)
      .fontSize(16)
      .textAlign(TextAlign.End)
      .align(Alignment.End)
      .onClick(() => {
        this.initParameter()
        this.isLogin = false
      })
  }

  initParameter() {
    this.username = ""
    this.password1 = ""
    this.password2 = ""
  }

  checkParameter() : boolean {
    if (this.username == "") {
      ToastUtil.showToast($r('app.string.please_input_account'))
      return false
    } else if (this.password1 == "") {
      ToastUtil.showToast($r('app.string.please_input_password'))
      return false
    } else if (!this.isLogin && this.password2 == "") {
      ToastUtil.showToast($r('app.string.enter_password_again'))
      return false
    } else if (!this.isLogin && this.password2 != this.password1) {
      ToastUtil.showToast($r('app.string.enter_password_try'))
      return false
    }
    return true
  }
}
