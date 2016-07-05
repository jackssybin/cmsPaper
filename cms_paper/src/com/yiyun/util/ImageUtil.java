package com.yiyun.util;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
/**
 * @说明 从网络获取图片到本地
 * @author 崔素强
 * @version 1.0
 * @since
 */
public class ImageUtil {
	/**
	 * 测试
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
//		getUrlImage();
		try {
			Map<Integer, String> map = readfile("D:\\resourcesfile\\images\\advertise\\toChange", null);
			for (int i = 0; i < map.size(); i++) {
			System.out.println(map.get(i) + " ==" + i);
			System.out.println();
			String oldpath = map.get(i);
			compressImage(map.get(i), "D:\\resourcesfile\\images\\advertise\\toChange\\_" + i + ".png", 100, 75);
			}
			} catch (Exception ex) {
			}
			System.out.println("ok"); 
	}

	private static void getUrlImage() {
		String url = "http://www.baidu.com/img/baidu_sylogo1.gif";
		url = "http://wx.qlogo.cn/mmopen/YhtdxGrZ4AxyibiaDGV0EPxo48f13xKzibddgtF7tS8LcrrAB8BkTEoKopKJ5fpUUuCTIV9OTPEAvF0OuRr8ztOCiawyORyewhDh/0";
		byte[] btImg = getImageFromNetByUrl(url);
		if (null != btImg && btImg.length > 0) {
			System.out.println("读取到：" + btImg.length + " 字节");
			String fileName = "百度.gif";
			writeImageToDisk(btImg, fileName,"");
		} else {
			System.out.println("没有从该连接获得内容");
		}
	}

	/**
	 * 将图片写入到磁盘
	 * 
	 * @param img
	 *            图片数据流
	 * @param fileName
	 *            文件保存时的名称
	 */
	public static void writeImageToDisk(byte[] img, String fileName,String filePath) {
		try {
			File file = null;
			if("".equals(filePath)){
				file=new File("D:\\" + fileName);
			}else{
				file=new File(filePath);
			}
			FileOutputStream fops = new FileOutputStream(file);
			fops.write(img);
			fops.flush();
			fops.close();
//			System.out.println("图片已经写入到D盘");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 根据地址获得数据的字节流
	 * 
	 * @param strUrl
	 *            网络连接地址
	 * @return
	 */
	public static byte[] getImageFromNetByUrl(String strUrl) {
		try {
			URL url = new URL(strUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setConnectTimeout(5 * 1000);
			InputStream inStream = conn.getInputStream();// 通过输入流获取图片数据
			byte[] btImg = readInputStream(inStream);// 得到图片的二进制数据
			return btImg;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 从输入流中获取数据
	 * 
	 * @param inStream
	 *            输入流
	 * @return
	 * @throws Exception
	 */
	public static byte[] readInputStream(InputStream inStream) throws Exception {
		ByteArrayOutputStream outStream = new ByteArrayOutputStream();
		byte[] buffer = new byte[1024];
		int len = 0;
		while ((len = inStream.read(buffer)) != -1) {
			outStream.write(buffer, 0, len);
		}
		inStream.close();
		return outStream.toByteArray();
	}
	
	 /** * 图片文件读取 * * @param srcImgPath * @return */ 
    private static BufferedImage InputImage(String srcImgPath) { 
        BufferedImage srcImage = null; 
        try { 
            FileInputStream in = new FileInputStream(srcImgPath); 
            srcImage = javax.imageio.ImageIO.read(in); 
        } catch (IOException e) { 
            System.out.println("读取图片文件出错！" + e.getMessage()); 
            e.printStackTrace(); 
        } 
        return srcImage; 
    }  
    
    /**
     * * 将图片按照指定的图片尺寸压缩 * * @param srcImgPath :源图片路径 * @param outImgPath *
     * :输出的压缩图片的路径 * @param new_w * :压缩后的图片宽 * @param new_h * :压缩后的图片高
     */ 
    public static void compressImage(String srcImgPath, String outImgPath, 
            int new_w, int new_h) { 
        BufferedImage src = InputImage(srcImgPath); 
        disposeImage(src, outImgPath, new_w, new_h); 
    }  
    
    /**
     * * 指定长或者宽的最大值来压缩图片 * * @param srcImgPath * :源图片路径 * @param outImgPath *
     * :输出的压缩图片的路径 * @param maxLength * :长或者宽的最大值
     */ 
    public static void compressImage(String srcImgPath, String outImgPath, 
            int maxLength) { 
        // 得到图片 
        BufferedImage src = InputImage(srcImgPath); 
        if (null != src) { 
            int old_w = src.getWidth(); 
            // 得到源图宽 
            int old_h = src.getHeight(); 
            // 得到源图长 
            int new_w = 0; 
            // 新图的宽 
            int new_h = 0; 
            // 新图的长 
            // 根据图片尺寸压缩比得到新图的尺寸 
            if (old_w > old_h) { 
                // 图片要缩放的比例 
                new_w = maxLength; 
                new_h = (int) Math.round(old_h * ((float) maxLength / old_w)); 
            } else { 
                new_w = (int) Math.round(old_w * ((float) maxLength / old_h)); 
                new_h = maxLength; 
            } 
            disposeImage(src, outImgPath, new_w, new_h); 
        } 
    } 
    
//    ByteArrayInputStream in = new ByteArrayInputStream(byte[]b);    //将b作为输入流；
//
//    BufferedImage image = ImageIO.read(InputStream in);     //将in作为输入流，读取图片存入image中，而这里in可以为ByteArrayInputStream();
    public synchronized static void disposeImage(byte[] src, 
            String outImgPath, int new_w, int new_h) throws IOException{
    	ByteArrayInputStream in = new ByteArrayInputStream(src);
    	BufferedImage image = ImageIO.read(in);
    	disposeImage(image,outImgPath,new_w,new_h);
    }
    
    /** * 处理图片 * * @param src * @param outImgPath * @param new_w * @param new_h */ 
    private synchronized static void disposeImage(BufferedImage src, 
            String outImgPath, int new_w, int new_h) { 
        // 得到图片 
        int old_w = src.getWidth(); 
        // 得到源图宽 
        int old_h = src.getHeight(); 
        // 得到源图长 
        BufferedImage newImg = null; 
        // 判断输入图片的类型 
        switch (src.getType()) { 
        case 13: 
            // png,gifnewImg = new BufferedImage(new_w, new_h, 
            // BufferedImage.TYPE_4BYTE_ABGR); 
            break; 
        default: 
            newImg = new BufferedImage(new_w, new_h, BufferedImage.TYPE_INT_RGB); 
            break; 
        } 
        Graphics2D g = newImg.createGraphics(); 
        // 从原图上取颜色绘制新图 
        g.drawImage(src, 0, 0, old_w, old_h, null); 
        g.dispose(); 
        // 根据图片尺寸压缩比得到新图的尺寸 
        newImg.getGraphics().drawImage( 
                src.getScaledInstance(new_w, new_h, Image.SCALE_SMOOTH), 0, 0, 
                null); 
        // 调用方法输出图片文件 
        OutImage(outImgPath, newImg); 
    }  
    
    /**
     * * 将图片文件输出到指定的路径，并可设定压缩质量 * * @param outImgPath * @param newImg * @param
     * per
     */ 
    private static void OutImage(String outImgPath, BufferedImage newImg) { 
        // 判断输出的文件夹路径是否存在，不存在则创建 
        File file = new File(outImgPath); 
        if (!file.getParentFile().exists()) { 
            file.getParentFile().mkdirs(); 
        }// 输出到文件流 
        try { 
            ImageIO.write(newImg, outImgPath.substring(outImgPath 
                    .lastIndexOf(".") + 1), new File(outImgPath)); 
        } catch (FileNotFoundException e) { 
            e.printStackTrace(); 
        } catch (IOException e) { 
            e.printStackTrace(); 
        } 
	}

	public static Map<Integer, String> readfile(String filepath, Map<Integer, String> pathMap) throws Exception {
		if (pathMap == null) {
			pathMap = new HashMap<Integer, String>();
		}

		File file = new File(filepath);
		// 文件
		if (!file.isDirectory()) {
			pathMap.put(pathMap.size(), file.getPath());

		} else if (file.isDirectory()) { // 如果是目录， 遍历所有子目录取出所有文件名
			String[] filelist = file.list();
			for (int i = 0; i < filelist.length; i++) {
				File readfile = new File(filepath + "/" + filelist[i]);
				if (!readfile.isDirectory()) {
					pathMap.put(pathMap.size(), readfile.getPath());

				} else if (readfile.isDirectory()) { // 子目录的目录
					readfile(filepath + "/" + filelist[i], pathMap);
				}
			}
		}
		return pathMap;
	}
	
}