package com.poly.asm_nv3.ServiceImpl;

import com.poly.asm_nv3.Service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class UploadServiceImpl implements UploadService {

    @Autowired
    private ServletContext app;

    @Override
    public File save(MultipartFile file, String folder) {
        String baseDir = System.getProperty("user.dir");
        String folderPath = baseDir + File.separator + "src" + File.separator + "main" + File.separator + "resources" + File.separator + "static" + File.separator + "assets" + File.separator + folder;
        File directory = new File(folderPath);

        if (!directory.exists()) {
            directory.mkdirs();
        }

       SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
    String dateTimeString = dateFormat.format(new Date());

    // Get the original filename
    String originalFilename = file.getOriginalFilename();

    // Generate the filename using date and time information
    String fileName = dateTimeString + "-" + originalFilename;

    File savedFile = new File(directory, fileName);

        try {
            System.out.println(directory);
            file.transferTo(savedFile);
            return savedFile;
        } catch (IOException e) {
            throw new RuntimeException("Failed to save file", e);
        }
    }
}