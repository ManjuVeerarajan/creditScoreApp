package my.mobypay.creditScore.repository;


import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import my.mobypay.creditScore.dto.UserSearchRequest;


@Service
public interface AWSS3Service {

	/* void uploadFile(MultipartFile multipartFile, String entityId); */

	String uploadFile(String oUTPUT_DIR) throws Exception;
	
	

	byte[] downloadFile(String keyName);
}
