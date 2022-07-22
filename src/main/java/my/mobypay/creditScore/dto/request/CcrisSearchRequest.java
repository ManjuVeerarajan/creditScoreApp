package my.mobypay.creditScore.dto.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlRootElement;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@JacksonXmlRootElement(localName = "request")
public class CcrisSearchRequest implements IRequest{

    @JsonProperty("ProductType")
    private String ProductType;

    @JsonProperty("GroupCode")
    private String GroupCode;

    @JsonProperty("EntityName")
    private String EntityName;

    @JsonProperty("EntityId")
    private String EntityId;

    @JsonProperty("EntityId2")
    private String EntityId2;

    @JsonProperty("Country")
    private String Country;

    @JsonProperty("DOB")
    private String DOB;
}
