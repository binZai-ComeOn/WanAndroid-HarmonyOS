import { CoinInfo } from './CoinInfo'
import { CollectArticleInfo } from './CollectArticleInfo'
import { UserInfo } from './UserInfo'

export class UserInfoBean{
  coinInfo: CoinInfo = new CoinInfo()
  userInfo: UserInfo = new UserInfo()
  collectArticleInfo: CollectArticleInfo = new CollectArticleInfo()
}