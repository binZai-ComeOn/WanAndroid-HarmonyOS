import axios, { AxiosResponse } from '@ohos/axios'
import { ArticleBean } from '../bean/ArticleBean'
import { BaseResponse } from '../bean/BaseResponse'

export class Api {
  private static mInstance: Api

  static get(): Api {
    if (Api.mInstance === undefined) {
      Api.mInstance = new Api()
    }
    return Api.mInstance
  }

  //获取首页数据
  async getIndexData(): Promise<AxiosResponse<BaseResponse<ArticleBean>>> {
    return axios.get<AxiosResponse<BaseResponse<ArticleBean>>, AxiosResponse<BaseResponse<ArticleBean>>, null>('article/list/0/json',
      {
        baseURL:"https://www.wanandroid.com/",
        params: {
          page_size: 40
        }
      })
  }
}