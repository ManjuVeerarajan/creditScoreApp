package my.mobypay.creditScore.dto.response;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlElementWrapper;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlRootElement;
import lombok.Data;

import java.util.List;

@Data
@JacksonXmlRootElement(localName = "xml")
public class CcrisXml {

    @JacksonXmlElementWrapper(localName = "ccris_identity")
    @JacksonXmlProperty(localName = "item")
    private List<Item> itemList;
    private String error;
   	private String code;
   	private String DBMessage;
}
