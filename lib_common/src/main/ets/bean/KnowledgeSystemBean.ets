import { ArrayList } from '@kit.ArkTS'

export interface KnowledgeSystemBean {
  children: ArrayList<KnowledgeSystemBean>,
  courseId: number,
  id: number,
  name: String,
  order: number,
  parentChapterId: number,
  userControlSetTop: Boolean,
  visible: number,
  icon: String,
  link: String
}