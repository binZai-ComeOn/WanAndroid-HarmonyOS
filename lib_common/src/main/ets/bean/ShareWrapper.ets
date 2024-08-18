import { CoinInfo } from './CoinInfo'
import { ListWrapper } from './ListWrapper'

export interface ShareWrapper<T>{
  coinInfo: CoinInfo,
  shareArticles: ListWrapper<T>
}