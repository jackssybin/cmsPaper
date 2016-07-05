
package com.yiyun.util;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

public class DateUtil {
	private final static SimpleDateFormat sdfYear = new SimpleDateFormat("yyyy");

	private final static SimpleDateFormat sdfDay = new SimpleDateFormat(
			"yyyy-MM-dd");
	
	private final static SimpleDateFormat sdfDays = new SimpleDateFormat(
	"yyyyMMdd");

	private final static SimpleDateFormat sdfTime = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");
	
	private final static SimpleDateFormat sdfTimeZone = new SimpleDateFormat(
			"yyyyMMddHHmmss");
	private final static SimpleDateFormat sdfTimeNow = new SimpleDateFormat(
			"HHmmss");
	
	public static final String longTimeStr="yyyy-MM-dd HH:mm:ss";

	/**
	 * 获取YYYY格式
	 * 
	 * @return
	 */
	public static String getYear() {
		return sdfYear.format(new Date());
	}

	/**
	 * 获取YYYY-MM-DD格式
	 * 
	 * @return
	 */
	public static String getDay() {
		return sdfDay.format(new Date());
	}
	
	/**
	 * 获取YYYYMMDD格式
	 * 
	 * @return
	 */
	public static String getDays(){
		return sdfDays.format(new Date());
	}
	public static String getTimes(){
		return sdfTimeNow.format(new Date());
	}
	
	

	public static String getDaysyyyyMMddHHmmss(){
		return sdfTimeZone.format(new Date());
	}
	
	/**
	 * 获取YYYY-MM-DD HH:mm:ss格式
	 * 
	 * @return
	 */
	public static String getTime() {
		return sdfTime.format(new Date());
	}

	/**
	* @Title: compareDate
	* @Description: TODO(日期比较，如果s>=e 返回true 否则返回false)
	* @param s
	* @param e
	* @return boolean  
	* @throws
	 */
	public static boolean compareDate(String s, String e) {
		if(fomatDate(s)==null||fomatDate(e)==null){
			return false;
		}
		return fomatDate(s).getTime() <=fomatDate(e).getTime();
	}
	
	public static boolean compareThreeeDate(String start, String end){
		String mid=getDay();
		return compareDate(start,mid)&&compareDate(mid,end)&&compareDate(start,end);
	}

