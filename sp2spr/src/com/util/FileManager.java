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
			
			//Ȯ���� �и�
			String fileExt = originalFileName.substring(originalFileName.lastIndexOf("."));
			
			if(fileExt==null||fileExt.equals("")) {
				return null;
			}
			
			//������ ������ ���ο� ���ϸ��� ����(saveFilename)
			newFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tI%1$tS", Calendar.getInstance());
			newFileName += System.nanoTime();  //�ߺ������
			newFileName += fileExt;
			
			//���� ��� ����
			File f = new File(path);
			if(!f.exists()) {
				f.mkdirs();
			}
			
			String fullFilePath = path + File.separator + newFileName;
			
			//���� ���ε� - �ݺ����� �Ƚᵵ �ö�.
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
			// ������ �ٿ�޾� Ŭ���̾�Ʈ ��ǻ�Ϳ� �����̸��� ������ �ѱ� ���� ���� �ڵ�.
			originalFileName = new String(originalFileName.getBytes("euc-kr"), "ISO-8859-1");
			System.out.println(filePath);
			File f = new File(filePath);

			// ������ ������� ����
			if (!f.exists())
				return false;

			// ��������.
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
				f.delete(); // ���ϻ��� (�������� ������ġ�� �����ϰ�, DB������ DAO���� ������)
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
}
