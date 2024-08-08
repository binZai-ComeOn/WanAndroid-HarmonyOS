/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { SideBarItem } from '../bean/SideBarItem';

export class Constants {
  /**
   * Index content width.
   */
  static readonly INDEX_CONTENT_WIDTH: string = '91.1%';
  /**
   * Index divider height.
   */
  static readonly DIVIDER_HEIGHT: number = 0.5;
  /**
   * Index divider width.
   */
  static readonly DIVIDER_WIDTH: string = '93%';
  /**
   * Drawer divider width.
   */
  static readonly DIVIDER_DRAWER_WIDTH: string = '90%';
  /**
   * Card title height.
   */
  static readonly CARD_TITLE_HEIGHT: number = 20;
  /**
   * Card text height.
   */
  static readonly CARD_TEXT_HEIGHT: number = 48;
  /**
   * Index title height.
   */
  static readonly INDEX_TITLE_HEIGHT: number = 112;
  /**
   * Full screen width.
   */
  static readonly FULL_WIDTH: string = '100%';
  /**
   * Full screen height.
   */
  static readonly FULL_HEIGHT: string = '100%';
  /**
   * Font size of unchecked title.
   */
  static readonly FONT_SIZE_UNCHECKED = 18;
  /**
   * Font size of checked title.
   */
  static readonly FONT_SIZE_CHECKED: number = 24;
  /**
   * Content height.
   */
  static readonly CONTENT_HEIGHT: number = 300;
  /**
   * List height.
   */
  static readonly LIST_HEIGHT: number = 48;
  /**
   * List card width.
   */
  static readonly LIST_CARD_WIDTH: number = 272;
  /**
   * List card height.
   */
  static readonly LIST_CARD_HEIGHT: number = 344;
  /**
   * List content height.
   */
  static readonly LIST_CONTENT_HEIGHT: string = '110%';
  /**
   * Background tab height.
   */
  static readonly BACKGROUND_TAB_HEIGHT: number = 40;
  /**
   * Index button height.
   */
  static readonly INDEX_BUTTON_HEIGHT: number = 60;
  /**
   * Background tab width.
   */
  static readonly BACKGROUND_TAB_WIDTH: number = 96;
  /**
   * Drawer width.
   */
  static readonly DRAWER_WIDTH: number = 264;
  /**
   * Sub tab width.
   */
  static readonly SUB_TAB_WIDTH: number = 56;
  /**
   * Sub slide width.
   */
  static readonly SUB_SLIDE_TAB_WIDTH: number = 56;
  /**
   * Sub tab bottom height.
   */
  static readonly SUB_TAB_BOT_HEIGHT: number = 25;
  /**
   * Sub tab width.
   */
  static readonly SUB_TAB_HEIGHT: number = 30;
  /**
   * Sub list width.
   */
  static readonly SUB_LIST_WIDTH: string = '85%';
  /**
   * Side tab width.
   */
  static readonly SIDE_TAB_WIDTH: string = '27.8%';
  /**
   * Side contend width.
   */
  static readonly SIDE_CONTEND_WIDTH: string = '72.2%';
  /**
   * Tab index0.
   */
  static readonly TAB_INDEX_ZERO: number = 0;
  /**
   * Tab index1.
   */
  static readonly TAB_INDEX_ONE: number = 1;
  /**
   * Tab index2.
   */
  static readonly TAB_INDEX_TWO: number = 2;
  /**
   * Tab index3.
   */
  static readonly TAB_INDEX_THREE: number = 3;
  /**
   * Tab index4.
   */
  static readonly TAB_INDEX_FOUR: number = 4;
  /**
   * Tab index5.
   */
  static readonly TAB_INDEX_FIVE: number = 5;
  /**
   * Image tab size.
   */
  static readonly IMAGE_SIZE_TAB: number = 22;
  /**
   * Image middle size.
   */
  static readonly IMAGE_SIZE_MIDDLE: number = 56;
  /**
   * More image width.
   */
  static readonly MORE_IMAGE_WIDTH: number = 20;
  /**
   * More image height.
   */
  static readonly MORE_IMAGE_HEIGHT: number = 15;
  /**
   * Drawer image height or width.
   */
  static readonly DRAWER_IMAGE_HEIGHT_WIDTH: number = 24;
  /**
   * List image height or width.
   */
  static readonly LIST_IMAGE_HEIGHT_WIDTH: number = 40;
  /**
   * Image offset.
   */
  static readonly IMAGE_OFFSET: number = -15;
  /**
   * Icon offset.
   */
  static readonly ICON_Offset: number = -3;
  /**
   * Animation duration.
   */
  static readonly ANIMATION_DURATION: number = 300;
  /**
   * Margin sixteen.
   */
  static readonly MARGIN_SIXTEEN: number = 16;
  /**
   * Margin button top.
   */
  static readonly MARGIN_BUTTON_TOP: number = 48;
  /**
   * Translate top.
   */
  static readonly TRANSLATE_TOP: number = -40;
  /**
   * Translate bottom.
   */
  static readonly TRANSLATE_BOTTOM: number = 40;
  /**
   * Border radius drawer.
   */
  static readonly BORDER_RADIUS_DRAWER: number = 16;
  /**
   * Border radius index list.
   */
  static readonly BORDER_RADIUS_INDEX_LIST: number = 18;
  /**
   * Border radius drawer content.
   */
  static readonly BORDER_RADIUS_DRAWER_CONTENT: number = 20;
  /**
   * Border radius back tab.
   */
  static readonly BORDER_RADIUS_BACK_TAB: number = 21;
  /**
   * Divider strokeWidth.
   */
  static readonly STROKE_WIDTH: number = 2;
  /**
   * Slice index index0.
   */
  static readonly SLICE_INDEX_ZERO: number = 0;
  /**
   * Slice index index6.
   */
  static readonly SLICE_INDEX_SIX: number = 6;
  /**
   * fontWeight.
   */
  static readonly FONT_WEIGHT_TAB: number = 600;
  /**
   * TopTabData.
   */
  static readonly TOP_TAB_DATA: string[] = ['文学', '交友', '直播', '视频', '盛典', '潮玩'];
  /**
   * The interval for switching between swipers
   */
  static readonly SWIPER_INTERVAL: number = 3500;
  /**
   * Swipe duration
   */
  static readonly SWIPER_DURATION: number = 500;
  /**
   * Swipe project space
   */
  static readonly SWIPER_ITEM_SPACE: number = 10;
  /**
   * Sidebar functions item list
   */
  static readonly SIDE_BAR_LIST: Array<SideBarItem> =
    Array<SideBarItem>(new SideBarItem($r('app.media.ic_delete'), $r('app.string.integral'), "100"),
      new SideBarItem($r('app.media.ic_collect'), $r('app.string.collect'), ""),
      new SideBarItem($r('app.media.ic_my_share'), $r('app.string.my_share'), ""),
      new SideBarItem($r('app.media.ic_theme'), $r('app.string.theme'), ""),
      new SideBarItem($r('app.media.ic_setting'), $r('app.string.setting'), ""),
      new SideBarItem($r('app.media.ic_logout'), $r('app.string.logout'), ""));

  /**
   * SystemPage.ets TabBars values
   */
  public static readonly SYSTEM_PAGE_TABBARS: Resource[] = [$r('app.string.system') , $r('app.string.navigation') ];

  /**
   * TabBars un select text font weight.
   */
  public static readonly TAB_BARS_UN_SELECT_TEXT_FONT_WEIGHT: number = 400;

  /**
   * TabBars select text font weight.
   */
  public static readonly TAB_BARS_SELECT_TEXT_FONT_WEIGHT: number = 700;

  /**
   * TabBars bar height.
   */
  public static readonly TAB_BARS_BAR_HEIGHT: string = '3.6%';

  /**
   * TabBars bar width.
   */
  public static readonly TAB_BARS_BAR_WIDTH: string = '100%';

  /**
   * The spacing on the left side of the page.
   */
  public static readonly PAGE_MARGIN_LEFT: string = '20vh';

  /**
   * .The spacing on the right side of the page.
   */
  public static readonly PAGE_MARGIN_RIGHT: string = '20vh';

}