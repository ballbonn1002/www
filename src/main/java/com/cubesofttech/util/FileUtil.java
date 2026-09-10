package com.cubesofttech.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileUtil {
	
	private FileUtil(){
	}
	public static void upload(File file, String filePath, String fileName) throws Exception {

		FileInputStream inps = null;
		FileOutputStream outs = null;
		try {
			File destination = new File(filePath + fileName);
			File parentDir = destination.getParentFile();
			if (parentDir != null && !parentDir.exists()) {
				parentDir.mkdirs();
			}

			inps = new FileInputStream(file);
			outs = new FileOutputStream(destination);

			int read = 0;
			byte[] bytes = new byte[1024];
			while ((read = inps.read(bytes)) != -1) {
				outs.write(bytes, 0, read);
			}
		} catch (IOException e) {
			throw e;
		} finally {
			if (inps != null) {
				inps.close();
			}
			if (outs != null) {
				outs.close();
			}
		}
	}
}
