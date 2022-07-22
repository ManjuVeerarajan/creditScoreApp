package my.mobypay.creditScore.dto.request;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlRootElement;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@JacksonXmlRootElement(localName = "request")
public class TokensRequest implements IRequest{

    private String token1;
    private String token2;

}
