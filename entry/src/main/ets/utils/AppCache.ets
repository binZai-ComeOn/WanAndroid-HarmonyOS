import {MMKVUtil} from '@ohos/lib_common/src/main/ets/utils/MMKVUtil'
import { AppCacheConstants } from '../common/AppCacheConstants'

export class AppCache extends MMKVUtil{
  private static instance: AppCache;

  private constructor() {
    super();
  }

  public static get(): AppCache {
    if (!AppCache.instance) {
      AppCache.instance = new AppCache();
    }
    return AppCache.instance;
  }

  setUserCoinCount(value: number) {
    this.setNumber(AppCacheConstants.UserCoinCount, value)
  }

  getUserCoinCount() : number {
    return this.getNumber(AppCacheConstants.UserCoinCount)
  }

  setUserId(value: number) {
    this.setNumber(AppCacheConstants.UserId,value)
  }

  getUserId() : number {
    return this.getNumber(AppCacheConstants.UserId)
  }

  setUserNickname(value: string) {
    this.setString(AppCacheConstants.UserNickname, value)
  }

  getUserNickname() : string {
    return this.getString(AppCacheConstants.UserNickname)
  }

  setUserPublicName(value: string) {
    this.setString(AppCacheConstants.UserPublicName, value)
  }
  getUserPublicName() : string{
    return this.getString(AppCacheConstants.UserPublicName)
  }

  getUserType(): number {
    return this.getNumber(AppCacheConstants.UserCollectIds)
  }

  setUserType(value: number) {
    this.setNumber(AppCacheConstants.UserType, value)
  }

  setUserCollectIds(value: number) {
    this.setNumber(AppCacheConstants.UserCollectIds, value)
  }

  getUserCollectIds() : number{
    return this.getNumber(AppCacheConstants.UserCollectIds)
  }
}