	/**
	 * 格式化日期
	 * 
	 * @return
	 */
	public static Date fomatDate(String date,String format) {
		DateFormat fmt = new SimpleDateFormat(format);
		try {
			return fmt.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static Date fomatDate(String date){
		return fomatDate(date,"yyyy-MM-dd");
	}
	
	public  static Date fomatLongDate(String date){
		return fomatDate(date,"yyyy-MM-dd HH:mm:ss");
	}
	
	//2016-05-18 12:01:53

	/**
	 * 校验日期是否合法
	 * 
	 * @return
	 */
	public static boolean isValidDate(String s) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			fmt.parse(s);
			return true;
		} catch (Exception e) {
			// 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
			return false;
		}
	}
	public static int getDiffYear(String startTime,String endTime) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			long aa=0;
			int years=(int) (((fmt.parse(endTime).getTime()-fmt.parse(startTime).getTime())/ (1000 * 60 * 60 * 24))/365);
			return years;
		} catch (Exception e) {
			// 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
			return 0;
		}
	}
	  /**
     * <li>功能描述：时间相减得到天数
     * @param beginDateStr
     * @param endDateStr
     * @return
     * long 
     * @author Administrator
     */
    public static long getDaySub(String beginDateStr,String endDateStr){
        long day=0;
        java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");
        java.util.Date beginDate = null;
        java.util.Date endDate = null;
        
            try {
				beginDate = format.parse(beginDateStr);
				endDate= format.parse(endDateStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}
            day=(endDate.getTime()-beginDate.getTime())/(24*60*60*1000);
            //System.out.println("相隔的天数="+day);
      
        return day;
    }
   /* gc.add(1,-1)表示年份减一.
    *gc.add(2,-1)表示半年 减一.
    *gc.add(3.-1)表示月份减一.
    *gc.add(4.-1)表示周 减一.
    *gc.add(5,-1)表示天减一.*/
    public static Date getOperDate(Date date,int oper){
    	GregorianCalendar gc=new GregorianCalendar();
    	gc.setTime(date);
    	gc.add(5,1); 
    	   return gc.getTime();
    	
    }
    
    public static Date getOperDate(String datestr,int oper){
    	return getOperDate(fomatLongDate(datestr),1);
    	
    }
    
    /**
     * 得到n天之后的日期
     * @param days
     * @return
     */
    public static String getAfterDayDate(String days) {
    	int daysInt = Integer.parseInt(days);
    	
        Calendar canlendar = Calendar.getInstance(); // java.util包
        canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
        Date date = canlendar.getTime();
        
        SimpleDateFormat sdfd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateStr = sdfd.format(date);
        
        return dateStr;
    }
    public static String getAfterMonthDate(String months) {
        return getAfterDayDate(getMonthDays(Integer.valueOf(months)));
    }
    
    public static String getMonthDays(int months){
    	int currentMoth=getCurrentMonth();
    	int monthEnd=currentMoth+months;
    	int alldays=0;
    		for(int i=currentMoth;i<monthEnd;i++){
    			alldays+=getMonthDay(i);
    		}
    	return ""+alldays;
    }
    
    
    public static int  getMonthDay(int month){
    	
    	if(month==1||month==3||month==5||month==7||month==8||month==10||month==12)
    		return 31;
    	if(month==4||month==6||month==9||month==11)
    		return 30;
    	if(month==2){
    		 Calendar cal = Calendar.getInstance(Locale.CHINA);
    		 int year = cal.get(Calendar.YEAR);
    		 if(leapYear(year)){
    			 return 29;
    		 }
    		 return 28;
    	}
		return month;
    }
    
    public static boolean leapYear(int year)
	{
		if(((year%100==0)&&(year%400==0))||((year%100!=0)&&(year%4==0)))
			return  true;
		
		return false;
	}
    
    public static int getCurrentMonth(){
    	Calendar cal = Calendar.getInstance(Locale.CHINA);
    	 int month = cal.get(Calendar.MONTH) + 1;
    	 return month;
    }
    
    public static int getDayOfMonth(){
		Calendar cal = Calendar.getInstance(Locale.CHINA);
		int allday=cal.getActualMaximum(Calendar.DATE);
		int day = cal.get(Calendar.DATE);
	    int month = cal.get(Calendar.MONTH) + 1;
	    int year = cal.get(Calendar.YEAR);
	    int dow = cal.get(Calendar.DAY_OF_WEEK);
	    int dom = cal.get(Calendar.DAY_OF_MONTH);
	    int doy = cal.get(Calendar.DAY_OF_YEAR);
		return day;
	}
    
    /**
     * 得到n天之后是周几
     * @param days
     * @return
     */
    public static String getAfterDayWeek(String days) {
    	int daysInt = Integer.parseInt(days);
    	
        Calendar canlendar = Calendar.getInstance(); // java.util包
        canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
        Date date = canlendar.getTime();
        
        SimpleDateFormat sdf = new SimpleDateFormat("E");
        String dateStr = sdf.format(date);
        
        return dateStr;
    }
    
    public static void main(String[] args) {
//    	System.out.println(getDays());
//    	System.out.println(getDaysyyyyMMddHHmmss());
//    	System.out.println(getDays());
//    	System.out.println(getTimes());
//    	System.out.println(getAfterMonthDate("10"));
    	
    	System.out.println(compareDate("2016-05-01","2016-05-31"));
    	System.out.println(compareThreeeDate("2016-05-25","2016-05-24"));
//    	System.out.println(fomatLongDate("2016-05-18 12:01:53"));
//    	System.out.println(getOperDate(fomatLongDate("2016-05-18 12:01:53"),1));
//    	Date nowDate=new Date();
//    	Date comparDate=DateUtil.getOperDate("2016-05-16 12:01:53",1);
//		int compareless=comparDate.compareTo(nowDate);
//		System.out.println("nowDate="+nowDate+" comparDate="+comparDate+" compareless="+compareless);
//    	System.out.println(getAfterDayWeek("3"));
    }

}
