import { CoinInfo } from './CoinInfo'
import { CollectArticleInfo } from './CollectArticleInfo'
import { UserInfo } from './UserInfo'

export interface UserInfoBean{
  coinInfo: CoinInfo,
  userInfo: UserInfo,
  collectArticleInfo: CollectArticleInfo
}