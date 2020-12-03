package com.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Calendar;

import javax.servlet.http.HttpServletResponse;

public class FileManager {

	//File upload
		public static String doFileUpload(File file, String originalFileName, String path) {
			
			String newFileName = "";
			
			if(file==null) {
				return null;
			}
			
			
			if(originalFileName.equals("")) {
				return null;
			}
			
			//확장자 분리
			String fileExt = originalFileName.substring(originalFileName.lastIndexOf("."));
			
			if(fileExt==null||fileExt.equals("")) {
				return null;
			}
			
			//서버에 저장할 새로운 파일명을 생성(saveFilename)
			newFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tI%1$tS", Calendar.getInstance());
			newFileName += System.nanoTime();  //중복값우려
			newFileName += fileExt;
			
			//폴더 경로 설정
			File f = new File(path);
			if(!f.exists()) {
				f.mkdirs();
			}
			
			String fullFilePath = path + File.separator + newFileName;
			
			//파일 업로드 - 반복문을 안써도 올라감.
			try {
				FileInputStream fis = new FileInputStream(file);
				FileOutputStream fos = new FileOutputStream(fullFilePath);
				int data = 0 ;
				byte[] buffer = new byte[1024];
				while((data=fis.read(buffer, 0, 1024))!=-1) {
					fos.write(buffer,0,data);
				}
				fos.close();
				fis.close();
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
			return newFileName;
		}

	// File download
	public static boolean doFileDownload(HttpServletResponse response, String saveFileName, String originalFileName,
			String path) {
		try {
			String filePath = path + File.separator + saveFileName;
			if (originalFileName == null || originalFileName.equals("")) {
				originalFileName = saveFileName;
			}
			// 파일을 다운받아 클라이언트 컴퓨터에 파일이름을 생성시 한글 깨짐 방지 코딩.
			originalFileName = new String(originalFileName.getBytes("euc-kr"), "ISO-8859-1");
			System.out.println(filePath);
			File f = new File(filePath);

			// 파일이 없을경우 중지
			if (!f.exists())
				return false;

			// 파일형식.
			response.setContentType("application/octet-stream");
			response.setHeader("Content-disposition", "attachment;fileName=" + originalFileName);

			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));

			OutputStream out = response.getOutputStream();

			int n;
			byte[] data = new byte[4096];
			while ((n = bis.read(data, 0, 4096)) != -1) {
				out.write(data, 0, n);
			}
			out.flush();
			out.close();
			bis.close();

		} catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}
		return true;
	}

	public static void doFileDelete(String fileName, String path) {
		try {
			String filePath = path + File.separator + fileName;

			File f = new File(filePath);

			if (f.exists())
				f.delete(); // 파일삭제 (물리적인 파일위치만 삭제하고, DB내용은 DAO에서 삭제함)
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
}
