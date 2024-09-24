export default class TimeUtil {
  private static date = new Date()

  /**
   * Obtain the current time
   * @returns the current time
   */
  static getNowTime() : string {
    let date = TimeUtil.date
    // 获取年、月、日、时、分、秒
    let year = date.getFullYear();
    let month = (date.getMonth() + 1).toString().padStart(2, '0'); // 月份从0开始，所以要加1
    let day = date.getDate().toString().padStart(2, '0');
    let hours = date.getHours().toString().padStart(2, '0');
    let minutes = date.getMinutes().toString().padStart(2, '0');
    let seconds = date.getSeconds().toString().padStart(2, '0');

    // 格式化为 "YYYY-MM-DD HH:MM:SS" 格式的字符串
    let formattedDate = `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
    return formattedDate
  }

  /**
   * Conversion from milliseconds to time
   * @param millisecond
   * @returns time
   */
  static millisecond2Time(millisecond: number): string {
    let date = TimeUtil.date
    // 使用 Date 对象将时间戳转换为日期
    date.setTime(millisecond)
    // 格式化输出日期和时间
    let year = date.getFullYear();
    let month = (date.getMonth() + 1).toString().padStart(2, '0'); // 月份从0开始，所以要加1
    let day = date.getDate().toString().padStart(2, '0');
    let hours = date.getHours().toString().padStart(2, '0');
    let minutes = date.getMinutes().toString().padStart(2, '0');
    let seconds = date.getSeconds().toString().padStart(2, '0');
    // 格式化为 "YYYY-MM-DD HH:MM:SS" 格式的字符串
    let formattedDate = `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
    return formattedDate
  }
}