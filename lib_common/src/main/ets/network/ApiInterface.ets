export class ApiInterface {
  static baseUrl = "https://www.wanandroid.com"

  /**
   * 搜索热词
   * https://www.wanandroid.com/hotkey/json
   */
  static hotkey = "/hotkey/json"

  /**
   * 置顶文章
   * https://www.wanandroid.com/article/top/json
   */
  static articleTop = "/article/top/json"

  /**
   * 获取积分排行榜
   * https://www.wanandroid.com/coin/rank/1/json
   * @param page 页码 从1开始
   */
  static coinRank = "/coin/rank/{page}/json"

  /**
   * 获取个人积分列表，需要登录后访问
   * https://www.wanandroid.com//lg/coin/list/1/json
   * @param page 页码 从1开始
   */
  static coinList = "/lg/coin/list/{page}/json"

  static articleQuery = "/article/query/{page}/json"

  /**
   * 广场列表数据
   * https://wanandroid.com/user_article/list/0/json
   * @param page 页码拼接在url上从0开始
   */
  static userArticleList = "/user_article/list/{page}/json"

  /**
   * 获取知识体系
   * https://www.wanandroid.com/tree/json
   */
  static articleTree = "/tree/json"

  /**
   * 获取导航数据
   * https://www.wanandroid.com/navi/json
   */
  static navi = "/navi/json"

  /**
   * 知识体系下的文章
   * https://www.wanandroid.com/article/list/0/json?cid=168
   * @param page
   * @param cid
   */
  static articleList = "/article/list/{page}/json"

  /**
   * 获取公众号列表
   * https://wanandroid.com/wxarticle/chapters/json
   */
  static wxarticleChapters = "/wxarticle/chapters/json"

  /**
   * 获取公众号列表
   * https://wanandroid.com/wxarticle/list/408/1/json
   */
  static wxarticleList = "/wxarticle/list/{id}/{page}/json"

  /**
   * 获取公众号列表
   * https://www.wanandroid.com/project/tree/json
   */
  static projectTree = "/project/tree/json"

  /**
   * 获取公众号列表
   * https://www.wanandroid.com/project/list/1/json?cid=294
   */
  static projectList = "/project/list/1/json"

  /**
   * 登录
   * https://www.wanandroid.com/user/login
   * @param username
   * @param password
   */
  static login = "/user/login"

  /**
   * 注册
   * https://www.wanandroid.com/user/register
   * @param username
   * @param password
   * @param repassword
   */
  static register = "/user/register"

  /**
   * 获取个人积分，需要登录后访问
   * https://www.wanandroid.com/user/lg/userinfo/json
   */
  static userinfo =  "/user/lg/userinfo/json"

  /**
   * 收藏文章列表
   * https://www.wanandroid.com/lg/collect/list/0/json
   */
  static collectList = "/lg/collect/list/{page}/json"

  /**
   * 自己的分享的文章列表
   * https://wanandroid.com/user/lg/private_articles/1/json
   * @param page 页码 从1开始
   */
  static privateArticles = "/user/lg/private_articles/{page}/json"

  /**
   * 分享文章
   * https://www.wanandroid.com/lg/user_article/add/json
   * @param title
   * @param link
   */
  static addArticle =  "/lg/user_article/add/json"

  /**
   * 首页banner
   * https://www.wanandroid.com/banner/json
   */
  static banner = "/banner/json"
}