package my.mobypay.creditScore.dto.request;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlRootElement;
import lombok.Data;

@Data
@JacksonXmlRootElement(localName = "xml")
public class CcrisRequestXml {

    @JacksonXmlProperty(localName = "request")
    private IRequest request;
}
