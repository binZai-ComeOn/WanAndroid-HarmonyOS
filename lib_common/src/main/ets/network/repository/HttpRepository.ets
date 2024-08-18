import { ArticleBean } from '../../bean/ArticleBean'
import { BannerBean } from '../../bean/BannerBean'
import { HotKeyBean } from '../../bean/HotKeyBean'
import { KnowledgeSystemBean } from '../../bean/KnowledgeSystemBean'
import { LoginBean } from '../../bean/LoginBean'
import { NavigationBean } from '../../bean/NavigationBean'
import { RankingListBean } from '../../bean/RankingListBean'
import { ScoreBean } from '../../bean/ScoreBean'
import { TabBean } from '../../bean/TabBean'
import { UserInfoBean } from '../../bean/UserInfoBean'

export interface HttpRepository {
  getBanners(): BannerBean

  getHotkeys(): HotKeyBean

  getTopArticles(): ArticleBean

  getArticles(): ArticleBean

  getRankingList(): RankingListBean

  getUserScoreList(): ScoreBean

  queryArticles(keywords: String): ArticleBean

  getSquareList(): ArticleBean

  shareArticle(title: String, link: String): String

  getKnowledgeTree(): KnowledgeSystemBean

  getNavJson(): NavigationBean

  getKnowledgeList(id: number): ArticleBean

  getWXChapters(): TabBean

  getWXChapterArticles(id: number): ArticleBean

  getProjectTabs(): TabBean

  getProjectTabArticles(id: number): ArticleBean

  login(username: String, password: String): LoginBean

  register(
    username: String,
    password: String,
    repassword: String
  ): LoginBean

  getUserInfo(): UserInfoBean

  getCollectList(): ArticleBean

  getShareList(page: number): ArticleBean
}