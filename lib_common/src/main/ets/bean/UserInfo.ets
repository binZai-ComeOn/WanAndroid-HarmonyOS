import { ArrayList } from '@kit.ArkTS'

export interface UserInfo{
  admin: Boolean,
  chapterTops: ArrayList<number>,
  coinCount: number,
  collectIds: ArrayList<number>,
  email: String,
  icon: String,
  id: number,
  nickname: String,
  password: String,
  publicName: String,
  token: String,
  type: number,
  username: String
}