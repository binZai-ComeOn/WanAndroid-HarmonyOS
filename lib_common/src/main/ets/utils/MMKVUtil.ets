import { MMKV } from "@ohos/mmkv";

export abstract class MMKVUtil {
  mmkv = MMKV.getDefaultMMKV()

  setString(key: string, value: string) {
    this.mmkv.encodeString(key, value)
  }

  getString(key: string) {
    return this.mmkv.decodeString(key,"")
  }

  setNumber(key: string, value: number) {
    this.mmkv.encodeNumber(key, value)
  }

  getNumber(key: string) {
    return this.mmkv.decodeNumber(key, 0)
  }

  setBool(key: string, value: boolean) {
    this.mmkv.encodeBool(key, value)
  }

  getBool(key: string) {
    return this.mmkv.decodeBool(key, false)
  }
}