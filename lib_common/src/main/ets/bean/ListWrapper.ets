export interface ListWrapper<T>{
  curPage: number,
  offset: number,
  over: Boolean,
  pageCount: number,
  size: number,
  total: number,
  datas: Array<T>
}