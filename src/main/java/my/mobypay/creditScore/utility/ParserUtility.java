package my.mobypay.creditScore.utility;

import com.fasterxml.jackson.dataformat.xml.XmlMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ParserUtility {

   public static <T> T xml2Pojo(String content, Class<T> valueType) {
        try {
            XmlMapper xmlMapper = new XmlMapper();
            Object pojo = xmlMapper.readValue(content, valueType);
            return (T) pojo;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
